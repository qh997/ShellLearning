#!/bin/bash

echo $(expr 25 \* 4)
echo $((8 * (3 + 4)))
echo $(echo "scale = 3; 997 / 7" | bc)
echo $((2 ** 10))