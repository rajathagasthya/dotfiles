#!/usr/bin/env python3

import datetime
import sys

template = """# {date}

## Daily checklist

### Work

* [ ]

### Personal

## General

## Meetings

## Projects

## Discoveries

## Misc

## Reflections
"""

print(template.format(date=datetime.date.today().isoformat()))
