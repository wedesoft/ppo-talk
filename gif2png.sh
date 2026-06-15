#!/bin/bash
ffmpeg -i $1 -vsync vfr frame_%04d.png
