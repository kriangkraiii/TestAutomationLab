#!/bin/bash
# Quick Test Runner for Lab4 Tests
# Usage: ./run_lab4_tests.sh [option]
# Options: valid, invalid, all, help

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Lab4 Test Automation Runner${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check if server is running
if ! curl -f http://localhost:7272/Lab4/Registration.html >/dev/null 2>&1; then
    echo -e "${RED}❌ Test server is not running!${NC}"
    echo -e "${YELLOW}Please start the server first: ./start_server.sh${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Test server is running${NC}"
echo ""

# Create results directory
mkdir -p test_results/lab4

# Function to run tests
run_valid_tests() {
    echo -e "${BLUE}🧪 Running UAT-Lab04-001: Valid Registration Tests${NC}"
    robot --outputdir test_results/lab4 \
          --name "Lab4-Valid-Tests" \
          --loglevel INFO \
          lab4_valid.robot
    echo ""
}

run_invalid_tests() {
    echo -e "${BLUE}🧪 Running UAT-Lab04-002: Invalid Registration Tests${NC}"
    robot --outputdir test_results/lab4 \
          --name "Lab4-Invalid-Tests" \
          --loglevel INFO \
          lab4_invalid.robot
    echo ""
}

run_all_tests() {
    echo -e "${BLUE}🧪 Running All Lab4 Tests${NC}"
    robot --outputdir test_results/lab4 \
          --name "Lab4-All-Tests" \
          --loglevel INFO \
          lab4_valid.robot lab4_invalid.robot
    echo ""
}

show_help() {
    echo "Usage: ./run_lab4_tests.sh [option]"
    echo ""
    echo "Options:"
    echo "  valid     - Run only valid registration tests (UAT-Lab04-001)"
    echo "  invalid   - Run only invalid registration tests (UAT-Lab04-002)"
    echo "  all       - Run all Lab4 tests (default)"
    echo "  help      - Show this help message"
    echo ""
    echo "Examples:"
    echo "  ./run_lab4_tests.sh valid"
    echo "  ./run_lab4_tests.sh invalid"
    echo "  ./run_lab4_tests.sh all"
    echo ""
}

# Parse command line arguments
case "${1:-all}" in
    valid)
        run_valid_tests
        ;;
    invalid)
        run_invalid_tests
        ;;
    all)
        run_all_tests
        ;;
    help|--help|-h)
        show_help
        exit 0
        ;;
    *)
        echo -e "${RED}Invalid option: $1${NC}"
        echo ""
        show_help
        exit 1
        ;;
esac

# Check test results
if [ $? -eq 0 ]; then
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}✅ Test execution completed successfully${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo -e "${BLUE}📊 Test Reports:${NC}"
    echo -e "  - Report: ${YELLOW}test_results/lab4/report.html${NC}"
    echo -e "  - Log:    ${YELLOW}test_results/lab4/log.html${NC}"
    echo -e "  - Output: ${YELLOW}test_results/lab4/output.xml${NC}"
    echo ""
    echo -e "${BLUE}Open report in browser:${NC}"
    echo -e "  ${YELLOW}open test_results/lab4/report.html${NC}"
else
    echo -e "${RED}========================================${NC}"
    echo -e "${RED}❌ Test execution failed${NC}"
    echo -e "${RED}========================================${NC}"
    echo ""
    echo -e "${YELLOW}Check the log file for details:${NC}"
    echo -e "  ${YELLOW}test_results/lab4/log.html${NC}"
    exit 1
fi
