from dataclasses import dataclass
from pathlib import Path
import json
import regex as re
import numpy as np
from math import log10


@dataclass
class BlockInfo:
    channel: str
    position: tuple[int, int, int]

    lf_name: str
    lf_lambda: int

    sse: float
    mse: float
    psnr: float
    max_abs_error: float
    bytes: int
    bpp: float


def avg(x):
    '''
    The average of a list like object.
    '''
    return sum(x) / len(x)


def extract_blocks(report_file: Path | str) -> list[BlockInfo]:
    '''
    Reads a report file and returns a list of BlockInfo.
    '''

    report_file = Path(report_file)
    
    with open(report_file) as file:
        quality_data = json.load(file)

    # The lambda is the first number that appears in the file name
    numbers_in_filename = re.findall(r"[0-9]+", str(report_file.name))
    text_in_filename = re.findall(r"[^0-9]+[a-zA-Z]", str(report_file.name))

    lf_lambda = numbers_in_filename[-1] if numbers_in_filename else 0
    lf_name = text_in_filename[-1] if text_in_filename else ""

    t = quality_data["codestream_0"]["transform_length_t"]
    s = quality_data["codestream_0"]["transform_length_s"]
    v = quality_data["codestream_0"]["transform_length_v"]
    u = quality_data["codestream_0"]["transform_length_u"]
    block_size = t*s*v*u

    blocks_info = []

    for channel_key, channel in quality_data["codestream_0"]["block_information"].items():
        for block_key, block in channel.items():
            block_info = BlockInfo(
                channel = channel_key,
                position = tuple(int(i) for i in block_key.split(", ")),

                lf_name = lf_name,
                lf_lambda = int(lf_lambda),

                sse = float(block["sse"]),
                mse = float(block["mse"]),
                psnr = float(block["psnr"]),
                max_abs_error = float(block["max_abs_error"]),
                bytes = int(block["bytes"]),
                bpp = 8*block["bytes"] / block_size,
            )

            blocks_info.append(block_info)

    return blocks_info


def rd_for_blocks(blocks: list[BlockInfo], metric="psnr"):
    '''
    Receives a list of BlockInfo and returs two sorted lists
    of rates and distortions, ready to be plotted by matplotlib.
    '''

    rate = [block.bpp for block in blocks]

    if metric.lower() == "psnr":
        distortion = [block.psnr for block in blocks]
    elif metric.lower() == "sse":
        distortion = [block.sse for block in blocks]
    elif metric.lower() == "mse":
        distortion = [block.mse for block in blocks]
    elif metric.lower() == "max_abs_error":
        distortion = [block.max_abs_error for block in blocks]
    else:
        raise NotImplementedError(f"Metric {metric} not implemented")

    return rate, distortion


def average_rd_for_blocks(blocks: list[BlockInfo], metric="psnr"):
    rate = avg([block.bpp for block in blocks])

    if metric.lower() == "psnr":
        mse = avg([block.mse for block in blocks])
        distortion = 10 * log10(1023*1023 / mse)
    elif metric.lower() == "sse":
        distortion = avg([block.sse for block in blocks])
    elif metric.lower() == "mse":
        distortion = avg([block.mse for block in blocks])
    elif metric.lower() == "max_abs_error":
        distortion = avg([block.max_abs_error for block in blocks])
    else:
        raise NotImplementedError(f"Metric {metric} not implemented")

    return rate, distortion

def rd_by_lambda(blocks: list[BlockInfo]):
    blocks.sort(key=lambda x: x.lf_lambda)
    rds = [block.bpp * block.mse for block in blocks]
    lf_lambdas = [block.lf_lambda for block in blocks]
    return lf_lambdas, rds