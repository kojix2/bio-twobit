#include "twobit.h"

VALUE cTwobit;

static TwoBit *getTwoBit(VALUE self){
  TwoBit *ptr;
  Data_Get_Struct(self, TwoBit, ptr);
  return ptr;
}

static VALUE
twobit_alloc(VALUE klass){
  struct TwoBit *ptr = malloc(sizeof(TwoBit));
  return Data_Wrap_Struct(klass, 0, twobitClose, ptr);
}

static VALUE
twobit_open(VALUE klass, VALUE fname, VALUE storeMasked){
  char *fnamec = StringValueCStr(fname);
  int store_maskedc = NUM2INT(storeMasked);
  TwoBit *tb = NULL;
  tb = twobitOpen(fnamec, store_maskedc);
  return Data_Make_Struct(klass, TwoBit, 0, twobitClose, tb);
}

static VALUE
twobit_chroms(VALUE self) {
}

static VALUE
twobit_info(VALUE self) {
}

static VALUE
twobit_sequence(VALUE self) {
}

static VALUE
twobit_bases(VALUE self) {
}

void Init_twobit(void)
{
  cTwobit = rb_define_class("Twobit", rb_cObject);
  rb_define_alloc_func(cTwobit, twobit_alloc);
  rb_define_method(cTwobit, "open", twobit_open, 2);
  rb_define_method(cTwobit, "chroms", twobit_chroms, 0);
  rb_define_method(cTwobit, "info", twobit_info, 0);
  rb_define_method(cTwobit, "sequence", twobit_sequence, 0);
  rb_define_method(cTwobit, "bases", twobit_bases, 0);
}
