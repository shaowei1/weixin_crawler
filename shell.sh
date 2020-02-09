#docker rm es7_cold
#docker rm es7_hot
#docker rm es7_warm
#
#docker rm hwc_cerebro
#docker rm hwc_kibana7
#docker rm hwc_cerebro

docker build -t weixin_crawler -f Dockerfile /root/weixin_crawler
docker run  -t -i --env-file /root/weixin_crawler/.env.example -v /root/weixin_crawler/app/:/app -p 80:5000 --name weixin_crawler --network weixin_crawler_hwc_es7net weixin_crawler:latest
