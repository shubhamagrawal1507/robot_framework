#!/bin/bash

echo "Running Robot Framework Tests with Allure reporting..."
python -m robot \
  --listener allure_robotframework \
  --prerunmodifier allure_robotframework.testplan \
  --outputdir results \
  ./tests/test_api.robot \

echo "Opening Allure Report..."
allure serve output/allure
