
#  standard component Makefile header
sp              :=  $(sp).x
dirstack_$(sp)  :=  $(d)
d               :=  $(dirmd5)

#  component specification

OBJS_$(d) := $(d)/md5.o

$(OBJS_$(d)): 

DEPS_$(d)   :=  $(OBJS_$(d):.o=.d)

CLEAN_LIST  :=  $(CLEAN_LIST) $(OBJS_$(d)) $(DEPS_$(d))

$(d)/%.o:	$(d)/%.c
	$(CC) $(CFLAGS_LOCAL) $(CFLAGS_GLOBAL) -MD -c -o $@ $<

-include $(DEPS_$(d))

#  standard component Makefile footer

d   := $(dirstack_$(sp))
sp  := $(basename $(sp))