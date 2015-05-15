if [ `which jq` ]; then
    curl -s https://gist.githubusercontent.com/syui/f757c3f860659201c897/raw/macbook-model.json | jq .\"`system_profiler SPHardwareDataType | grep "Model Iden" | tr -d ' ' | cut -d : -f 2`\"
else
    curl -s https://gist.githubusercontent.com/syui/f757c3f860659201c897/raw/macbook-model.json | grep -A 2 "`system_profiler SPHardwareDataType | grep "Model Iden" | tr -d ' ' | cut -d : -f 2`"
fi
