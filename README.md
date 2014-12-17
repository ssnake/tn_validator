tn_validator
============

This is small, tiny a gem which may make your life easier.

It can validate post tracking number, e.g. RD223479072CN

Usage
=====

TN::Validator.valid?('RD223479072CN) =>
{
  result: true,
  code: :OK,
  msg: 'ok'
}

As you can see it returns hash with following keys:

* result - true or falce. Specify whether tracking number is correct or not
* code
  * :OK - tracking number is correct
  * :BAD_FORMAT - tracking number has bad format. Doesn't match XX123456789XX
  * :BAD_LENGTH - the length mismatches 13 letters
  * :BAD_CRC - crc is incorrect
* msg - contains message which comment code field


Links
=====

[S10_(UPU_standard)] (http://en.wikipedia.org/wiki/S10_(UPU_standard))
