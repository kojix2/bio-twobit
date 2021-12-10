#include "twobit.h"

#define SIZEOF_INT32 4
#define SIZEOF_INT64 8

#if SIZEOF_SHORT == SIZEOF_INT32
#define NUM2UINT32 NUM2USHORT
#define NUM2INT32 NUM2SHORT
#define UINT32_2NUM USHORT2NUM
#define INT32_2NUM SHORT2NUM
#elif SIZEOF_INT == SIZEOF_INT32
#define NUM2UINT32 NUM2UINT
#define NUM2INT32 NUM2INT
#define UINT32_2NUM UINT2NUM
#define INT32_2NUM INT2NUM
#elif SIZEOF_LONG == SIZEOF_INT32
#define NUM2UINT32 NUM2ULONG
#define NUM2INT32 NUM2LONG
#define UINT32_2NUM ULONG2NUM
#define INT32_2NUM LONG2NUM
#else
#error "Neither int, long, nor short is the same size as int32_t"
#endif

#if SIZEOF_INT == SIZEOF_INT64
#define NUM2UINT64 NUM2UINT
#define NUM2INT64 NUM2INT
#define UINT64_2NUM UINT2NUM
#define INT64_2NUM INT2NUM
#elif SIZEOF_LONG == SIZEOF_INT64
#define NUM2UINT64 NUM2ULONG
#define NUM2INT64 NUM2LONG
#define UINT64_2NUM ULONG2NUM
#define INT64_2NUM LONG2NUM
#elif SIZEOF_LONGLONG == SIZEOF_INT64
#define NUM2UINT64 NUM2ULL
#define NUM2INT64 NUM2LL
#define UINT64_2NUM ULL2NUM
#define INT64_2NUM LL2NUM
#else
#error "Neither int, long, nor short is the same size as int64_t"
#endif

VALUE rb_Twobit;

static void TwoBit_free(void *ptr);
static size_t TwoBit_memsize(const void *ptr);

static const rb_data_type_t Twobit_type = {
    "TwoBit",
    {
        0,
        TwoBit_free,
        TwoBit_memsize,
    },
    0,
    0,
    RUBY_TYPED_FREE_IMMEDIATELY,
};

static void
TwoBit_free(void *ptr)
{
  twobitClose(ptr);
}

static size_t
TwoBit_memsize(const void *ptr)
{
  const TwoBit *data = ptr;

  return data ? sizeof(*data) : 0;
}

static TwoBit *getTwoBit(VALUE self)
{
  TwoBit *ptr = NULL;
  TypedData_Get_Struct(self, TwoBit, &Twobit_type, ptr);

  return ptr;
}

static VALUE
twobit_allocate(VALUE klass)
{
  TwoBit *tb = NULL;

  return TypedData_Wrap_Struct(klass, &Twobit_type, tb);
}

static VALUE
twobit_init(VALUE klass, VALUE fpath, VALUE storeMasked)
{
  char *path;
  int mask;

  path = StringValueCStr(fpath);
  mask = NUM2INT(storeMasked);

  DATA_PTR(klass) = twobitOpen(path, mask);

  return klass;
}

static VALUE
twobit_nchroms(VALUE self)
{
  TwoBit *tb;
  VALUE val;
  int32_t nc;

  tb = getTwoBit(self);
  nc = tb->hdr->nChroms;

  val = UINT32_2NUM(nc);

  return val;
}

static VALUE
twobit_chrom_len(VALUE self, VALUE chrom)
{
  TwoBit *tb;
  char *cname;
  VALUE val;
  uint32_t clen;

  tb = getTwoBit(self);
  cname = StringValueCStr(chrom);
  clen = twobitChromLen(tb, cname);

  val = UINT32_2NUM(clen);

  return val;
}

static VALUE
twobit_file_size(VALUE self)
{
  TwoBit *tb;
  uint64_t size;
  VALUE val;

  tb = getTwoBit(self);
  size = tb->sz;
  val = UINT64_2NUM(size);

  return val;
}

static VALUE
twobit_sequence(VALUE self, VALUE chrom, VALUE start, VALUE end)
{
  char *ch, *str;
  uint32_t st, en;
  TwoBit *tb;

  ch = StringValueCStr(chrom);
  st = NUM2UINT32(start);
  en = NUM2UINT32(end);
  tb = getTwoBit(self);

  str = twobitSequence(tb, ch, st, en);

  return rb_str_new2(str);
}

static VALUE
twobit_bases(VALUE self)
{
  return Qnil;
}

void Init_twobit(void)
{
  rb_Twobit = rb_define_class("Twobit", rb_cObject);

  rb_define_alloc_func(rb_Twobit, twobit_allocate);

  rb_define_method(rb_Twobit, "initialize", twobit_init, 2);
  rb_define_method(rb_Twobit, "nchroms", twobit_nchroms, 0);
  rb_define_method(rb_Twobit, "file_size", twobit_file_size, 0);
  rb_define_method(rb_Twobit, "chrom_len", twobit_chrom_len, 1);
  rb_define_method(rb_Twobit, "sequence", twobit_sequence, 3);
  rb_define_method(rb_Twobit, "bases", twobit_bases, 0);
}
