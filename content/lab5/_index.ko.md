---
title: Lab 5. Finish Lab
weight: 20
pre: "<b>5. </b>"
---


EMR Hands-On Lab 실습이 완료되었습니다. 마지막으로 지금까지 실습 내에서 사용했던 리소스를 모두 삭제합니다.

아래 지시를 따라 실습 과정에서 생성한 리소스를 모두 삭제해 주시기 바랍니다.

# Kinesis Firehose
--- 

1. Kinesis Firehose 페이지에 접속합니다.
2. 사용했떤 Firehose delivery stream을 선택합니다.
    * emr-lab-delivery-stream
3. Delete를 클릭하여 삭제합니다.


# EC2 instances
--- 

1. EC2 페이지에 접속합니다.
2. 사용했던 EC2 instance를 삭제합니다.
    * EMRLAB-KIN
3. Action -> Instance State -> Terminate를 클릭하여 삭제합니다.


# S3 buckets
--- 

1. S3 페이지에 접속합니다.
2. 생성했떤 버킷을 선택합니다.
    * id-emr-lab-20200306
    * id-emr-lab-data-20200306
3. Delete를 클릭한 후 버킷 이름을 작성하여 삭제합니다.


# EMR clusters
--- 

1. EMR 페이지에 접속합니다.
2. 사용했던 EMR cluster를 선택합니다.
    * EMR-lab-adhoc-20200306
    * EMR-lab-batch-20200306
3. Terminate를 클릭하여 삭제합니다.

# 감사합니다 [설문하러 가기](https://www.surveymonkey.com/r/3V99DNP)


<p align="center">
© 2020 Amazon Web Services, Inc. 또는 자회사, All rights reserved.
</p>