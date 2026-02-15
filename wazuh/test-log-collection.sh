#!/bin/bash
# test-log-collection.sh
# Comprehensive test for Wazuh Log Collection

echo "════════════════════════════════════════════════════"
echo "   Wazuh Log Collection - Comprehensive Test"
echo "════════════════════════════════════════════════════"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Test 1: Failed SSH Login${NC}"
for i in {1..5}; do
  sshpass -p "wrongpassword" ssh -o StrictHostKeyChecking=no wronguser@localhost 2>/dev/null
  echo -n "."
  sleep 1
done
echo -e " ${GREEN}✓${NC}"
echo ""

echo -e "${YELLOW}Test 2: Successful sudo${NC}"
sudo ls /root > /dev/null 2>&1
echo -e " ${GREEN}✓${NC}"
echo ""

echo -e "${YELLOW}Test 3: Syslog messages${NC}"
logger "WAZUH_TEST: Authentication test - priority INFO"
logger -p auth.warning "WAZUH_TEST: Authentication warning"
logger -p auth.err "WAZUH_TEST: Authentication error"
echo -e " ${GREEN}✓${NC}"
echo ""

echo -e "${YELLOW}Test 4: Web requests${NC}"
for i in {1..5}; do
  curl -s http://localhost/ > /dev/null
  echo -n "."
done
echo -e " ${GREEN}✓${NC}"
echo ""

echo -e "${YELLOW}Test 5: 404 errors${NC}"
curl -s http://localhost/page1.html > /dev/null
curl -s http://localhost/page2.html > /dev/null
curl -s http://localhost/page3.html > /dev/null
echo -e " ${GREEN}✓${NC}"
echo ""

echo -e "${YELLOW}Test 6: Web attacks${NC}"
curl -s "http://localhost/?id=1' OR '1'='1" > /dev/null
curl -s "http://localhost/?q=<script>alert(1)</script>" > /dev/null
curl -s "http://localhost/../../../../etc/passwd" > /dev/null
echo -e " ${GREEN}✓${NC}"
echo ""

echo -e "${YELLOW}Test 7: JSON logs${NC}"
for i in {1..3}; do
  echo "{\"timestamp\":\"$(date -Iseconds)\",\"level\":\"INFO\",\"user\":\"user$i\",\"action\":\"test\",\"ip\":\"192.168.1.$((RANDOM%255))\"}" | sudo tee -a /var/log/app/application.json > /dev/null
done
echo -e " ${GREEN}✓${NC}"
echo ""

echo "════════════════════════════════════════════════════"
echo -e "${GREEN}All tests completed successfully!${NC}"
echo "════════════════════════════════════════════════════"
echo ""
echo "Next steps:"
echo "1. Wait 30 seconds for logs to be sent to Manager"
echo "2. Open Wazuh Dashboard: http://192.168.1.100"
echo "3. Go to Security Events"
echo "4. Filter by: agent.name:Kali-Linux-Agent"
echo "5. Check for events from the last 5 minutes"
echo ""
echo "Useful queries:"
echo "  - rule.groups:\"authentication\""
echo "  - rule.groups:\"web\""
echo "  - rule.id:5710  (failed SSH)"
echo "  - rule.id:31151 (SQL injection)"
echo "════════════════════════════════════════════════════"
