# hyperliquid-nonvalidator

## 0
### **Ubuntu 24.04 필수**

[Ubuntu](https://github.com/forfo1/Ubuntu24.04/blob/main/README.md) 먼저 하고오기.    

## 1
콘타보 접속 후 입력.

```
curl -s https://raw.githubusercontent.com/forfo1/hyperliquid/main/Hyperliquid-nonvalidator.sh | sudo bash
```
끝나면, 


## 2

hluser로 접속 (하이퍼리퀴드 노드는 root으로 실행안됨)    
```
su - hluser
```

스크린을 만들고    
```
screen -S hl
```

노드 실행커맨드    
```
~/hl-visor run-non-validator --evm
```

로그 주룩주룩 올라가면 Ctrl+A+D 로 스크린 나오기. error 104 , 111 은 네트워크 이슈입니다. 쟤네문제긔



나중에 스크린에 다시 접속하려면

```
screen -R hl
```


## 3

지갑만들기.


```
KEY=$(openssl rand -hex 32)
echo "{\"key\": \"$KEY\"}" > ~/hl/hyperliquid_data/node_config.json
echo "Key (프라이빗 키):"
echo $KEY
echo "validator address (지갑 주소):"
~/hl-node --chain Testnet print-address $KEY
```

키, 지갑주소 둘다 메모장에 저장해두고, 메타마스크에 프라이빗키 임포트하세요. (터미널에서 드래그하고 우클릭하면 복사됨)

## 4

**[Hyperliquid 퍼셋](https://app.hyperliquid-testnet.xyz/drip)**    
현재 아비트럼 세폴리아 네트워크.    

ETH, USDC 퍼셋 받아두기.    
*(근데 쌩지갑이라 그런지 ETH 안받아짐. 본지갑으로 퍼셋 받고 0.01ETH만 보내시긔 그럼 USDC는 받아짐.)*

여기서 끝은 아니긔.     
한 이틀 뒤에 하이퍼리퀴드 디스코드가서 티켓으로 발리데이터 화이트리스트 신청해야함, 그때 이 지갑주소도 제출.    
화이트리스트 등록되면 그뒤에 또 할거 있어윤 ㅎㅎ


## 개인적인생각

아마 VPS region 을 Tokyo 로 옮겨야 할수도있긔 발리데이터 돌리려면 얘네한테 티켓넘기고 허락맡아야하는데    
얘네 서버가 도쿄에있어서 네트워크 싱크가 유럽은 많이늦음.    
발리데이터 등록 안해주지 않을까 싶오 **그냥 내생각!!**    
옮긴다면 한달 $2.25 추가긔윤....
