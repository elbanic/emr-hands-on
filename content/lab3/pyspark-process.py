import pyspark
from pyspark.sql import SparkSession
import pyspark.sql.functions as f
import sys

input = sys.argv[1]
output = sys.argv[2]

spark = SparkSession \
    .builder \
    .appName("Python Spark SQL basic example") \
    .config("spark.some.config.option", "some-value") \
    .getOrCreate()

log_raw = spark.read.format('com.databricks.spark.csv') \
    .options(header='false', inferschema='true') \
    .option("delimiter", "\t") \
    .load(input) \
    .cache()

splitter = pyspark.sql.functions.split(log_raw['_c0'], ' - - |\"')
log_raw = log_raw.withColumn('ip', splitter.getItem(0))
log_raw = log_raw.withColumn('timestamp', splitter.getItem(1))
log_raw = log_raw.withColumn('request', splitter.getItem(2))
log_raw = log_raw.withColumn('response_code', splitter.getItem(3))

splitter = pyspark.sql.functions.split(log_raw['response_code'], ' ')
log_raw = log_raw.withColumn('status', splitter.getItem(1))
log = log_raw.drop('_c0')

log.repartition(1) \
    .write.mode('overwrite') \
    .csv(output)