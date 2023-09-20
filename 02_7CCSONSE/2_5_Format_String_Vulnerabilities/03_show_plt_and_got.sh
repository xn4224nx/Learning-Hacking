#!/bin/bash

readelf -S /bin/ls | grep -E 'plt|got'
