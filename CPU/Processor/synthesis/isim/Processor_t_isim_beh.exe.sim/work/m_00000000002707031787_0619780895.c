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
static const char *ng0 = "//vboxsrv/VirtualShare/CPU/src/DualPortRAM.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {0, 0};



static void Initial_34_0(char *t0)
{
    char t3[8];
    char t4[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    int t14;
    char *t15;
    unsigned int t16;
    int t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    int t21;
    int t22;

LAB0:    xsi_set_current_line(35, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3640);
    t5 = (t0 + 3640);
    t6 = (t5 + 72U);
    t7 = *((char **)t6);
    t8 = (t0 + 3640);
    t9 = (t8 + 64U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng2)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB2;

LAB3:
LAB1:    return;
LAB2:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_assign_value(t2, t1, 0, *((unsigned int *)t4), t22);
    goto LAB3;

}

static void Always_38_1(char *t0)
{
    char t14[8];
    char t23[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t24;
    int t25;
    unsigned int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    int t32;

LAB0:    t1 = (t0 + 4808U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 5376);
    *((int *)t2) = 1;
    t3 = (t0 + 4840);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(38, ng0);

LAB5:    xsi_set_current_line(39, ng0);
    t4 = (t0 + 1640U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(39, ng0);

LAB9:    xsi_set_current_line(40, ng0);
    t11 = (t0 + 3640);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t15 = (t0 + 3640);
    t16 = (t15 + 72U);
    t17 = *((char **)t16);
    t18 = (t0 + 3640);
    t19 = (t18 + 64U);
    t20 = *((char **)t19);
    t21 = (t0 + 1480U);
    t22 = *((char **)t21);
    xsi_vlog_generic_get_array_select_value(t14, 32, t13, t17, t20, 2, 1, t22, 5, 2);
    t21 = (t0 + 3320);
    xsi_vlogvar_wait_assign_value(t21, t14, 0, 0, 32, 0LL);
    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1800U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:
LAB12:    goto LAB8;

LAB10:    xsi_set_current_line(43, ng0);
    t4 = (t0 + 1320U);
    t5 = *((char **)t4);
    t4 = (t0 + 3640);
    t11 = (t0 + 3640);
    t12 = (t11 + 72U);
    t13 = *((char **)t12);
    t15 = (t0 + 3640);
    t16 = (t15 + 64U);
    t17 = *((char **)t16);
    t18 = (t0 + 1480U);
    t19 = *((char **)t18);
    xsi_vlog_generic_convert_array_indices(t14, t23, t13, t17, 2, 1, t19, 5, 2);
    t18 = (t14 + 4);
    t24 = *((unsigned int *)t18);
    t25 = (!(t24));
    t20 = (t23 + 4);
    t26 = *((unsigned int *)t20);
    t27 = (!(t26));
    t28 = (t25 && t27);
    if (t28 == 1)
        goto LAB13;

LAB14:    goto LAB12;

LAB13:    t29 = *((unsigned int *)t14);
    t30 = *((unsigned int *)t23);
    t31 = (t29 - t30);
    t32 = (t31 + 1);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, *((unsigned int *)t23), t32, 0LL);
    goto LAB14;

}

static void Always_47_2(char *t0)
{
    char t14[8];
    char t23[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t24;
    int t25;
    unsigned int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    int t32;

LAB0:    t1 = (t0 + 5056U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 5392);
    *((int *)t2) = 1;
    t3 = (t0 + 5088);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(47, ng0);

LAB5:    xsi_set_current_line(48, ng0);
    t4 = (t0 + 2440U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(48, ng0);

LAB9:    xsi_set_current_line(49, ng0);
    t11 = (t0 + 3640);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t15 = (t0 + 3640);
    t16 = (t15 + 72U);
    t17 = *((char **)t16);
    t18 = (t0 + 3640);
    t19 = (t18 + 64U);
    t20 = *((char **)t19);
    t21 = (t0 + 2280U);
    t22 = *((char **)t21);
    xsi_vlog_generic_get_array_select_value(t14, 32, t13, t17, t20, 2, 1, t22, 5, 2);
    t21 = (t0 + 3480);
    xsi_vlogvar_wait_assign_value(t21, t14, 0, 0, 32, 0LL);
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2600U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:
LAB12:    goto LAB8;

LAB10:    xsi_set_current_line(52, ng0);
    t4 = (t0 + 2120U);
    t5 = *((char **)t4);
    t4 = (t0 + 3640);
    t11 = (t0 + 3640);
    t12 = (t11 + 72U);
    t13 = *((char **)t12);
    t15 = (t0 + 3640);
    t16 = (t15 + 64U);
    t17 = *((char **)t16);
    t18 = (t0 + 2280U);
    t19 = *((char **)t18);
    xsi_vlog_generic_convert_array_indices(t14, t23, t13, t17, 2, 1, t19, 5, 2);
    t18 = (t14 + 4);
    t24 = *((unsigned int *)t18);
    t25 = (!(t24));
    t20 = (t23 + 4);
    t26 = *((unsigned int *)t20);
    t27 = (!(t26));
    t28 = (t25 && t27);
    if (t28 == 1)
        goto LAB13;

LAB14:    goto LAB12;

LAB13:    t29 = *((unsigned int *)t14);
    t30 = *((unsigned int *)t23);
    t31 = (t29 - t30);
    t32 = (t31 + 1);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, *((unsigned int *)t23), t32, 0LL);
    goto LAB14;

}


extern void work_m_00000000002707031787_0619780895_init()
{
	static char *pe[] = {(void *)Initial_34_0,(void *)Always_38_1,(void *)Always_47_2};
	xsi_register_didat("work_m_00000000002707031787_0619780895", "isim/Processor_t_isim_beh.exe.sim/work/m_00000000002707031787_0619780895.didat");
	xsi_register_executes(pe);
}
