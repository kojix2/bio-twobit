#include "twobit.h"

VALUE cTwoBit;

static VALUE two_bit_open(VALUE self, VALUE fname, VALUE storeMasked){\
  char *fnamec = StringValueCStr(fname);
  int store_maskedc = NUM2INT(storeMasked);
  twobitOpen(fnamec, store_maskedc);
  return Qtrue;
}

static VALUE two_bit_close(VALUE self){
}

static VALUE two_bit_chroms(VALUE self) {
}

static VALUE two_bit_info(VALUE self) {
}

static VALUE two_bit_sequence(VALUE self) {
}

static VALUE two_bit_bases(VALUE self) {
}

void
Init_twoBit(void)
{
  cTwoBit = rb_define_class("Twobit", rb_cObject);
  rb_define_singleton_method(cTwoBit, "open", two_bit_open, 0);
  rb_define_method(cTwoBit, "close", two_bit_close, 0);
  rb_define_method(cTwoBit, "chroms", two_bit_chroms, 0);
  rb_define_method(cTwoBit, "info", two_bit_info, 0);
  rb_define_method(cTwoBit, "sequence", two_bit_sequence, 0);
  rb_define_method(cTwoBit, "bases", two_bit_bases, 0);
}
