#include "twobit.h"

VALUE cTwobit;

static TwoBit *getTwoBit(VALUE self){
  TwoBit *ptr;
  Data_Get_Struct(self, TwoBit, ptr);
  return ptr;
}

static VALUE
twobit_init(VALUE klass){
  return klass;
}

static VALUE
twobit_new(VALUE klass, VALUE fname, VALUE storeMasked){
  char *fnamec = StringValueCStr(fname);
  int store_maskedc = NUM2INT(storeMasked);
  VALUE obj;
  TwoBit *tb = NULL;
  tb = twobitOpen(fnamec, store_maskedc);
  obj = Data_Make_Struct(klass, TwoBit, 0, twobitClose, tb);
  return obj;
}

static VALUE
twobit_chroms(VALUE self) {
  return Qnil; 
}

static VALUE
twobit_info(VALUE self) {
  return Qnil;
}

static VALUE
twobit_sequence(VALUE self) {
  return Qnil;
}

static VALUE
twobit_bases(VALUE self) {
  return Qnil;
}

void Init_twobit(void)
{
  cTwobit = rb_define_class("Twobit", rb_cObject);
  rb_define_singleton_method(cTwobit, "new", twobit_new, 2);
  rb_define_method(cTwobit, "initialize", twobit_init, 0)
  rb_define_method(cTwobit, "chroms", twobit_chroms, 0);
  rb_define_method(cTwobit, "info", twobit_info, 0);
  rb_define_method(cTwobit, "sequence", twobit_sequence, 0);
  rb_define_method(cTwobit, "bases", twobit_bases, 0);
}
