/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xa0883be4 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//vboxsrv/VirtualShare/CPU/src/testbenches/Processor_t.v";
static const char *ng1 = "Processor_t.vcd";
static int ng2[] = {0, 0};
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {1U, 0U};
static int ng5[] = {1, 0};



static int sp_clockPulse(char *t1, char *t2)
{
    char t5[8];
    int t0;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;

LAB0:    t0 = 1;
    t3 = (t2 + 48U);
    t4 = *((char **)t3);
    if (t4 == 0)
        goto LAB2;

LAB3:    goto *t4;

LAB2:    t4 = (t1 + 1256);
    xsi_vlog_subprogram_setdisablestate(t4, &&LAB4);
    xsi_set_current_line(116, ng0);

LAB5:    xsi_set_current_line(117, ng0);
    t6 = (t1 + 5008);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memset(t5, 0, 8);
    t9 = (t8 + 4);
    t10 = *((unsigned int *)t9);
    t11 = (~(t10));
    t12 = *((unsigned int *)t8);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t9) == 0)
        goto LAB6;

LAB8:    t15 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t15) = 1;

LAB9:    t16 = (t5 + 4);
    t17 = (t8 + 4);
    t18 = *((unsigned int *)t8);
    t19 = (~(t18));
    *((unsigned int *)t5) = t19;
    *((unsigned int *)t16) = 0;
    if (*((unsigned int *)t17) != 0)
        goto LAB11;

LAB10:    t24 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t24 & 1U);
    t25 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t25 & 1U);
    t26 = (t1 + 5008);
    xsi_vlogvar_assign_value(t26, t5, 0, 0, 1);
    xsi_set_current_line(118, ng0);
    t4 = (t1 + 4848);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    memset(t5, 0, 8);
    t8 = (t7 + 4);
    t10 = *((unsigned int *)t8);
    t11 = (~(t10));
    t12 = *((unsigned int *)t7);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB15;

LAB13:    if (*((unsigned int *)t8) == 0)
        goto LAB12;

LAB14:    t9 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t9) = 1;

LAB15:    t15 = (t5 + 4);
    t16 = (t7 + 4);
    t18 = *((unsigned int *)t7);
    t19 = (~(t18));
    *((unsigned int *)t5) = t19;
    *((unsigned int *)t15) = 0;
    if (*((unsigned int *)t16) != 0)
        goto LAB17;

LAB16:    t24 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t24 & 1U);
    t25 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t25 & 1U);
    t17 = (t1 + 4848);
    xsi_vlogvar_assign_value(t17, t5, 0, 0, 1);
    xsi_set_current_line(119, ng0);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    xsi_process_wait(t6, 1000LL);
    *((char **)t3) = &&LAB18;
    t0 = 1;

LAB1:    return t0;
LAB4:    xsi_vlog_dispose_subprogram_invocation(t2);
    t4 = (t2 + 48U);
    *((char **)t4) = &&LAB2;
    t0 = 0;
    goto LAB1;

LAB6:    *((unsigned int *)t5) = 1;
    goto LAB9;

LAB11:    t20 = *((unsigned int *)t5);
    t21 = *((unsigned int *)t17);
    *((unsigned int *)t5) = (t20 | t21);
    t22 = *((unsigned int *)t16);
    t23 = *((unsigned int *)t17);
    *((unsigned int *)t16) = (t22 | t23);
    goto LAB10;

LAB12:    *((unsigned int *)t5) = 1;
    goto LAB15;

LAB17:    t20 = *((unsigned int *)t5);
    t21 = *((unsigned int *)t16);
    *((unsigned int *)t5) = (t20 | t21);
    t22 = *((unsigned int *)t15);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t15) = (t22 | t23);
    goto LAB16;

LAB18:    xsi_set_current_line(120, ng0);
    t4 = (t1 + 5008);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    memset(t5, 0, 8);
    t8 = (t7 + 4);
    t10 = *((unsigned int *)t8);
    t11 = (~(t10));
    t12 = *((unsigned int *)t7);
    t13 = (t12 & t11);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB22;

LAB20:    if (*((unsigned int *)t8) == 0)
        goto LAB19;

LAB21:    t9 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t9) = 1;

LAB22:    t15 = (t5 + 4);
    t16 = (t7 + 4);
    t18 = *((unsigned int *)t7);
    t19 = (~(t18));
    *((unsigned int *)t5) = t19;
    *((unsigned int *)t15) = 0;
    if (*((unsigned int *)t16) != 0)
        goto LAB24;

LAB23:    t24 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t24 & 1U);
    t25 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t25 & 1U);
    t17 = (t1 + 5008);
    xsi_vlogvar_assign_value(t17, t5, 0, 0, 1);
    xsi_set_current_line(121, ng0);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    xsi_process_wait(t6, 1000LL);
    *((char **)t3) = &&LAB25;
    t0 = 1;
    goto LAB1;

LAB19:    *((unsigned int *)t5) = 1;
    goto LAB22;

LAB24:    t20 = *((unsigned int *)t5);
    t21 = *((unsigned int *)t16);
    *((unsigned int *)t5) = (t20 | t21);
    t22 = *((unsigned int *)t15);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t15) = (t22 | t23);
    goto LAB23;

LAB25:    goto LAB4;

}

static void Initial_80_0(char *t0)
{
    char *t1;

LAB0:    xsi_set_current_line(80, ng0);

LAB2:    xsi_set_current_line(81, ng0);
    xsi_vcd_dumpfile(ng1);
    xsi_set_current_line(82, ng0);
    t1 = ((char*)((ng2)));
    xsi_vcd_dumpvars_args(*((unsigned int *)t1), t0, (char)109, t0, (char)101);

LAB1:    return;
}

static void Initial_86_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;

LAB0:    t1 = (t0 + 7136U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(86, ng0);

LAB4:    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5168);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5488);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5648);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(91, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5808);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(92, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5968);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 6944);
    xsi_process_wait(t2, 20000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(94, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 5168);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    goto LAB1;

}

static void Initial_98_2(char *t0)
{
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    int t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;

LAB0:    t1 = (t0 + 7384U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(98, ng0);

LAB4:    xsi_set_current_line(99, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4848);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(100, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 5008);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(102, ng0);
    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5328);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB5:    t2 = (t0 + 5328);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 744);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    xsi_vlog_signed_less(t7, 32, t4, 32, t6, 32);
    t5 = (t7 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (~(t8));
    t10 = *((unsigned int *)t7);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(105, ng0);

LAB14:    t2 = (t0 + 1888U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB18;

LAB16:    if (*((unsigned int *)t2) == 0)
        goto LAB15;

LAB17:    t4 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t4) = 1;

LAB18:    t5 = (t7 + 4);
    t29 = *((unsigned int *)t5);
    t30 = (~(t29));
    t31 = *((unsigned int *)t7);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 7192);
    t3 = (t0 + 1256);
    t4 = xsi_create_subprogram_invocation(t2, 0, t0, t3, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t3, t4);

LAB36:    t5 = (t0 + 7288);
    t6 = *((char **)t5);
    t13 = (t6 + 80U);
    t14 = *((char **)t13);
    t15 = (t14 + 272U);
    t16 = *((char **)t15);
    t17 = (t16 + 0U);
    t18 = *((char **)t17);
    t24 = ((int  (*)(char *, char *))t18)(t0, t6);

LAB38:    if (t24 != 0)
        goto LAB39;

LAB34:    t6 = (t0 + 1256);
    xsi_vlog_subprogram_popinvocation(t6);

LAB35:    t19 = (t0 + 7288);
    t20 = *((char **)t19);
    t19 = (t0 + 1256);
    t21 = (t0 + 7192);
    t22 = 0;
    xsi_delete_subprogram_invocation(t19, t20, t0, t21, t22);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 7192);
    t3 = (t0 + 1256);
    t4 = xsi_create_subprogram_invocation(t2, 0, t0, t3, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t3, t4);

LAB42:    t5 = (t0 + 7288);
    t6 = *((char **)t5);
    t13 = (t6 + 80U);
    t14 = *((char **)t13);
    t15 = (t14 + 272U);
    t16 = *((char **)t15);
    t17 = (t16 + 0U);
    t18 = *((char **)t17);
    t24 = ((int  (*)(char *, char *))t18)(t0, t6);

LAB44:    if (t24 != 0)
        goto LAB45;

LAB40:    t6 = (t0 + 1256);
    xsi_vlog_subprogram_popinvocation(t6);

LAB41:    t19 = (t0 + 7288);
    t20 = *((char **)t19);
    t19 = (t0 + 1256);
    t21 = (t0 + 7192);
    t22 = 0;
    xsi_delete_subprogram_invocation(t19, t20, t0, t21, t22);

LAB1:    return;
LAB6:    xsi_set_current_line(103, ng0);
    t13 = (t0 + 7192);
    t14 = (t0 + 1256);
    t15 = xsi_create_subprogram_invocation(t13, 0, t0, t14, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t14, t15);

LAB10:    t16 = (t0 + 7288);
    t17 = *((char **)t16);
    t18 = (t17 + 80U);
    t19 = *((char **)t18);
    t20 = (t19 + 272U);
    t21 = *((char **)t20);
    t22 = (t21 + 0U);
    t23 = *((char **)t22);
    t24 = ((int  (*)(char *, char *))t23)(t0, t17);

LAB12:    if (t24 != 0)
        goto LAB13;

LAB8:    t17 = (t0 + 1256);
    xsi_vlog_subprogram_popinvocation(t17);

LAB9:    t25 = (t0 + 7288);
    t26 = *((char **)t25);
    t25 = (t0 + 1256);
    t27 = (t0 + 7192);
    t28 = 0;
    xsi_delete_subprogram_invocation(t25, t26, t0, t27, t28);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 5328);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t7, 0, 8);
    xsi_vlog_signed_add(t7, 32, t4, 32, t5, 32);
    t6 = (t0 + 5328);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 32);
    goto LAB5;

LAB11:;
LAB13:    t16 = (t0 + 7384U);
    *((char **)t16) = &&LAB10;
    goto LAB1;

LAB15:    *((unsigned int *)t7) = 1;
    goto LAB18;

LAB19:    xsi_set_current_line(105, ng0);

LAB21:    xsi_set_current_line(106, ng0);
    t6 = (t0 + 7192);
    t13 = (t0 + 1256);
    t14 = xsi_create_subprogram_invocation(t6, 0, t0, t13, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t13, t14);

LAB24:    t15 = (t0 + 7288);
    t16 = *((char **)t15);
    t17 = (t16 + 80U);
    t18 = *((char **)t17);
    t19 = (t18 + 272U);
    t20 = *((char **)t19);
    t21 = (t20 + 0U);
    t22 = *((char **)t21);
    t24 = ((int  (*)(char *, char *))t22)(t0, t16);

LAB26:    if (t24 != 0)
        goto LAB27;

LAB22:    t16 = (t0 + 1256);
    xsi_vlog_subprogram_popinvocation(t16);

LAB23:    t23 = (t0 + 7288);
    t25 = *((char **)t23);
    t23 = (t0 + 1256);
    t26 = (t0 + 7192);
    t27 = 0;
    xsi_delete_subprogram_invocation(t23, t25, t0, t26, t27);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 7192);
    t3 = (t0 + 1256);
    t4 = xsi_create_subprogram_invocation(t2, 0, t0, t3, 0, 0);
    xsi_vlog_subprogram_pushinvocation(t3, t4);

LAB30:    t5 = (t0 + 7288);
    t6 = *((char **)t5);
    t13 = (t6 + 80U);
    t14 = *((char **)t13);
    t15 = (t14 + 272U);
    t16 = *((char **)t15);
    t17 = (t16 + 0U);
    t18 = *((char **)t17);
    t24 = ((int  (*)(char *, char *))t18)(t0, t6);

LAB32:    if (t24 != 0)
        goto LAB33;

LAB28:    t6 = (t0 + 1256);
    xsi_vlog_subprogram_popinvocation(t6);

LAB29:    t19 = (t0 + 7288);
    t20 = *((char **)t19);
    t19 = (t0 + 1256);
    t21 = (t0 + 7192);
    t22 = 0;
    xsi_delete_subprogram_invocation(t19, t20, t0, t21, t22);
    goto LAB14;

LAB25:;
LAB27:    t15 = (t0 + 7384U);
    *((char **)t15) = &&LAB24;
    goto LAB1;

LAB31:;
LAB33:    t5 = (t0 + 7384U);
    *((char **)t5) = &&LAB30;
    goto LAB1;

LAB37:;
LAB39:    t5 = (t0 + 7384U);
    *((char **)t5) = &&LAB36;
    goto LAB1;

LAB43:;
LAB45:    t5 = (t0 + 7384U);
    *((char **)t5) = &&LAB42;
    goto LAB1;

}


extern void work_m_00000000000988793900_3232550671_init()
{
	static char *pe[] = {(void *)Initial_80_0,(void *)Initial_86_1,(void *)Initial_98_2};
	static char *se[] = {(void *)sp_clockPulse};
	xsi_register_didat("work_m_00000000000988793900_3232550671", "isim/Processor_t_isim_beh.exe.sim/work/m_00000000000988793900_3232550671.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
