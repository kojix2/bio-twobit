#include "twobit.h"

VALUE rb_mTwobit;

void
Init_twobit(void)
{
  rb_mTwobit = rb_define_module("Twobit");
}
