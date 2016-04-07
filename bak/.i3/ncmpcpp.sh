#!/bin/bash

ncmpcpp --current-song "$4[%l]: $3%t $8- $2%a$9" | tail
