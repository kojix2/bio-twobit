#include <ruby.h>
#include <stdio.h>
#include "twobit.h"

VALUE rb_Twobit;

static void TwoBit_free( void* ptr );
static size_t TwoBit_memsize( const void* ptr );

static const rb_data_type_t Twobit_type = {
    "TwoBit",
    {0, TwoBit_free, TwoBit_memsize,},
    0, 0,
    RUBY_TYPED_FREE_IMMEDIATELY,
};

static void
TwoBit_free( void* ptr )
{
    twobitClose( ptr );
}

static size_t
TwoBit_memsize( const void* ptr )
{
    const TwoBit* data = ptr;
    return data ? sizeof(*data) : 0;
}

static TwoBit *getTwoBit(VALUE self){
  TwoBit* ptr = NULL;
  TypedData_Get_Struct(self, TwoBit, &Twobit_type, ptr);
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
  TwoBit *tb = twobitOpen(fnamec, store_maskedc);
  return TypedData_Wrap_Struct(klass, &Twobit_type, tb);
}

static VALUE
twobit_nchroms(VALUE self) {
  TwoBit *tb = getTwoBit(self);
  uint32_t nc = tb->hdr->nChroms;
  VALUE val = UINT2NUM(nc);
  return val;
}

static VALUE
twobit_file_size(VALUE self) {
  TwoBit* tb = getTwoBit(self);
  uint64_t file_size = tb->sz;
  VALUE val = ULL2NUM(file_size);
  return val;
}

static VALUE
twobit_sequence(VALUE self, VALUE chrom, VALUE start, VALUE end) {
  char* c = StringValueCStr(chrom);
  uint32_t s = NUM2ULONG(start);
  uint32_t e = NUM2ULONG(end);
  TwoBit* tb = getTwoBit(self);
  char* str = twobitSequence(tb, c, s, e);
  return rb_str_new2(str);
}

static VALUE
twobit_bases(VALUE self) {
  return Qnil;
}

void Init_twobit(void)
{
  rb_Twobit = rb_define_class("Twobit", rb_cObject );
  rb_define_singleton_method(rb_Twobit, "new", twobit_new, 2);
  rb_define_method(rb_Twobit, "initialize", twobit_init, 0);
  rb_define_method(rb_Twobit, "nchroms", twobit_nchroms, 0);
  rb_define_method(rb_Twobit, "file_size", twobit_file_size, 0);
  rb_define_method(rb_Twobit, "sequence", twobit_sequence, 3);
  rb_define_method(rb_Twobit, "bases", twobit_bases, 0);
}
