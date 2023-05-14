
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/execve:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0660006f          	j	1068 <__start_main>

0000000000001006 <test_execve>:
 * 测试成功则输出：
 * "  I am test_echo."
 * 测试失败则输出：
 * "  execve error."
 */
void test_execve(void){
    1006:	7179                	addi	sp,sp,-48
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	f8850513          	addi	a0,a0,-120 # 1f90 <__clone+0x2c>
void test_execve(void){
    1010:	f406                	sd	ra,40(sp)
    TEST_START(__func__);
    1012:	256000ef          	jal	ra,1268 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	fea50513          	addi	a0,a0,-22 # 2000 <__func__.1186>
    101e:	24a000ef          	jal	ra,1268 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f8650513          	addi	a0,a0,-122 # 1fa8 <__clone+0x44>
    102a:	23e000ef          	jal	ra,1268 <puts>
    char *newargv[] = {"test_echo", NULL};
    102e:	00001797          	auipc	a5,0x1
    1032:	f8a78793          	addi	a5,a5,-118 # 1fb8 <__clone+0x54>
    char *newenviron[] = {NULL};
    execve("test_echo", newargv, newenviron);
    1036:	0030                	addi	a2,sp,8
    1038:	080c                	addi	a1,sp,16
    103a:	853e                	mv	a0,a5
    char *newargv[] = {"test_echo", NULL};
    103c:	e83e                	sd	a5,16(sp)
    103e:	ec02                	sd	zero,24(sp)
    char *newenviron[] = {NULL};
    1040:	e402                	sd	zero,8(sp)
    execve("test_echo", newargv, newenviron);
    1042:	55f000ef          	jal	ra,1da0 <execve>
    printf("  execve error.\n");
    1046:	00001517          	auipc	a0,0x1
    104a:	f8250513          	addi	a0,a0,-126 # 1fc8 <__clone+0x64>
    104e:	23c000ef          	jal	ra,128a <printf>
    //TEST_END(__func__);
}
    1052:	70a2                	ld	ra,40(sp)
    1054:	6145                	addi	sp,sp,48
    1056:	8082                	ret

0000000000001058 <main>:

int main(void){
    1058:	1141                	addi	sp,sp,-16
    105a:	e406                	sd	ra,8(sp)
    test_execve();
    105c:	fabff0ef          	jal	ra,1006 <test_execve>
    return 0;
}
    1060:	60a2                	ld	ra,8(sp)
    1062:	4501                	li	a0,0
    1064:	0141                	addi	sp,sp,16
    1066:	8082                	ret

0000000000001068 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1068:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    106a:	4108                	lw	a0,0(a0)
{
    106c:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    106e:	05a1                	addi	a1,a1,8
{
    1070:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1072:	fe7ff0ef          	jal	ra,1058 <main>
    1076:	507000ef          	jal	ra,1d7c <exit>
	return 0;
}
    107a:	60a2                	ld	ra,8(sp)
    107c:	4501                	li	a0,0
    107e:	0141                	addi	sp,sp,16
    1080:	8082                	ret

0000000000001082 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1082:	7179                	addi	sp,sp,-48
    1084:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1086:	12054e63          	bltz	a0,11c2 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    108a:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    108e:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1090:	02b7f6bb          	remuw	a3,a5,a1
    1094:	00001717          	auipc	a4,0x1
    1098:	f7c70713          	addi	a4,a4,-132 # 2010 <digits>
    buf[16] = 0;
    109c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10a0:	1682                	slli	a3,a3,0x20
    10a2:	9281                	srli	a3,a3,0x20
    10a4:	96ba                	add	a3,a3,a4
    10a6:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    10aa:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    10ae:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10b2:	16b7e363          	bltu	a5,a1,1218 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    10b6:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    10ba:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    10be:	1602                	slli	a2,a2,0x20
    10c0:	9201                	srli	a2,a2,0x20
    10c2:	963a                	add	a2,a2,a4
    10c4:	00064603          	lbu	a2,0(a2)
    10c8:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10cc:	0007861b          	sext.w	a2,a5
    10d0:	12b6e863          	bltu	a3,a1,1200 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    10d4:	02b7f6bb          	remuw	a3,a5,a1
    10d8:	1682                	slli	a3,a3,0x20
    10da:	9281                	srli	a3,a3,0x20
    10dc:	96ba                	add	a3,a3,a4
    10de:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    10e2:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    10e6:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    10ea:	10b66e63          	bltu	a2,a1,1206 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    10ee:	02b876bb          	remuw	a3,a6,a1
    10f2:	1682                	slli	a3,a3,0x20
    10f4:	9281                	srli	a3,a3,0x20
    10f6:	96ba                	add	a3,a3,a4
    10f8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    10fc:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1100:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1104:	10b86463          	bltu	a6,a1,120c <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1108:	02b676bb          	remuw	a3,a2,a1
    110c:	1682                	slli	a3,a3,0x20
    110e:	9281                	srli	a3,a3,0x20
    1110:	96ba                	add	a3,a3,a4
    1112:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1116:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    111a:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    111e:	0eb66a63          	bltu	a2,a1,1212 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    1122:	02b876bb          	remuw	a3,a6,a1
    1126:	1682                	slli	a3,a3,0x20
    1128:	9281                	srli	a3,a3,0x20
    112a:	96ba                	add	a3,a3,a4
    112c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1130:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1134:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1138:	0cb86163          	bltu	a6,a1,11fa <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    113c:	02b676bb          	remuw	a3,a2,a1
    1140:	1682                	slli	a3,a3,0x20
    1142:	9281                	srli	a3,a3,0x20
    1144:	96ba                	add	a3,a3,a4
    1146:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    114a:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    114e:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1152:	0cb66563          	bltu	a2,a1,121c <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1156:	02b876bb          	remuw	a3,a6,a1
    115a:	1682                	slli	a3,a3,0x20
    115c:	9281                	srli	a3,a3,0x20
    115e:	96ba                	add	a3,a3,a4
    1160:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1164:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1168:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    116c:	0ab86b63          	bltu	a6,a1,1222 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1170:	02b676bb          	remuw	a3,a2,a1
    1174:	1682                	slli	a3,a3,0x20
    1176:	9281                	srli	a3,a3,0x20
    1178:	96ba                	add	a3,a3,a4
    117a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    117e:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    1182:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1186:	0ab66163          	bltu	a2,a1,1228 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    118a:	1782                	slli	a5,a5,0x20
    118c:	9381                	srli	a5,a5,0x20
    118e:	97ba                	add	a5,a5,a4
    1190:	0007c703          	lbu	a4,0(a5)
    1194:	4599                	li	a1,6
    1196:	4795                	li	a5,5
    1198:	00e10723          	sb	a4,14(sp)

    if (sign)
    119c:	00055963          	bgez	a0,11ae <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11a0:	1018                	addi	a4,sp,32
    11a2:	973e                	add	a4,a4,a5
    11a4:	02d00693          	li	a3,45
    11a8:	fed70423          	sb	a3,-24(a4)
    11ac:	85be                	mv	a1,a5
    write(f, s, l);
    11ae:	003c                	addi	a5,sp,8
    11b0:	4641                	li	a2,16
    11b2:	9e0d                	subw	a2,a2,a1
    11b4:	4505                	li	a0,1
    11b6:	95be                	add	a1,a1,a5
    11b8:	373000ef          	jal	ra,1d2a <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11bc:	70a2                	ld	ra,40(sp)
    11be:	6145                	addi	sp,sp,48
    11c0:	8082                	ret
        x = -xx;
    11c2:	40a0063b          	negw	a2,a0
    11c6:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    11c8:	02b677bb          	remuw	a5,a2,a1
    11cc:	00001717          	auipc	a4,0x1
    11d0:	e4470713          	addi	a4,a4,-444 # 2010 <digits>
    buf[16] = 0;
    11d4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11d8:	1782                	slli	a5,a5,0x20
    11da:	9381                	srli	a5,a5,0x20
    11dc:	97ba                	add	a5,a5,a4
    11de:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11e2:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    11e6:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11ea:	ecb676e3          	bleu	a1,a2,10b6 <printint.constprop.0+0x34>
        buf[i--] = '-';
    11ee:	02d00793          	li	a5,45
    11f2:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    11f6:	45b9                	li	a1,14
    11f8:	bf5d                	j	11ae <printint.constprop.0+0x12c>
    11fa:	47a5                	li	a5,9
    11fc:	45a9                	li	a1,10
    11fe:	bf79                	j	119c <printint.constprop.0+0x11a>
    1200:	47b5                	li	a5,13
    1202:	45b9                	li	a1,14
    1204:	bf61                	j	119c <printint.constprop.0+0x11a>
    1206:	47b1                	li	a5,12
    1208:	45b5                	li	a1,13
    120a:	bf49                	j	119c <printint.constprop.0+0x11a>
    120c:	47ad                	li	a5,11
    120e:	45b1                	li	a1,12
    1210:	b771                	j	119c <printint.constprop.0+0x11a>
    1212:	47a9                	li	a5,10
    1214:	45ad                	li	a1,11
    1216:	b759                	j	119c <printint.constprop.0+0x11a>
    i = 15;
    1218:	45bd                	li	a1,15
    121a:	bf51                	j	11ae <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    121c:	47a1                	li	a5,8
    121e:	45a5                	li	a1,9
    1220:	bfb5                	j	119c <printint.constprop.0+0x11a>
    1222:	479d                	li	a5,7
    1224:	45a1                	li	a1,8
    1226:	bf9d                	j	119c <printint.constprop.0+0x11a>
    1228:	4799                	li	a5,6
    122a:	459d                	li	a1,7
    122c:	bf85                	j	119c <printint.constprop.0+0x11a>

000000000000122e <getchar>:
{
    122e:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1230:	00f10593          	addi	a1,sp,15
    1234:	4605                	li	a2,1
    1236:	4501                	li	a0,0
{
    1238:	ec06                	sd	ra,24(sp)
    char byte = 0;
    123a:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    123e:	2e3000ef          	jal	ra,1d20 <read>
}
    1242:	60e2                	ld	ra,24(sp)
    1244:	00f14503          	lbu	a0,15(sp)
    1248:	6105                	addi	sp,sp,32
    124a:	8082                	ret

000000000000124c <putchar>:
{
    124c:	1101                	addi	sp,sp,-32
    char byte = c;
    124e:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    1252:	00f10593          	addi	a1,sp,15
    1256:	4605                	li	a2,1
    1258:	4505                	li	a0,1
{
    125a:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    125c:	2cf000ef          	jal	ra,1d2a <write>
}
    1260:	60e2                	ld	ra,24(sp)
    1262:	2501                	sext.w	a0,a0
    1264:	6105                	addi	sp,sp,32
    1266:	8082                	ret

0000000000001268 <puts>:
{
    1268:	1141                	addi	sp,sp,-16
    126a:	e406                	sd	ra,8(sp)
    126c:	e022                	sd	s0,0(sp)
    126e:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1270:	59e000ef          	jal	ra,180e <strlen>
    1274:	862a                	mv	a2,a0
    1276:	85a2                	mv	a1,s0
    1278:	4505                	li	a0,1
    127a:	2b1000ef          	jal	ra,1d2a <write>
}
    127e:	60a2                	ld	ra,8(sp)
    1280:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1282:	957d                	srai	a0,a0,0x3f
    return r;
    1284:	2501                	sext.w	a0,a0
}
    1286:	0141                	addi	sp,sp,16
    1288:	8082                	ret

000000000000128a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    128a:	7131                	addi	sp,sp,-192
    128c:	e0da                	sd	s6,64(sp)
    128e:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1290:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1292:	013c                	addi	a5,sp,136
{
    1294:	f0ca                	sd	s2,96(sp)
    1296:	ecce                	sd	s3,88(sp)
    1298:	e8d2                	sd	s4,80(sp)
    129a:	e4d6                	sd	s5,72(sp)
    129c:	fc5e                	sd	s7,56(sp)
    129e:	fc86                	sd	ra,120(sp)
    12a0:	f8a2                	sd	s0,112(sp)
    12a2:	f4a6                	sd	s1,104(sp)
    12a4:	89aa                	mv	s3,a0
    12a6:	e52e                	sd	a1,136(sp)
    12a8:	e932                	sd	a2,144(sp)
    12aa:	ed36                	sd	a3,152(sp)
    12ac:	f13a                	sd	a4,160(sp)
    12ae:	f942                	sd	a6,176(sp)
    12b0:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12b2:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12b4:	02500913          	li	s2,37
    12b8:	07000a93          	li	s5,112
    buf[i++] = '0';
    12bc:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12c0:	00001a17          	auipc	s4,0x1
    12c4:	d50a0a13          	addi	s4,s4,-688 # 2010 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12c8:	00001b97          	auipc	s7,0x1
    12cc:	d18b8b93          	addi	s7,s7,-744 # 1fe0 <__clone+0x7c>
        if (!*s)
    12d0:	0009c783          	lbu	a5,0(s3)
    12d4:	cfb9                	beqz	a5,1332 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    12d6:	23278d63          	beq	a5,s2,1510 <printf+0x286>
    12da:	864e                	mv	a2,s3
    12dc:	a019                	j	12e2 <printf+0x58>
    12de:	07278563          	beq	a5,s2,1348 <printf+0xbe>
    12e2:	0605                	addi	a2,a2,1
    12e4:	00064783          	lbu	a5,0(a2)
    12e8:	fbfd                	bnez	a5,12de <printf+0x54>
    12ea:	84b2                	mv	s1,a2
        l = z - a;
    12ec:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    12f0:	8622                	mv	a2,s0
    12f2:	85ce                	mv	a1,s3
    12f4:	4505                	li	a0,1
    12f6:	235000ef          	jal	ra,1d2a <write>
        if (l)
    12fa:	ec3d                	bnez	s0,1378 <printf+0xee>
        if (s[1] == 0)
    12fc:	0014c783          	lbu	a5,1(s1)
    1300:	cb8d                	beqz	a5,1332 <printf+0xa8>
        switch (s[1])
    1302:	09578b63          	beq	a5,s5,1398 <printf+0x10e>
    1306:	06fafb63          	bleu	a5,s5,137c <printf+0xf2>
    130a:	07300713          	li	a4,115
    130e:	1ce78e63          	beq	a5,a4,14ea <printf+0x260>
    1312:	07800713          	li	a4,120
    1316:	1ae79563          	bne	a5,a4,14c0 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    131a:	6782                	ld	a5,0(sp)
    131c:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    131e:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    1322:	4388                	lw	a0,0(a5)
    1324:	07a1                	addi	a5,a5,8
    1326:	e03e                	sd	a5,0(sp)
    1328:	d5bff0ef          	jal	ra,1082 <printint.constprop.0>
        if (!*s)
    132c:	0009c783          	lbu	a5,0(s3)
    1330:	f3dd                	bnez	a5,12d6 <printf+0x4c>
    }
    va_end(ap);
}
    1332:	70e6                	ld	ra,120(sp)
    1334:	7446                	ld	s0,112(sp)
    1336:	74a6                	ld	s1,104(sp)
    1338:	7906                	ld	s2,96(sp)
    133a:	69e6                	ld	s3,88(sp)
    133c:	6a46                	ld	s4,80(sp)
    133e:	6aa6                	ld	s5,72(sp)
    1340:	6b06                	ld	s6,64(sp)
    1342:	7be2                	ld	s7,56(sp)
    1344:	6129                	addi	sp,sp,192
    1346:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1348:	00164783          	lbu	a5,1(a2)
    134c:	84b2                	mv	s1,a2
    134e:	01278763          	beq	a5,s2,135c <printf+0xd2>
    1352:	bf69                	j	12ec <printf+0x62>
    1354:	0014c783          	lbu	a5,1(s1)
    1358:	f9279ae3          	bne	a5,s2,12ec <printf+0x62>
    135c:	0489                	addi	s1,s1,2
    135e:	0004c783          	lbu	a5,0(s1)
    1362:	0605                	addi	a2,a2,1
    1364:	ff2788e3          	beq	a5,s2,1354 <printf+0xca>
        l = z - a;
    1368:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    136c:	8622                	mv	a2,s0
    136e:	85ce                	mv	a1,s3
    1370:	4505                	li	a0,1
    1372:	1b9000ef          	jal	ra,1d2a <write>
        if (l)
    1376:	d059                	beqz	s0,12fc <printf+0x72>
    1378:	89a6                	mv	s3,s1
    137a:	bf99                	j	12d0 <printf+0x46>
    137c:	06400713          	li	a4,100
    1380:	14e79063          	bne	a5,a4,14c0 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    1384:	6782                	ld	a5,0(sp)
    1386:	45a9                	li	a1,10
        s += 2;
    1388:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    138c:	4388                	lw	a0,0(a5)
    138e:	07a1                	addi	a5,a5,8
    1390:	e03e                	sd	a5,0(sp)
    1392:	cf1ff0ef          	jal	ra,1082 <printint.constprop.0>
        s += 2;
    1396:	bf59                	j	132c <printf+0xa2>
            printptr(va_arg(ap, uint64));
    1398:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    139a:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    139e:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13a0:	631c                	ld	a5,0(a4)
    13a2:	0721                	addi	a4,a4,8
    13a4:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13a6:	00479293          	slli	t0,a5,0x4
    13aa:	00879f93          	slli	t6,a5,0x8
    13ae:	00c79f13          	slli	t5,a5,0xc
    13b2:	01079e93          	slli	t4,a5,0x10
    13b6:	01479e13          	slli	t3,a5,0x14
    13ba:	01879313          	slli	t1,a5,0x18
    13be:	01c79893          	slli	a7,a5,0x1c
    13c2:	02479813          	slli	a6,a5,0x24
    13c6:	02879513          	slli	a0,a5,0x28
    13ca:	02c79593          	slli	a1,a5,0x2c
    13ce:	03079693          	slli	a3,a5,0x30
    13d2:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13d6:	03c7d413          	srli	s0,a5,0x3c
    13da:	01c7d39b          	srliw	t2,a5,0x1c
    13de:	03c2d293          	srli	t0,t0,0x3c
    13e2:	03cfdf93          	srli	t6,t6,0x3c
    13e6:	03cf5f13          	srli	t5,t5,0x3c
    13ea:	03cede93          	srli	t4,t4,0x3c
    13ee:	03ce5e13          	srli	t3,t3,0x3c
    13f2:	03c35313          	srli	t1,t1,0x3c
    13f6:	03c8d893          	srli	a7,a7,0x3c
    13fa:	03c85813          	srli	a6,a6,0x3c
    13fe:	9171                	srli	a0,a0,0x3c
    1400:	91f1                	srli	a1,a1,0x3c
    1402:	92f1                	srli	a3,a3,0x3c
    1404:	9371                	srli	a4,a4,0x3c
    1406:	96d2                	add	a3,a3,s4
    1408:	9752                	add	a4,a4,s4
    140a:	9452                	add	s0,s0,s4
    140c:	92d2                	add	t0,t0,s4
    140e:	9fd2                	add	t6,t6,s4
    1410:	9f52                	add	t5,t5,s4
    1412:	9ed2                	add	t4,t4,s4
    1414:	9e52                	add	t3,t3,s4
    1416:	9352                	add	t1,t1,s4
    1418:	98d2                	add	a7,a7,s4
    141a:	93d2                	add	t2,t2,s4
    141c:	9852                	add	a6,a6,s4
    141e:	9552                	add	a0,a0,s4
    1420:	95d2                	add	a1,a1,s4
    1422:	0006c983          	lbu	s3,0(a3)
    1426:	0002c283          	lbu	t0,0(t0)
    142a:	00074683          	lbu	a3,0(a4)
    142e:	000fcf83          	lbu	t6,0(t6)
    1432:	000f4f03          	lbu	t5,0(t5)
    1436:	000ece83          	lbu	t4,0(t4)
    143a:	000e4e03          	lbu	t3,0(t3)
    143e:	00034303          	lbu	t1,0(t1)
    1442:	0008c883          	lbu	a7,0(a7)
    1446:	0003c383          	lbu	t2,0(t2)
    144a:	00084803          	lbu	a6,0(a6)
    144e:	00054503          	lbu	a0,0(a0)
    1452:	0005c583          	lbu	a1,0(a1)
    1456:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    145a:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    145e:	9371                	srli	a4,a4,0x3c
    1460:	8bbd                	andi	a5,a5,15
    1462:	9752                	add	a4,a4,s4
    1464:	97d2                	add	a5,a5,s4
    1466:	005105a3          	sb	t0,11(sp)
    146a:	01f10623          	sb	t6,12(sp)
    146e:	01e106a3          	sb	t5,13(sp)
    1472:	01d10723          	sb	t4,14(sp)
    1476:	01c107a3          	sb	t3,15(sp)
    147a:	00610823          	sb	t1,16(sp)
    147e:	011108a3          	sb	a7,17(sp)
    1482:	00710923          	sb	t2,18(sp)
    1486:	010109a3          	sb	a6,19(sp)
    148a:	00a10a23          	sb	a0,20(sp)
    148e:	00b10aa3          	sb	a1,21(sp)
    1492:	01310b23          	sb	s3,22(sp)
    1496:	00d10ba3          	sb	a3,23(sp)
    149a:	00810523          	sb	s0,10(sp)
    149e:	00074703          	lbu	a4,0(a4)
    14a2:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14a6:	002c                	addi	a1,sp,8
    14a8:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14aa:	00e10c23          	sb	a4,24(sp)
    14ae:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14b2:	00010d23          	sb	zero,26(sp)
        s += 2;
    14b6:	00248993          	addi	s3,s1,2
    write(f, s, l);
    14ba:	071000ef          	jal	ra,1d2a <write>
        s += 2;
    14be:	b5bd                	j	132c <printf+0xa2>
    char byte = c;
    14c0:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    14c4:	4605                	li	a2,1
    14c6:	002c                	addi	a1,sp,8
    14c8:	4505                	li	a0,1
    char byte = c;
    14ca:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    14ce:	05d000ef          	jal	ra,1d2a <write>
    char byte = c;
    14d2:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    14d6:	4605                	li	a2,1
    14d8:	002c                	addi	a1,sp,8
    14da:	4505                	li	a0,1
    char byte = c;
    14dc:	00f10423          	sb	a5,8(sp)
        s += 2;
    14e0:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    14e4:	047000ef          	jal	ra,1d2a <write>
        s += 2;
    14e8:	b591                	j	132c <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    14ea:	6782                	ld	a5,0(sp)
    14ec:	6380                	ld	s0,0(a5)
    14ee:	07a1                	addi	a5,a5,8
    14f0:	e03e                	sd	a5,0(sp)
    14f2:	cc05                	beqz	s0,152a <printf+0x2a0>
            l = strnlen(a, 200);
    14f4:	0c800593          	li	a1,200
    14f8:	8522                	mv	a0,s0
    14fa:	446000ef          	jal	ra,1940 <strnlen>
    write(f, s, l);
    14fe:	0005061b          	sext.w	a2,a0
    1502:	85a2                	mv	a1,s0
    1504:	4505                	li	a0,1
    1506:	025000ef          	jal	ra,1d2a <write>
        s += 2;
    150a:	00248993          	addi	s3,s1,2
    150e:	bd39                	j	132c <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1510:	0019c783          	lbu	a5,1(s3)
    1514:	84ce                	mv	s1,s3
    1516:	864e                	mv	a2,s3
    1518:	e52782e3          	beq	a5,s2,135c <printf+0xd2>
    write(f, s, l);
    151c:	4601                	li	a2,0
    151e:	85ce                	mv	a1,s3
    1520:	4505                	li	a0,1
    1522:	009000ef          	jal	ra,1d2a <write>
    1526:	84ce                	mv	s1,s3
    1528:	bbd1                	j	12fc <printf+0x72>
                a = "(null)";
    152a:	845e                	mv	s0,s7
    152c:	b7e1                	j	14f4 <printf+0x26a>

000000000000152e <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    152e:	02000793          	li	a5,32
    1532:	00f50663          	beq	a0,a5,153e <isspace+0x10>
    1536:	355d                	addiw	a0,a0,-9
    1538:	00553513          	sltiu	a0,a0,5
    153c:	8082                	ret
    153e:	4505                	li	a0,1
}
    1540:	8082                	ret

0000000000001542 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1542:	fd05051b          	addiw	a0,a0,-48
}
    1546:	00a53513          	sltiu	a0,a0,10
    154a:	8082                	ret

000000000000154c <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    154c:	02000613          	li	a2,32
    1550:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1552:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1556:	0007079b          	sext.w	a5,a4
    155a:	ff77869b          	addiw	a3,a5,-9
    155e:	04c70b63          	beq	a4,a2,15b4 <atoi+0x68>
    1562:	04d5f963          	bleu	a3,a1,15b4 <atoi+0x68>
        s++;
    switch (*s)
    1566:	02b00693          	li	a3,43
    156a:	04d70a63          	beq	a4,a3,15be <atoi+0x72>
    156e:	02d00693          	li	a3,45
    1572:	06d70463          	beq	a4,a3,15da <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1576:	fd07859b          	addiw	a1,a5,-48
    157a:	4625                	li	a2,9
    157c:	873e                	mv	a4,a5
    157e:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1580:	4e01                	li	t3,0
    while (isdigit(*s))
    1582:	04b66a63          	bltu	a2,a1,15d6 <atoi+0x8a>
    int n = 0, neg = 0;
    1586:	4501                	li	a0,0
    while (isdigit(*s))
    1588:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    158a:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    158c:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    1590:	0025179b          	slliw	a5,a0,0x2
    1594:	9d3d                	addw	a0,a0,a5
    1596:	fd07031b          	addiw	t1,a4,-48
    159a:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    159e:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15a2:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15a6:	0006071b          	sext.w	a4,a2
    15aa:	feb870e3          	bleu	a1,a6,158a <atoi+0x3e>
    return neg ? n : -n;
    15ae:	000e0563          	beqz	t3,15b8 <atoi+0x6c>
}
    15b2:	8082                	ret
        s++;
    15b4:	0505                	addi	a0,a0,1
    15b6:	bf71                	j	1552 <atoi+0x6>
    15b8:	4113053b          	subw	a0,t1,a7
    15bc:	8082                	ret
    while (isdigit(*s))
    15be:	00154783          	lbu	a5,1(a0)
    15c2:	4625                	li	a2,9
        s++;
    15c4:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15c8:	fd07859b          	addiw	a1,a5,-48
    15cc:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    15d0:	4e01                	li	t3,0
    while (isdigit(*s))
    15d2:	fab67ae3          	bleu	a1,a2,1586 <atoi+0x3a>
    15d6:	4501                	li	a0,0
}
    15d8:	8082                	ret
    while (isdigit(*s))
    15da:	00154783          	lbu	a5,1(a0)
    15de:	4625                	li	a2,9
        s++;
    15e0:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15e4:	fd07859b          	addiw	a1,a5,-48
    15e8:	0007871b          	sext.w	a4,a5
    15ec:	feb665e3          	bltu	a2,a1,15d6 <atoi+0x8a>
        neg = 1;
    15f0:	4e05                	li	t3,1
    15f2:	bf51                	j	1586 <atoi+0x3a>

00000000000015f4 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    15f4:	16060d63          	beqz	a2,176e <memset+0x17a>
    15f8:	40a007b3          	neg	a5,a0
    15fc:	8b9d                	andi	a5,a5,7
    15fe:	00778713          	addi	a4,a5,7
    1602:	482d                	li	a6,11
    1604:	0ff5f593          	andi	a1,a1,255
    1608:	fff60693          	addi	a3,a2,-1
    160c:	17076263          	bltu	a4,a6,1770 <memset+0x17c>
    1610:	16e6ea63          	bltu	a3,a4,1784 <memset+0x190>
    1614:	16078563          	beqz	a5,177e <memset+0x18a>
    1618:	00b50023          	sb	a1,0(a0)
    161c:	4705                	li	a4,1
    161e:	00150e93          	addi	t4,a0,1
    1622:	14e78c63          	beq	a5,a4,177a <memset+0x186>
    1626:	00b500a3          	sb	a1,1(a0)
    162a:	4709                	li	a4,2
    162c:	00250e93          	addi	t4,a0,2
    1630:	14e78d63          	beq	a5,a4,178a <memset+0x196>
    1634:	00b50123          	sb	a1,2(a0)
    1638:	470d                	li	a4,3
    163a:	00350e93          	addi	t4,a0,3
    163e:	12e78b63          	beq	a5,a4,1774 <memset+0x180>
    1642:	00b501a3          	sb	a1,3(a0)
    1646:	4711                	li	a4,4
    1648:	00450e93          	addi	t4,a0,4
    164c:	14e78163          	beq	a5,a4,178e <memset+0x19a>
    1650:	00b50223          	sb	a1,4(a0)
    1654:	4715                	li	a4,5
    1656:	00550e93          	addi	t4,a0,5
    165a:	12e78c63          	beq	a5,a4,1792 <memset+0x19e>
    165e:	00b502a3          	sb	a1,5(a0)
    1662:	471d                	li	a4,7
    1664:	00650e93          	addi	t4,a0,6
    1668:	12e79763          	bne	a5,a4,1796 <memset+0x1a2>
    166c:	00750e93          	addi	t4,a0,7
    1670:	00b50323          	sb	a1,6(a0)
    1674:	4f1d                	li	t5,7
    1676:	00859713          	slli	a4,a1,0x8
    167a:	8f4d                	or	a4,a4,a1
    167c:	01059e13          	slli	t3,a1,0x10
    1680:	01c76e33          	or	t3,a4,t3
    1684:	01859313          	slli	t1,a1,0x18
    1688:	006e6333          	or	t1,t3,t1
    168c:	02059893          	slli	a7,a1,0x20
    1690:	011368b3          	or	a7,t1,a7
    1694:	02859813          	slli	a6,a1,0x28
    1698:	40f60333          	sub	t1,a2,a5
    169c:	0108e833          	or	a6,a7,a6
    16a0:	03059693          	slli	a3,a1,0x30
    16a4:	00d866b3          	or	a3,a6,a3
    16a8:	03859713          	slli	a4,a1,0x38
    16ac:	97aa                	add	a5,a5,a0
    16ae:	ff837813          	andi	a6,t1,-8
    16b2:	8f55                	or	a4,a4,a3
    16b4:	00f806b3          	add	a3,a6,a5
    16b8:	e398                	sd	a4,0(a5)
    16ba:	07a1                	addi	a5,a5,8
    16bc:	fed79ee3          	bne	a5,a3,16b8 <memset+0xc4>
    16c0:	ff837693          	andi	a3,t1,-8
    16c4:	00de87b3          	add	a5,t4,a3
    16c8:	01e6873b          	addw	a4,a3,t5
    16cc:	0ad30663          	beq	t1,a3,1778 <memset+0x184>
    16d0:	00b78023          	sb	a1,0(a5)
    16d4:	0017069b          	addiw	a3,a4,1
    16d8:	08c6fb63          	bleu	a2,a3,176e <memset+0x17a>
    16dc:	00b780a3          	sb	a1,1(a5)
    16e0:	0027069b          	addiw	a3,a4,2
    16e4:	08c6f563          	bleu	a2,a3,176e <memset+0x17a>
    16e8:	00b78123          	sb	a1,2(a5)
    16ec:	0037069b          	addiw	a3,a4,3
    16f0:	06c6ff63          	bleu	a2,a3,176e <memset+0x17a>
    16f4:	00b781a3          	sb	a1,3(a5)
    16f8:	0047069b          	addiw	a3,a4,4
    16fc:	06c6f963          	bleu	a2,a3,176e <memset+0x17a>
    1700:	00b78223          	sb	a1,4(a5)
    1704:	0057069b          	addiw	a3,a4,5
    1708:	06c6f363          	bleu	a2,a3,176e <memset+0x17a>
    170c:	00b782a3          	sb	a1,5(a5)
    1710:	0067069b          	addiw	a3,a4,6
    1714:	04c6fd63          	bleu	a2,a3,176e <memset+0x17a>
    1718:	00b78323          	sb	a1,6(a5)
    171c:	0077069b          	addiw	a3,a4,7
    1720:	04c6f763          	bleu	a2,a3,176e <memset+0x17a>
    1724:	00b783a3          	sb	a1,7(a5)
    1728:	0087069b          	addiw	a3,a4,8
    172c:	04c6f163          	bleu	a2,a3,176e <memset+0x17a>
    1730:	00b78423          	sb	a1,8(a5)
    1734:	0097069b          	addiw	a3,a4,9
    1738:	02c6fb63          	bleu	a2,a3,176e <memset+0x17a>
    173c:	00b784a3          	sb	a1,9(a5)
    1740:	00a7069b          	addiw	a3,a4,10
    1744:	02c6f563          	bleu	a2,a3,176e <memset+0x17a>
    1748:	00b78523          	sb	a1,10(a5)
    174c:	00b7069b          	addiw	a3,a4,11
    1750:	00c6ff63          	bleu	a2,a3,176e <memset+0x17a>
    1754:	00b785a3          	sb	a1,11(a5)
    1758:	00c7069b          	addiw	a3,a4,12
    175c:	00c6f963          	bleu	a2,a3,176e <memset+0x17a>
    1760:	00b78623          	sb	a1,12(a5)
    1764:	2735                	addiw	a4,a4,13
    1766:	00c77463          	bleu	a2,a4,176e <memset+0x17a>
    176a:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    176e:	8082                	ret
    1770:	472d                	li	a4,11
    1772:	bd79                	j	1610 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1774:	4f0d                	li	t5,3
    1776:	b701                	j	1676 <memset+0x82>
    1778:	8082                	ret
    177a:	4f05                	li	t5,1
    177c:	bded                	j	1676 <memset+0x82>
    177e:	8eaa                	mv	t4,a0
    1780:	4f01                	li	t5,0
    1782:	bdd5                	j	1676 <memset+0x82>
    1784:	87aa                	mv	a5,a0
    1786:	4701                	li	a4,0
    1788:	b7a1                	j	16d0 <memset+0xdc>
    178a:	4f09                	li	t5,2
    178c:	b5ed                	j	1676 <memset+0x82>
    178e:	4f11                	li	t5,4
    1790:	b5dd                	j	1676 <memset+0x82>
    1792:	4f15                	li	t5,5
    1794:	b5cd                	j	1676 <memset+0x82>
    1796:	4f19                	li	t5,6
    1798:	bdf9                	j	1676 <memset+0x82>

000000000000179a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    179a:	00054703          	lbu	a4,0(a0)
    179e:	0005c783          	lbu	a5,0(a1)
    17a2:	00e79b63          	bne	a5,a4,17b8 <strcmp+0x1e>
    17a6:	cf89                	beqz	a5,17c0 <strcmp+0x26>
    17a8:	0505                	addi	a0,a0,1
    17aa:	0585                	addi	a1,a1,1
    17ac:	0005c783          	lbu	a5,0(a1)
    17b0:	00054703          	lbu	a4,0(a0)
    17b4:	fef709e3          	beq	a4,a5,17a6 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    17b8:	0007051b          	sext.w	a0,a4
}
    17bc:	9d1d                	subw	a0,a0,a5
    17be:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    17c0:	4501                	li	a0,0
}
    17c2:	9d1d                	subw	a0,a0,a5
    17c4:	8082                	ret

00000000000017c6 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17c6:	c231                	beqz	a2,180a <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17c8:	00054783          	lbu	a5,0(a0)
    17cc:	0005c683          	lbu	a3,0(a1)
    17d0:	c795                	beqz	a5,17fc <strncmp+0x36>
    17d2:	ca85                	beqz	a3,1802 <strncmp+0x3c>
    if (!n--)
    17d4:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17d6:	c615                	beqz	a2,1802 <strncmp+0x3c>
    17d8:	00150713          	addi	a4,a0,1
    17dc:	9532                	add	a0,a0,a2
    17de:	00d78963          	beq	a5,a3,17f0 <strncmp+0x2a>
    17e2:	a005                	j	1802 <strncmp+0x3c>
    17e4:	ce99                	beqz	a3,1802 <strncmp+0x3c>
    17e6:	00e50e63          	beq	a0,a4,1802 <strncmp+0x3c>
    17ea:	0705                	addi	a4,a4,1
    17ec:	00d79b63          	bne	a5,a3,1802 <strncmp+0x3c>
    17f0:	00074783          	lbu	a5,0(a4)
    17f4:	0585                	addi	a1,a1,1
    17f6:	0005c683          	lbu	a3,0(a1)
    17fa:	f7ed                	bnez	a5,17e4 <strncmp+0x1e>
    17fc:	4501                	li	a0,0
        ;
    return *l - *r;
    17fe:	9d15                	subw	a0,a0,a3
    1800:	8082                	ret
    1802:	0007851b          	sext.w	a0,a5
    1806:	9d15                	subw	a0,a0,a3
    1808:	8082                	ret
        return 0;
    180a:	4501                	li	a0,0
}
    180c:	8082                	ret

000000000000180e <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    180e:	00757793          	andi	a5,a0,7
    1812:	cfa1                	beqz	a5,186a <strlen+0x5c>
        if (!*s)
    1814:	00054783          	lbu	a5,0(a0)
    1818:	cbb9                	beqz	a5,186e <strlen+0x60>
    181a:	87aa                	mv	a5,a0
    181c:	a021                	j	1824 <strlen+0x16>
    181e:	0007c703          	lbu	a4,0(a5)
    1822:	c329                	beqz	a4,1864 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    1824:	0785                	addi	a5,a5,1
    1826:	0077f713          	andi	a4,a5,7
    182a:	fb75                	bnez	a4,181e <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    182c:	00000717          	auipc	a4,0x0
    1830:	7bc70713          	addi	a4,a4,1980 # 1fe8 <__clone+0x84>
    1834:	630c                	ld	a1,0(a4)
    1836:	00000717          	auipc	a4,0x0
    183a:	7ba70713          	addi	a4,a4,1978 # 1ff0 <__clone+0x8c>
    183e:	6394                	ld	a3,0(a5)
    1840:	6310                	ld	a2,0(a4)
    1842:	a019                	j	1848 <strlen+0x3a>
    1844:	07a1                	addi	a5,a5,8
    1846:	6394                	ld	a3,0(a5)
    1848:	00b68733          	add	a4,a3,a1
    184c:	fff6c693          	not	a3,a3
    1850:	8f75                	and	a4,a4,a3
    1852:	8f71                	and	a4,a4,a2
    1854:	db65                	beqz	a4,1844 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    1856:	0007c703          	lbu	a4,0(a5)
    185a:	c709                	beqz	a4,1864 <strlen+0x56>
    185c:	0785                	addi	a5,a5,1
    185e:	0007c703          	lbu	a4,0(a5)
    1862:	ff6d                	bnez	a4,185c <strlen+0x4e>
        ;
    return s - a;
    1864:	40a78533          	sub	a0,a5,a0
}
    1868:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    186a:	87aa                	mv	a5,a0
    186c:	b7c1                	j	182c <strlen+0x1e>
        if (!*s)
    186e:	4501                	li	a0,0
            return s - a;
    1870:	8082                	ret

0000000000001872 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1872:	00757793          	andi	a5,a0,7
    1876:	0ff5f593          	andi	a1,a1,255
    187a:	cb99                	beqz	a5,1890 <memchr+0x1e>
    187c:	c655                	beqz	a2,1928 <memchr+0xb6>
    187e:	00054783          	lbu	a5,0(a0)
    1882:	0ab78663          	beq	a5,a1,192e <memchr+0xbc>
    1886:	0505                	addi	a0,a0,1
    1888:	00757793          	andi	a5,a0,7
    188c:	167d                	addi	a2,a2,-1
    188e:	f7fd                	bnez	a5,187c <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1890:	4701                	li	a4,0
    if (n && *s != c)
    1892:	ca49                	beqz	a2,1924 <memchr+0xb2>
    1894:	00054783          	lbu	a5,0(a0)
    1898:	08b78b63          	beq	a5,a1,192e <memchr+0xbc>
        size_t k = ONES * c;
    189c:	00000797          	auipc	a5,0x0
    18a0:	75c78793          	addi	a5,a5,1884 # 1ff8 <__clone+0x94>
    18a4:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18a6:	479d                	li	a5,7
        size_t k = ONES * c;
    18a8:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18ac:	08c7f863          	bleu	a2,a5,193c <memchr+0xca>
    18b0:	611c                	ld	a5,0(a0)
    18b2:	00000317          	auipc	t1,0x0
    18b6:	73e30313          	addi	t1,t1,1854 # 1ff0 <__clone+0x8c>
    18ba:	00033803          	ld	a6,0(t1)
    18be:	00f8c7b3          	xor	a5,a7,a5
    18c2:	fff7c713          	not	a4,a5
    18c6:	8f95                	sub	a5,a5,a3
    18c8:	8ff9                	and	a5,a5,a4
    18ca:	0107f7b3          	and	a5,a5,a6
    18ce:	e7bd                	bnez	a5,193c <memchr+0xca>
    18d0:	4e1d                	li	t3,7
    18d2:	00000e97          	auipc	t4,0x0
    18d6:	716e8e93          	addi	t4,t4,1814 # 1fe8 <__clone+0x84>
    18da:	a005                	j	18fa <memchr+0x88>
    18dc:	6514                	ld	a3,8(a0)
    18de:	000eb783          	ld	a5,0(t4)
    18e2:	00033803          	ld	a6,0(t1)
    18e6:	00d8c6b3          	xor	a3,a7,a3
    18ea:	97b6                	add	a5,a5,a3
    18ec:	fff6c693          	not	a3,a3
    18f0:	8ff5                	and	a5,a5,a3
    18f2:	0107f7b3          	and	a5,a5,a6
    18f6:	e3a1                	bnez	a5,1936 <memchr+0xc4>
    18f8:	853a                	mv	a0,a4
    18fa:	1661                	addi	a2,a2,-8
    18fc:	00850713          	addi	a4,a0,8
    1900:	fcce6ee3          	bltu	t3,a2,18dc <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1904:	c215                	beqz	a2,1928 <memchr+0xb6>
    1906:	00074783          	lbu	a5,0(a4)
    190a:	00f58d63          	beq	a1,a5,1924 <memchr+0xb2>
    190e:	00170793          	addi	a5,a4,1
    1912:	963a                	add	a2,a2,a4
    1914:	873e                	mv	a4,a5
    1916:	00f60963          	beq	a2,a5,1928 <memchr+0xb6>
    191a:	0007c683          	lbu	a3,0(a5)
    191e:	0785                	addi	a5,a5,1
    1920:	feb69ae3          	bne	a3,a1,1914 <memchr+0xa2>
}
    1924:	853a                	mv	a0,a4
    1926:	8082                	ret
    return n ? (void *)s : 0;
    1928:	4701                	li	a4,0
}
    192a:	853a                	mv	a0,a4
    192c:	8082                	ret
    192e:	872a                	mv	a4,a0
    1930:	00074783          	lbu	a5,0(a4)
    1934:	bfd9                	j	190a <memchr+0x98>
    1936:	00854783          	lbu	a5,8(a0)
    193a:	bfc1                	j	190a <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    193c:	872a                	mv	a4,a0
    193e:	bfc1                	j	190e <memchr+0x9c>

0000000000001940 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1940:	00757793          	andi	a5,a0,7
    1944:	cfc5                	beqz	a5,19fc <strnlen+0xbc>
    1946:	c1c5                	beqz	a1,19e6 <strnlen+0xa6>
    1948:	00054783          	lbu	a5,0(a0)
    194c:	cfd9                	beqz	a5,19ea <strnlen+0xaa>
    194e:	87ae                	mv	a5,a1
    1950:	86aa                	mv	a3,a0
    1952:	a029                	j	195c <strnlen+0x1c>
    1954:	cbc9                	beqz	a5,19e6 <strnlen+0xa6>
    1956:	0006c703          	lbu	a4,0(a3)
    195a:	cb51                	beqz	a4,19ee <strnlen+0xae>
    195c:	0685                	addi	a3,a3,1
    195e:	0076f713          	andi	a4,a3,7
    1962:	17fd                	addi	a5,a5,-1
    1964:	fb65                	bnez	a4,1954 <strnlen+0x14>
    if (n && *s != c)
    1966:	c3c1                	beqz	a5,19e6 <strnlen+0xa6>
    1968:	0006c703          	lbu	a4,0(a3)
    196c:	c349                	beqz	a4,19ee <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    196e:	471d                	li	a4,7
    1970:	08f77a63          	bleu	a5,a4,1a04 <strnlen+0xc4>
    1974:	00000e17          	auipc	t3,0x0
    1978:	674e0e13          	addi	t3,t3,1652 # 1fe8 <__clone+0x84>
    197c:	6290                	ld	a2,0(a3)
    197e:	000e3703          	ld	a4,0(t3)
    1982:	00000e97          	auipc	t4,0x0
    1986:	66ee8e93          	addi	t4,t4,1646 # 1ff0 <__clone+0x8c>
    198a:	000eb803          	ld	a6,0(t4)
    198e:	9732                	add	a4,a4,a2
    1990:	fff64613          	not	a2,a2
    1994:	8f71                	and	a4,a4,a2
    1996:	01077733          	and	a4,a4,a6
    199a:	e72d                	bnez	a4,1a04 <strnlen+0xc4>
    199c:	4f1d                	li	t5,7
    199e:	a839                	j	19bc <strnlen+0x7c>
    19a0:	6698                	ld	a4,8(a3)
    19a2:	000e3303          	ld	t1,0(t3)
    19a6:	000eb803          	ld	a6,0(t4)
    19aa:	fff74893          	not	a7,a4
    19ae:	971a                	add	a4,a4,t1
    19b0:	01177733          	and	a4,a4,a7
    19b4:	01077733          	and	a4,a4,a6
    19b8:	ef1d                	bnez	a4,19f6 <strnlen+0xb6>
    19ba:	86b2                	mv	a3,a2
    19bc:	17e1                	addi	a5,a5,-8
    19be:	00868613          	addi	a2,a3,8
    19c2:	fcff6fe3          	bltu	t5,a5,19a0 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    19c6:	c385                	beqz	a5,19e6 <strnlen+0xa6>
    19c8:	00064703          	lbu	a4,0(a2)
    19cc:	cb19                	beqz	a4,19e2 <strnlen+0xa2>
    19ce:	00160713          	addi	a4,a2,1
    19d2:	97b2                	add	a5,a5,a2
    19d4:	863a                	mv	a2,a4
    19d6:	00e78863          	beq	a5,a4,19e6 <strnlen+0xa6>
    19da:	0705                	addi	a4,a4,1
    19dc:	fff74683          	lbu	a3,-1(a4)
    19e0:	faf5                	bnez	a3,19d4 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    19e2:	40a605b3          	sub	a1,a2,a0
}
    19e6:	852e                	mv	a0,a1
    19e8:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19ea:	87ae                	mv	a5,a1
    19ec:	86aa                	mv	a3,a0
    if (n && *s != c)
    19ee:	8636                	mv	a2,a3
    19f0:	00064703          	lbu	a4,0(a2)
    19f4:	bfe1                	j	19cc <strnlen+0x8c>
    19f6:	0086c703          	lbu	a4,8(a3)
    19fa:	bfc9                	j	19cc <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19fc:	87ae                	mv	a5,a1
    19fe:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a00:	f7a5                	bnez	a5,1968 <strnlen+0x28>
    1a02:	b7d5                	j	19e6 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a04:	8636                	mv	a2,a3
    1a06:	b7e1                	j	19ce <strnlen+0x8e>

0000000000001a08 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a08:	00b547b3          	xor	a5,a0,a1
    1a0c:	8b9d                	andi	a5,a5,7
    1a0e:	efa9                	bnez	a5,1a68 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a10:	0075f793          	andi	a5,a1,7
    1a14:	c38d                	beqz	a5,1a36 <strcpy+0x2e>
            if (!(*d = *s))
    1a16:	0005c783          	lbu	a5,0(a1)
    1a1a:	00f50023          	sb	a5,0(a0)
    1a1e:	e799                	bnez	a5,1a2c <strcpy+0x24>
    1a20:	a095                	j	1a84 <strcpy+0x7c>
    1a22:	0005c783          	lbu	a5,0(a1)
    1a26:	00f50023          	sb	a5,0(a0)
    1a2a:	cbb9                	beqz	a5,1a80 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a2c:	0585                	addi	a1,a1,1
    1a2e:	0075f793          	andi	a5,a1,7
    1a32:	0505                	addi	a0,a0,1
    1a34:	f7fd                	bnez	a5,1a22 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a36:	00000797          	auipc	a5,0x0
    1a3a:	5b278793          	addi	a5,a5,1458 # 1fe8 <__clone+0x84>
    1a3e:	0007b803          	ld	a6,0(a5)
    1a42:	00000797          	auipc	a5,0x0
    1a46:	5ae78793          	addi	a5,a5,1454 # 1ff0 <__clone+0x8c>
    1a4a:	6198                	ld	a4,0(a1)
    1a4c:	6390                	ld	a2,0(a5)
    1a4e:	a031                	j	1a5a <strcpy+0x52>
    1a50:	0521                	addi	a0,a0,8
    1a52:	05a1                	addi	a1,a1,8
    1a54:	fee53c23          	sd	a4,-8(a0)
    1a58:	6198                	ld	a4,0(a1)
    1a5a:	010707b3          	add	a5,a4,a6
    1a5e:	fff74693          	not	a3,a4
    1a62:	8ff5                	and	a5,a5,a3
    1a64:	8ff1                	and	a5,a5,a2
    1a66:	d7ed                	beqz	a5,1a50 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a68:	0005c783          	lbu	a5,0(a1)
    1a6c:	00f50023          	sb	a5,0(a0)
    1a70:	cb89                	beqz	a5,1a82 <strcpy+0x7a>
    1a72:	0585                	addi	a1,a1,1
    1a74:	0005c783          	lbu	a5,0(a1)
    1a78:	0505                	addi	a0,a0,1
    1a7a:	00f50023          	sb	a5,0(a0)
    1a7e:	fbf5                	bnez	a5,1a72 <strcpy+0x6a>
        ;
    return d;
}
    1a80:	8082                	ret
    1a82:	8082                	ret
    1a84:	8082                	ret

0000000000001a86 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a86:	00b547b3          	xor	a5,a0,a1
    1a8a:	8b9d                	andi	a5,a5,7
    1a8c:	ebc1                	bnez	a5,1b1c <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a8e:	0075f793          	andi	a5,a1,7
    1a92:	cf91                	beqz	a5,1aae <strncpy+0x28>
    1a94:	20060e63          	beqz	a2,1cb0 <strncpy+0x22a>
    1a98:	0005c783          	lbu	a5,0(a1)
    1a9c:	00f50023          	sb	a5,0(a0)
    1aa0:	c3d5                	beqz	a5,1b44 <strncpy+0xbe>
    1aa2:	0585                	addi	a1,a1,1
    1aa4:	0075f793          	andi	a5,a1,7
    1aa8:	167d                	addi	a2,a2,-1
    1aaa:	0505                	addi	a0,a0,1
    1aac:	f7e5                	bnez	a5,1a94 <strncpy+0xe>
            ;
        if (!n || !*s)
    1aae:	20060163          	beqz	a2,1cb0 <strncpy+0x22a>
    1ab2:	0005c683          	lbu	a3,0(a1)
    1ab6:	c6d9                	beqz	a3,1b44 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ab8:	479d                	li	a5,7
    1aba:	22c7f563          	bleu	a2,a5,1ce4 <strncpy+0x25e>
    1abe:	00000317          	auipc	t1,0x0
    1ac2:	52a30313          	addi	t1,t1,1322 # 1fe8 <__clone+0x84>
    1ac6:	6198                	ld	a4,0(a1)
    1ac8:	00033783          	ld	a5,0(t1)
    1acc:	00000e17          	auipc	t3,0x0
    1ad0:	524e0e13          	addi	t3,t3,1316 # 1ff0 <__clone+0x8c>
    1ad4:	000e3803          	ld	a6,0(t3)
    1ad8:	97ba                	add	a5,a5,a4
    1ada:	fff74893          	not	a7,a4
    1ade:	0117f7b3          	and	a5,a5,a7
    1ae2:	0107f7b3          	and	a5,a5,a6
    1ae6:	1e079f63          	bnez	a5,1ce4 <strncpy+0x25e>
    1aea:	4e9d                	li	t4,7
    1aec:	a005                	j	1b0c <strncpy+0x86>
    1aee:	6598                	ld	a4,8(a1)
    1af0:	00033783          	ld	a5,0(t1)
    1af4:	000e3803          	ld	a6,0(t3)
    1af8:	fff74893          	not	a7,a4
    1afc:	97ba                	add	a5,a5,a4
    1afe:	0117f7b3          	and	a5,a5,a7
    1b02:	0107f7b3          	and	a5,a5,a6
    1b06:	1a079f63          	bnez	a5,1cc4 <strncpy+0x23e>
    1b0a:	85b6                	mv	a1,a3
            *wd = *ws;
    1b0c:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b0e:	1661                	addi	a2,a2,-8
    1b10:	00858693          	addi	a3,a1,8
    1b14:	0521                	addi	a0,a0,8
    1b16:	fcceece3          	bltu	t4,a2,1aee <strncpy+0x68>
    1b1a:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b1c:	18060a63          	beqz	a2,1cb0 <strncpy+0x22a>
    1b20:	0005c783          	lbu	a5,0(a1)
    1b24:	872a                	mv	a4,a0
    1b26:	00f50023          	sb	a5,0(a0)
    1b2a:	e799                	bnez	a5,1b38 <strncpy+0xb2>
    1b2c:	a829                	j	1b46 <strncpy+0xc0>
    1b2e:	0005c783          	lbu	a5,0(a1)
    1b32:	00f70023          	sb	a5,0(a4)
    1b36:	cb81                	beqz	a5,1b46 <strncpy+0xc0>
    1b38:	167d                	addi	a2,a2,-1
    1b3a:	0585                	addi	a1,a1,1
    1b3c:	0705                	addi	a4,a4,1
    1b3e:	fa65                	bnez	a2,1b2e <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b40:	853a                	mv	a0,a4
    1b42:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1b44:	872a                	mv	a4,a0
    1b46:	4805                	li	a6,1
    1b48:	14061c63          	bnez	a2,1ca0 <strncpy+0x21a>
    1b4c:	40e007b3          	neg	a5,a4
    1b50:	8b9d                	andi	a5,a5,7
    1b52:	4581                	li	a1,0
    1b54:	12061e63          	bnez	a2,1c90 <strncpy+0x20a>
    1b58:	00778693          	addi	a3,a5,7
    1b5c:	452d                	li	a0,11
    1b5e:	12a6e763          	bltu	a3,a0,1c8c <strncpy+0x206>
    1b62:	16d5e663          	bltu	a1,a3,1cce <strncpy+0x248>
    1b66:	14078c63          	beqz	a5,1cbe <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b6a:	00070023          	sb	zero,0(a4)
    1b6e:	4585                	li	a1,1
    1b70:	00170693          	addi	a3,a4,1
    1b74:	14b78363          	beq	a5,a1,1cba <strncpy+0x234>
    1b78:	000700a3          	sb	zero,1(a4)
    1b7c:	4589                	li	a1,2
    1b7e:	00270693          	addi	a3,a4,2
    1b82:	14b78963          	beq	a5,a1,1cd4 <strncpy+0x24e>
    1b86:	00070123          	sb	zero,2(a4)
    1b8a:	458d                	li	a1,3
    1b8c:	00370693          	addi	a3,a4,3
    1b90:	12b78363          	beq	a5,a1,1cb6 <strncpy+0x230>
    1b94:	000701a3          	sb	zero,3(a4)
    1b98:	4591                	li	a1,4
    1b9a:	00470693          	addi	a3,a4,4
    1b9e:	12b78d63          	beq	a5,a1,1cd8 <strncpy+0x252>
    1ba2:	00070223          	sb	zero,4(a4)
    1ba6:	4595                	li	a1,5
    1ba8:	00570693          	addi	a3,a4,5
    1bac:	12b78863          	beq	a5,a1,1cdc <strncpy+0x256>
    1bb0:	000702a3          	sb	zero,5(a4)
    1bb4:	459d                	li	a1,7
    1bb6:	00670693          	addi	a3,a4,6
    1bba:	12b79363          	bne	a5,a1,1ce0 <strncpy+0x25a>
    1bbe:	00770693          	addi	a3,a4,7
    1bc2:	00070323          	sb	zero,6(a4)
    1bc6:	40f80833          	sub	a6,a6,a5
    1bca:	ff887513          	andi	a0,a6,-8
    1bce:	97ba                	add	a5,a5,a4
    1bd0:	953e                	add	a0,a0,a5
    1bd2:	0007b023          	sd	zero,0(a5)
    1bd6:	07a1                	addi	a5,a5,8
    1bd8:	fea79de3          	bne	a5,a0,1bd2 <strncpy+0x14c>
    1bdc:	ff887513          	andi	a0,a6,-8
    1be0:	9da9                	addw	a1,a1,a0
    1be2:	00a687b3          	add	a5,a3,a0
    1be6:	f4a80de3          	beq	a6,a0,1b40 <strncpy+0xba>
    1bea:	00078023          	sb	zero,0(a5)
    1bee:	0015869b          	addiw	a3,a1,1
    1bf2:	f4c6f7e3          	bleu	a2,a3,1b40 <strncpy+0xba>
    1bf6:	000780a3          	sb	zero,1(a5)
    1bfa:	0025869b          	addiw	a3,a1,2
    1bfe:	f4c6f1e3          	bleu	a2,a3,1b40 <strncpy+0xba>
    1c02:	00078123          	sb	zero,2(a5)
    1c06:	0035869b          	addiw	a3,a1,3
    1c0a:	f2c6fbe3          	bleu	a2,a3,1b40 <strncpy+0xba>
    1c0e:	000781a3          	sb	zero,3(a5)
    1c12:	0045869b          	addiw	a3,a1,4
    1c16:	f2c6f5e3          	bleu	a2,a3,1b40 <strncpy+0xba>
    1c1a:	00078223          	sb	zero,4(a5)
    1c1e:	0055869b          	addiw	a3,a1,5
    1c22:	f0c6ffe3          	bleu	a2,a3,1b40 <strncpy+0xba>
    1c26:	000782a3          	sb	zero,5(a5)
    1c2a:	0065869b          	addiw	a3,a1,6
    1c2e:	f0c6f9e3          	bleu	a2,a3,1b40 <strncpy+0xba>
    1c32:	00078323          	sb	zero,6(a5)
    1c36:	0075869b          	addiw	a3,a1,7
    1c3a:	f0c6f3e3          	bleu	a2,a3,1b40 <strncpy+0xba>
    1c3e:	000783a3          	sb	zero,7(a5)
    1c42:	0085869b          	addiw	a3,a1,8
    1c46:	eec6fde3          	bleu	a2,a3,1b40 <strncpy+0xba>
    1c4a:	00078423          	sb	zero,8(a5)
    1c4e:	0095869b          	addiw	a3,a1,9
    1c52:	eec6f7e3          	bleu	a2,a3,1b40 <strncpy+0xba>
    1c56:	000784a3          	sb	zero,9(a5)
    1c5a:	00a5869b          	addiw	a3,a1,10
    1c5e:	eec6f1e3          	bleu	a2,a3,1b40 <strncpy+0xba>
    1c62:	00078523          	sb	zero,10(a5)
    1c66:	00b5869b          	addiw	a3,a1,11
    1c6a:	ecc6fbe3          	bleu	a2,a3,1b40 <strncpy+0xba>
    1c6e:	000785a3          	sb	zero,11(a5)
    1c72:	00c5869b          	addiw	a3,a1,12
    1c76:	ecc6f5e3          	bleu	a2,a3,1b40 <strncpy+0xba>
    1c7a:	00078623          	sb	zero,12(a5)
    1c7e:	25b5                	addiw	a1,a1,13
    1c80:	ecc5f0e3          	bleu	a2,a1,1b40 <strncpy+0xba>
    1c84:	000786a3          	sb	zero,13(a5)
}
    1c88:	853a                	mv	a0,a4
    1c8a:	8082                	ret
    1c8c:	46ad                	li	a3,11
    1c8e:	bdd1                	j	1b62 <strncpy+0xdc>
    1c90:	00778693          	addi	a3,a5,7
    1c94:	452d                	li	a0,11
    1c96:	fff60593          	addi	a1,a2,-1
    1c9a:	eca6f4e3          	bleu	a0,a3,1b62 <strncpy+0xdc>
    1c9e:	b7fd                	j	1c8c <strncpy+0x206>
    1ca0:	40e007b3          	neg	a5,a4
    1ca4:	8832                	mv	a6,a2
    1ca6:	8b9d                	andi	a5,a5,7
    1ca8:	4581                	li	a1,0
    1caa:	ea0607e3          	beqz	a2,1b58 <strncpy+0xd2>
    1cae:	b7cd                	j	1c90 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1cb0:	872a                	mv	a4,a0
}
    1cb2:	853a                	mv	a0,a4
    1cb4:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cb6:	458d                	li	a1,3
    1cb8:	b739                	j	1bc6 <strncpy+0x140>
    1cba:	4585                	li	a1,1
    1cbc:	b729                	j	1bc6 <strncpy+0x140>
    1cbe:	86ba                	mv	a3,a4
    1cc0:	4581                	li	a1,0
    1cc2:	b711                	j	1bc6 <strncpy+0x140>
    1cc4:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1cc8:	872a                	mv	a4,a0
    1cca:	85b6                	mv	a1,a3
    1ccc:	bda9                	j	1b26 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cce:	87ba                	mv	a5,a4
    1cd0:	4581                	li	a1,0
    1cd2:	bf21                	j	1bea <strncpy+0x164>
    1cd4:	4589                	li	a1,2
    1cd6:	bdc5                	j	1bc6 <strncpy+0x140>
    1cd8:	4591                	li	a1,4
    1cda:	b5f5                	j	1bc6 <strncpy+0x140>
    1cdc:	4595                	li	a1,5
    1cde:	b5e5                	j	1bc6 <strncpy+0x140>
    1ce0:	4599                	li	a1,6
    1ce2:	b5d5                	j	1bc6 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1ce4:	00d50023          	sb	a3,0(a0)
    1ce8:	872a                	mv	a4,a0
    1cea:	b5b9                	j	1b38 <strncpy+0xb2>

0000000000001cec <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cec:	87aa                	mv	a5,a0
    1cee:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cf0:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cf4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cf8:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cfa:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cfc:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d00:	2501                	sext.w	a0,a0
    1d02:	8082                	ret

0000000000001d04 <openat>:
    register long a7 __asm__("a7") = n;
    1d04:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d08:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d0c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d10:	2501                	sext.w	a0,a0
    1d12:	8082                	ret

0000000000001d14 <close>:
    register long a7 __asm__("a7") = n;
    1d14:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d18:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d1c:	2501                	sext.w	a0,a0
    1d1e:	8082                	ret

0000000000001d20 <read>:
    register long a7 __asm__("a7") = n;
    1d20:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d24:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d28:	8082                	ret

0000000000001d2a <write>:
    register long a7 __asm__("a7") = n;
    1d2a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d2e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d32:	8082                	ret

0000000000001d34 <getpid>:
    register long a7 __asm__("a7") = n;
    1d34:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d38:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d3c:	2501                	sext.w	a0,a0
    1d3e:	8082                	ret

0000000000001d40 <getppid>:
    register long a7 __asm__("a7") = n;
    1d40:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d44:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d48:	2501                	sext.w	a0,a0
    1d4a:	8082                	ret

0000000000001d4c <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d4c:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d50:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d54:	2501                	sext.w	a0,a0
    1d56:	8082                	ret

0000000000001d58 <fork>:
    register long a7 __asm__("a7") = n;
    1d58:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d5c:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d5e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d60:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d64:	2501                	sext.w	a0,a0
    1d66:	8082                	ret

0000000000001d68 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d68:	85b2                	mv	a1,a2
    1d6a:	863a                	mv	a2,a4
    if (stack)
    1d6c:	c191                	beqz	a1,1d70 <clone+0x8>
	stack += stack_size;
    1d6e:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d70:	4781                	li	a5,0
    1d72:	4701                	li	a4,0
    1d74:	4681                	li	a3,0
    1d76:	2601                	sext.w	a2,a2
    1d78:	1ec0006f          	j	1f64 <__clone>

0000000000001d7c <exit>:
    register long a7 __asm__("a7") = n;
    1d7c:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d80:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d84:	8082                	ret

0000000000001d86 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d86:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d8a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d8c:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <exec>:
    register long a7 __asm__("a7") = n;
    1d94:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d98:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <execve>:
    register long a7 __asm__("a7") = n;
    1da0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da4:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <times>:
    register long a7 __asm__("a7") = n;
    1dac:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1db0:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <get_time>:

int64 get_time()
{
    1db8:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1dba:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1dbe:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1dc0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc2:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	ed09                	bnez	a0,1de2 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1dca:	67a2                	ld	a5,8(sp)
    1dcc:	3e800713          	li	a4,1000
    1dd0:	00015503          	lhu	a0,0(sp)
    1dd4:	02e7d7b3          	divu	a5,a5,a4
    1dd8:	02e50533          	mul	a0,a0,a4
    1ddc:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1dde:	0141                	addi	sp,sp,16
    1de0:	8082                	ret
        return -1;
    1de2:	557d                	li	a0,-1
    1de4:	bfed                	j	1dde <get_time+0x26>

0000000000001de6 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1de6:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dea:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <time>:
    register long a7 __asm__("a7") = n;
    1df2:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1df6:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <sleep>:

int sleep(unsigned long long time)
{
    1dfe:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e00:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e02:	850a                	mv	a0,sp
    1e04:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e06:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e0a:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0c:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e10:	e501                	bnez	a0,1e18 <sleep+0x1a>
    return 0;
    1e12:	4501                	li	a0,0
}
    1e14:	0141                	addi	sp,sp,16
    1e16:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e18:	4502                	lw	a0,0(sp)
}
    1e1a:	0141                	addi	sp,sp,16
    1e1c:	8082                	ret

0000000000001e1e <set_priority>:
    register long a7 __asm__("a7") = n;
    1e1e:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e22:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e2a:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e2e:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e32:	8082                	ret

0000000000001e34 <munmap>:
    register long a7 __asm__("a7") = n;
    1e34:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e38:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <wait>:

int wait(int *code)
{
    1e40:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e42:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e46:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e48:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e4a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e4c:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <spawn>:
    register long a7 __asm__("a7") = n;
    1e54:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e58:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e5c:	2501                	sext.w	a0,a0
    1e5e:	8082                	ret

0000000000001e60 <mailread>:
    register long a7 __asm__("a7") = n;
    1e60:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e64:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e68:	2501                	sext.w	a0,a0
    1e6a:	8082                	ret

0000000000001e6c <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e6c:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e70:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <fstat>:
    register long a7 __asm__("a7") = n;
    1e78:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7c:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e80:	2501                	sext.w	a0,a0
    1e82:	8082                	ret

0000000000001e84 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e84:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e86:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e8a:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e8c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e94:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e96:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e9a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e9c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1ea0:	2501                	sext.w	a0,a0
    1ea2:	8082                	ret

0000000000001ea4 <link>:

int link(char *old_path, char *new_path)
{
    1ea4:	87aa                	mv	a5,a0
    1ea6:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1ea8:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1eac:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eb0:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eb2:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1eb6:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eb8:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <unlink>:

int unlink(char *path)
{
    1ec0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ec2:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1ec6:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1eca:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ecc:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ed0:	2501                	sext.w	a0,a0
    1ed2:	8082                	ret

0000000000001ed4 <uname>:
    register long a7 __asm__("a7") = n;
    1ed4:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1ed8:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1edc:	2501                	sext.w	a0,a0
    1ede:	8082                	ret

0000000000001ee0 <brk>:
    register long a7 __asm__("a7") = n;
    1ee0:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1ee4:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1ee8:	2501                	sext.w	a0,a0
    1eea:	8082                	ret

0000000000001eec <getcwd>:
    register long a7 __asm__("a7") = n;
    1eec:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eee:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ef2:	8082                	ret

0000000000001ef4 <chdir>:
    register long a7 __asm__("a7") = n;
    1ef4:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1ef8:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1efc:	2501                	sext.w	a0,a0
    1efe:	8082                	ret

0000000000001f00 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f00:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f02:	02059613          	slli	a2,a1,0x20
    1f06:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f08:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f0c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f10:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f12:	00000073          	ecall
}
    1f16:	2501                	sext.w	a0,a0
    1f18:	8082                	ret

0000000000001f1a <getdents>:
    register long a7 __asm__("a7") = n;
    1f1a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f1e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f22:	2501                	sext.w	a0,a0
    1f24:	8082                	ret

0000000000001f26 <pipe>:
    register long a7 __asm__("a7") = n;
    1f26:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f2a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f2c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <dup>:
    register long a7 __asm__("a7") = n;
    1f34:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f36:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f3a:	2501                	sext.w	a0,a0
    1f3c:	8082                	ret

0000000000001f3e <dup2>:
    register long a7 __asm__("a7") = n;
    1f3e:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f40:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f42:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f46:	2501                	sext.w	a0,a0
    1f48:	8082                	ret

0000000000001f4a <mount>:
    register long a7 __asm__("a7") = n;
    1f4a:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f4e:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f52:	2501                	sext.w	a0,a0
    1f54:	8082                	ret

0000000000001f56 <umount>:
    register long a7 __asm__("a7") = n;
    1f56:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f5a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f5c:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f60:	2501                	sext.w	a0,a0
    1f62:	8082                	ret

0000000000001f64 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f64:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1f66:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f68:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f6a:	8532                	mv	a0,a2
	mv a2, a4
    1f6c:	863a                	mv	a2,a4
	mv a3, a5
    1f6e:	86be                	mv	a3,a5
	mv a4, a6
    1f70:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f72:	0dc00893          	li	a7,220
	ecall
    1f76:	00000073          	ecall

	beqz a0, 1f
    1f7a:	c111                	beqz	a0,1f7e <__clone+0x1a>
	# Parent
	ret
    1f7c:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f7e:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f80:	6522                	ld	a0,8(sp)
	jalr a1
    1f82:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f84:	05d00893          	li	a7,93
	ecall
    1f88:	00000073          	ecall
