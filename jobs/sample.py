import pandas as pd
from pyspark.sql.functions import pandas_udf
from pyspark.sql import SparkSession

def main(spark):
    df = spark.createDataFrame(
        [(1, 1.0), (1, 2.0), (2, 3.0), (2, 5.0), (2, 10.0)],
        ("id", "v"))
    
    result = df.toPandas()

    print(result)
   #  @pandas_udf("double")
   #  def mean_udf(v: pd.Series) -> float:
   #      return v.mean()

   #  print(df.groupby("id").agg(mean_udf(df['v'])).collect())


if __name__ == "__main__":
    main(SparkSession.builder.getOrCreate())

# submit a job from jupyter server instance
# spark-submit --master spark://spark-master:7077 jobs/sample.py