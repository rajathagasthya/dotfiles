#!/usr/bin/env python
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
"""

print(template.format(date=datetime.date.today().isoformat()))
