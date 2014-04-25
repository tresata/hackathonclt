hackathonclt
============

Welcome to hackathonclt!

## User Creation
http://dev.hackathonclt.org:5000/
- Note takes ~5min for user creation across the cluster

##Machines
Machines avaliable to work on:

slave01.hackathonclt.org

slave02.hackathonclt.org

slave03.hackathonclt.org

slave04.hackathonclt.org

Please spread yourselvs out across the machines

NOTE: if you have any dns issues, speak to staff

## Getting Started

Ssh into the server where you can access the retail data stored on the hackathon HDFS cluster.

    > ssh username@slave01.hackathonclt.org

and enter the password you specified in user creation.

We made Hive, Spark, and pySpark command-line interfaces available, and included a tool to compile and run simple Scalding scripts on-the-fly.

## Hive

Give Hive a whirl and run a sample query:

    > hive

Try pasting the following query into the hive command-line interface:

    hive> select UPC_NUMBER, ITEM_DESCRIPTION, DEPARTMENT_DESCRIPTION, EXTENDED_PRICE_AMOUNT from hackathon_sample limit 10;

This will a launch a (map-only) MapReduce job and return the specified fields for the first ten items in the 'hackathon' table.

## Spark

Now give the Spark-shell a test:

    > spark-shell

Read in the data and run a simple query that calculates the number of purchases for each upc in the sample data:

    >>> val dataRDD = sc.textFile("hdfs://master.hackathonclt.org:8020/sample/data_with_headers/hackathon_data_headers")
    >>> val upcs = dataRDD.flatMap(line => line.split("\\|").take(1))
    >>> val wordCounts = upcs.map(word => (word, 1)).reduceByKey((a, b) => a + b)
    >>> wordCounts.collect()

## pySpark

You can also do the same query using a python version of the Spark shell.

    > pyspark

    >>> dataRDD = sc.textFile("hdfs://master.hackathonclt.org:8020/sample/data_with_headers/hackathon_data_headers")
    >>> upcs = dataRDD.map(lambda line: line.split('|')[0])
    >>> wordCounts = upcs.map(lambda word: (word, 1)).reduceByKey(lambda a, b: a + b)
    >>> wordCounts.take(10)


## Scalding

In addition to the Hive and Spark shells, we're also packaging Eval-tool, a tool to compile and run Scalding scripts without having to create a project. If you create a file called test.scala with the following contents:

    import com.twitter.scalding._
    import com.tresata.scalding.Dsl._
    import com.tresata.scalding.util.ScaldingUtil

    (args: Args) => {
      new Job(args) {
        ScaldingUtil.sourceFromArg(args("input"))
          .groupBy('UPC_NUMBER) { _.size }
          .write(ScaldingUtil.sourceFromArg(args("output")))
      }
    }

you can run a query on the data set sample from the command-line:

    > eval-tool test.scala --hdfs --input bsv%/sample/data_with_headers/hackathon_data_headers --output bsv%upc_counts

This will generate a bar-separated file called 'upc_counts' in your HDFS home directory, containing the upc numbers along with their total counts.


##Job Tracker
http://master.hackathonclt.org:50030

##Spark Job Tracker
http://master.hackathonclt.org:8080

##Datnode information
http://master.hackathonclt.org:50070
