#include "twobit.h"

VALUE cTwoBit;

void
Init_twoBit(void)
{
  cTwoBit = rb_define_class("Twobit", rb_cObject);
}
