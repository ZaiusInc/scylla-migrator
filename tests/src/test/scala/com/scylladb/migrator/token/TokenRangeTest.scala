package com.scylladb.migrator.token

import com.datastax.spark.connector.rdd.partitioner.dht.LongToken
import com.scylladb.migrator.readers.Cassandra.{containsTargetToken, containsToken}

class TokenRangeTest extends munit.FunSuite {

  test("contains target token works fine") {
    assertEquals(containsTargetToken((LongToken(10), LongToken(20)), Set(LongToken(5))), false)
    assertEquals(containsTargetToken((LongToken(10), LongToken(20)), Set(LongToken(25))), false)
    assertEquals(containsTargetToken((LongToken(0), LongToken(10)), Set(LongToken(5))), true)
    assertEquals(containsTargetToken((LongToken(0), LongToken(10)), Set(LongToken(0))), true)
    assertEquals(containsTargetToken((LongToken(0), LongToken(10)), Set(LongToken(10))), true)
    assertEquals(containsTargetToken((LongToken(500), LongToken(-500)), Set(LongToken(10))), false)
    assertEquals(containsTargetToken((LongToken(500), LongToken(-500)), Set(LongToken(600))), true)
  }

  test("contains token returns true when the token inside range") {
    val token = LongToken(10)
    val range = (LongToken(0), LongToken(20))

    assertEquals(containsToken(token, range), true)
  }

  test("contains token returns true when the token on the edge") {
    val startToken = LongToken(0)
    val endToken = LongToken(20)
    val range = (LongToken(0), LongToken(20))

    assertEquals(containsToken(startToken, range), true)
    assertEquals(containsToken(endToken, range), true)
  }

  test("contains token returns false when the token is not in the edge") {
    val token1 = LongToken(-10)
    val token2 = LongToken(30)
    val range = (LongToken(0), LongToken(20))

    assertEquals(containsToken(token1, range), false)
    assertEquals(containsToken(token2, range), false)
  }

  test("contains token works fine for overflowing range") {
    val token1 = LongToken(600000)
    val token2 = LongToken(-600000)
    val token3 = LongToken(0)
    val range = (LongToken(500000), LongToken(-500000))

    assertEquals(containsToken(token1, range), true)
    assertEquals(containsToken(token2, range), true)
    assertEquals(containsToken(token3, range), false)
  }
}
