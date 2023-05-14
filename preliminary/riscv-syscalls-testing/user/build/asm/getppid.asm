
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/getppid:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0880006f          	j	108a <__start_main>

0000000000001006 <test_getppid>:
 * 不能通过测试则输出：
 * "  getppid error."
 */

int test_getppid()
{
    1006:	1141                	addi	sp,sp,-16
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	fa850513          	addi	a0,a0,-88 # 1fb0 <__clone+0x2a>
{
    1010:	e406                	sd	ra,8(sp)
    TEST_START(__func__);
    1012:	278000ef          	jal	ra,128a <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	02a50513          	addi	a0,a0,42 # 2040 <__func__.1185>
    101e:	26c000ef          	jal	ra,128a <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	fa650513          	addi	a0,a0,-90 # 1fc8 <__clone+0x42>
    102a:	260000ef          	jal	ra,128a <puts>
    pid_t ppid = getppid();
    102e:	535000ef          	jal	ra,1d62 <getppid>
    if(ppid > 0) printf("  getppid success. ppid : %d\n", ppid);
    1032:	02a05d63          	blez	a0,106c <test_getppid+0x66>
    1036:	85aa                	mv	a1,a0
    1038:	00001517          	auipc	a0,0x1
    103c:	fa050513          	addi	a0,a0,-96 # 1fd8 <__clone+0x52>
    1040:	26c000ef          	jal	ra,12ac <printf>
    else printf("  getppid error.\n");
    TEST_END(__func__);
    1044:	00001517          	auipc	a0,0x1
    1048:	fcc50513          	addi	a0,a0,-52 # 2010 <__clone+0x8a>
    104c:	23e000ef          	jal	ra,128a <puts>
    1050:	00001517          	auipc	a0,0x1
    1054:	ff050513          	addi	a0,a0,-16 # 2040 <__func__.1185>
    1058:	232000ef          	jal	ra,128a <puts>
}
    105c:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    105e:	00001517          	auipc	a0,0x1
    1062:	f6a50513          	addi	a0,a0,-150 # 1fc8 <__clone+0x42>
}
    1066:	0141                	addi	sp,sp,16
    TEST_END(__func__);
    1068:	2220006f          	j	128a <puts>
    else printf("  getppid error.\n");
    106c:	00001517          	auipc	a0,0x1
    1070:	f8c50513          	addi	a0,a0,-116 # 1ff8 <__clone+0x72>
    1074:	238000ef          	jal	ra,12ac <printf>
    1078:	b7f1                	j	1044 <test_getppid+0x3e>

000000000000107a <main>:

int main(void) {
    107a:	1141                	addi	sp,sp,-16
    107c:	e406                	sd	ra,8(sp)
	test_getppid();
    107e:	f89ff0ef          	jal	ra,1006 <test_getppid>
	return 0;
}
    1082:	60a2                	ld	ra,8(sp)
    1084:	4501                	li	a0,0
    1086:	0141                	addi	sp,sp,16
    1088:	8082                	ret

000000000000108a <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    108a:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    108c:	4108                	lw	a0,0(a0)
{
    108e:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1090:	05a1                	addi	a1,a1,8
{
    1092:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1094:	fe7ff0ef          	jal	ra,107a <main>
    1098:	507000ef          	jal	ra,1d9e <exit>
	return 0;
}
    109c:	60a2                	ld	ra,8(sp)
    109e:	4501                	li	a0,0
    10a0:	0141                	addi	sp,sp,16
    10a2:	8082                	ret

00000000000010a4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10a4:	7179                	addi	sp,sp,-48
    10a6:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10a8:	12054e63          	bltz	a0,11e4 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10ac:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10b0:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10b2:	02b7f6bb          	remuw	a3,a5,a1
    10b6:	00001717          	auipc	a4,0x1
    10ba:	f9a70713          	addi	a4,a4,-102 # 2050 <digits>
    buf[16] = 0;
    10be:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10c2:	1682                	slli	a3,a3,0x20
    10c4:	9281                	srli	a3,a3,0x20
    10c6:	96ba                	add	a3,a3,a4
    10c8:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    10cc:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    10d0:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10d4:	16b7e363          	bltu	a5,a1,123a <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    10d8:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    10dc:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    10e0:	1602                	slli	a2,a2,0x20
    10e2:	9201                	srli	a2,a2,0x20
    10e4:	963a                	add	a2,a2,a4
    10e6:	00064603          	lbu	a2,0(a2)
    10ea:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10ee:	0007861b          	sext.w	a2,a5
    10f2:	12b6e863          	bltu	a3,a1,1222 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    10f6:	02b7f6bb          	remuw	a3,a5,a1
    10fa:	1682                	slli	a3,a3,0x20
    10fc:	9281                	srli	a3,a3,0x20
    10fe:	96ba                	add	a3,a3,a4
    1100:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1104:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1108:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    110c:	10b66e63          	bltu	a2,a1,1228 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1110:	02b876bb          	remuw	a3,a6,a1
    1114:	1682                	slli	a3,a3,0x20
    1116:	9281                	srli	a3,a3,0x20
    1118:	96ba                	add	a3,a3,a4
    111a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    111e:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1122:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1126:	10b86463          	bltu	a6,a1,122e <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    112a:	02b676bb          	remuw	a3,a2,a1
    112e:	1682                	slli	a3,a3,0x20
    1130:	9281                	srli	a3,a3,0x20
    1132:	96ba                	add	a3,a3,a4
    1134:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1138:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    113c:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1140:	0eb66a63          	bltu	a2,a1,1234 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    1144:	02b876bb          	remuw	a3,a6,a1
    1148:	1682                	slli	a3,a3,0x20
    114a:	9281                	srli	a3,a3,0x20
    114c:	96ba                	add	a3,a3,a4
    114e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1152:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1156:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    115a:	0cb86163          	bltu	a6,a1,121c <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    115e:	02b676bb          	remuw	a3,a2,a1
    1162:	1682                	slli	a3,a3,0x20
    1164:	9281                	srli	a3,a3,0x20
    1166:	96ba                	add	a3,a3,a4
    1168:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    116c:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1170:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1174:	0cb66563          	bltu	a2,a1,123e <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1178:	02b876bb          	remuw	a3,a6,a1
    117c:	1682                	slli	a3,a3,0x20
    117e:	9281                	srli	a3,a3,0x20
    1180:	96ba                	add	a3,a3,a4
    1182:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1186:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    118a:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    118e:	0ab86b63          	bltu	a6,a1,1244 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1192:	02b676bb          	remuw	a3,a2,a1
    1196:	1682                	slli	a3,a3,0x20
    1198:	9281                	srli	a3,a3,0x20
    119a:	96ba                	add	a3,a3,a4
    119c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a0:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11a4:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11a8:	0ab66163          	bltu	a2,a1,124a <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11ac:	1782                	slli	a5,a5,0x20
    11ae:	9381                	srli	a5,a5,0x20
    11b0:	97ba                	add	a5,a5,a4
    11b2:	0007c703          	lbu	a4,0(a5)
    11b6:	4599                	li	a1,6
    11b8:	4795                	li	a5,5
    11ba:	00e10723          	sb	a4,14(sp)

    if (sign)
    11be:	00055963          	bgez	a0,11d0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11c2:	1018                	addi	a4,sp,32
    11c4:	973e                	add	a4,a4,a5
    11c6:	02d00693          	li	a3,45
    11ca:	fed70423          	sb	a3,-24(a4)
    11ce:	85be                	mv	a1,a5
    write(f, s, l);
    11d0:	003c                	addi	a5,sp,8
    11d2:	4641                	li	a2,16
    11d4:	9e0d                	subw	a2,a2,a1
    11d6:	4505                	li	a0,1
    11d8:	95be                	add	a1,a1,a5
    11da:	373000ef          	jal	ra,1d4c <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11de:	70a2                	ld	ra,40(sp)
    11e0:	6145                	addi	sp,sp,48
    11e2:	8082                	ret
        x = -xx;
    11e4:	40a0063b          	negw	a2,a0
    11e8:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    11ea:	02b677bb          	remuw	a5,a2,a1
    11ee:	00001717          	auipc	a4,0x1
    11f2:	e6270713          	addi	a4,a4,-414 # 2050 <digits>
    buf[16] = 0;
    11f6:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11fa:	1782                	slli	a5,a5,0x20
    11fc:	9381                	srli	a5,a5,0x20
    11fe:	97ba                	add	a5,a5,a4
    1200:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1204:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1208:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    120c:	ecb676e3          	bleu	a1,a2,10d8 <printint.constprop.0+0x34>
        buf[i--] = '-';
    1210:	02d00793          	li	a5,45
    1214:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1218:	45b9                	li	a1,14
    121a:	bf5d                	j	11d0 <printint.constprop.0+0x12c>
    121c:	47a5                	li	a5,9
    121e:	45a9                	li	a1,10
    1220:	bf79                	j	11be <printint.constprop.0+0x11a>
    1222:	47b5                	li	a5,13
    1224:	45b9                	li	a1,14
    1226:	bf61                	j	11be <printint.constprop.0+0x11a>
    1228:	47b1                	li	a5,12
    122a:	45b5                	li	a1,13
    122c:	bf49                	j	11be <printint.constprop.0+0x11a>
    122e:	47ad                	li	a5,11
    1230:	45b1                	li	a1,12
    1232:	b771                	j	11be <printint.constprop.0+0x11a>
    1234:	47a9                	li	a5,10
    1236:	45ad                	li	a1,11
    1238:	b759                	j	11be <printint.constprop.0+0x11a>
    i = 15;
    123a:	45bd                	li	a1,15
    123c:	bf51                	j	11d0 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    123e:	47a1                	li	a5,8
    1240:	45a5                	li	a1,9
    1242:	bfb5                	j	11be <printint.constprop.0+0x11a>
    1244:	479d                	li	a5,7
    1246:	45a1                	li	a1,8
    1248:	bf9d                	j	11be <printint.constprop.0+0x11a>
    124a:	4799                	li	a5,6
    124c:	459d                	li	a1,7
    124e:	bf85                	j	11be <printint.constprop.0+0x11a>

0000000000001250 <getchar>:
{
    1250:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1252:	00f10593          	addi	a1,sp,15
    1256:	4605                	li	a2,1
    1258:	4501                	li	a0,0
{
    125a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    125c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1260:	2e3000ef          	jal	ra,1d42 <read>
}
    1264:	60e2                	ld	ra,24(sp)
    1266:	00f14503          	lbu	a0,15(sp)
    126a:	6105                	addi	sp,sp,32
    126c:	8082                	ret

000000000000126e <putchar>:
{
    126e:	1101                	addi	sp,sp,-32
    char byte = c;
    1270:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    1274:	00f10593          	addi	a1,sp,15
    1278:	4605                	li	a2,1
    127a:	4505                	li	a0,1
{
    127c:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    127e:	2cf000ef          	jal	ra,1d4c <write>
}
    1282:	60e2                	ld	ra,24(sp)
    1284:	2501                	sext.w	a0,a0
    1286:	6105                	addi	sp,sp,32
    1288:	8082                	ret

000000000000128a <puts>:
{
    128a:	1141                	addi	sp,sp,-16
    128c:	e406                	sd	ra,8(sp)
    128e:	e022                	sd	s0,0(sp)
    1290:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1292:	59e000ef          	jal	ra,1830 <strlen>
    1296:	862a                	mv	a2,a0
    1298:	85a2                	mv	a1,s0
    129a:	4505                	li	a0,1
    129c:	2b1000ef          	jal	ra,1d4c <write>
}
    12a0:	60a2                	ld	ra,8(sp)
    12a2:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12a4:	957d                	srai	a0,a0,0x3f
    return r;
    12a6:	2501                	sext.w	a0,a0
}
    12a8:	0141                	addi	sp,sp,16
    12aa:	8082                	ret

00000000000012ac <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12ac:	7131                	addi	sp,sp,-192
    12ae:	e0da                	sd	s6,64(sp)
    12b0:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12b2:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12b4:	013c                	addi	a5,sp,136
{
    12b6:	f0ca                	sd	s2,96(sp)
    12b8:	ecce                	sd	s3,88(sp)
    12ba:	e8d2                	sd	s4,80(sp)
    12bc:	e4d6                	sd	s5,72(sp)
    12be:	fc5e                	sd	s7,56(sp)
    12c0:	fc86                	sd	ra,120(sp)
    12c2:	f8a2                	sd	s0,112(sp)
    12c4:	f4a6                	sd	s1,104(sp)
    12c6:	89aa                	mv	s3,a0
    12c8:	e52e                	sd	a1,136(sp)
    12ca:	e932                	sd	a2,144(sp)
    12cc:	ed36                	sd	a3,152(sp)
    12ce:	f13a                	sd	a4,160(sp)
    12d0:	f942                	sd	a6,176(sp)
    12d2:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12d4:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12d6:	02500913          	li	s2,37
    12da:	07000a93          	li	s5,112
    buf[i++] = '0';
    12de:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12e2:	00001a17          	auipc	s4,0x1
    12e6:	d6ea0a13          	addi	s4,s4,-658 # 2050 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12ea:	00001b97          	auipc	s7,0x1
    12ee:	d36b8b93          	addi	s7,s7,-714 # 2020 <__clone+0x9a>
        if (!*s)
    12f2:	0009c783          	lbu	a5,0(s3)
    12f6:	cfb9                	beqz	a5,1354 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    12f8:	23278d63          	beq	a5,s2,1532 <printf+0x286>
    12fc:	864e                	mv	a2,s3
    12fe:	a019                	j	1304 <printf+0x58>
    1300:	07278563          	beq	a5,s2,136a <printf+0xbe>
    1304:	0605                	addi	a2,a2,1
    1306:	00064783          	lbu	a5,0(a2)
    130a:	fbfd                	bnez	a5,1300 <printf+0x54>
    130c:	84b2                	mv	s1,a2
        l = z - a;
    130e:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1312:	8622                	mv	a2,s0
    1314:	85ce                	mv	a1,s3
    1316:	4505                	li	a0,1
    1318:	235000ef          	jal	ra,1d4c <write>
        if (l)
    131c:	ec3d                	bnez	s0,139a <printf+0xee>
        if (s[1] == 0)
    131e:	0014c783          	lbu	a5,1(s1)
    1322:	cb8d                	beqz	a5,1354 <printf+0xa8>
        switch (s[1])
    1324:	09578b63          	beq	a5,s5,13ba <printf+0x10e>
    1328:	06fafb63          	bleu	a5,s5,139e <printf+0xf2>
    132c:	07300713          	li	a4,115
    1330:	1ce78e63          	beq	a5,a4,150c <printf+0x260>
    1334:	07800713          	li	a4,120
    1338:	1ae79563          	bne	a5,a4,14e2 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    133c:	6782                	ld	a5,0(sp)
    133e:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1340:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    1344:	4388                	lw	a0,0(a5)
    1346:	07a1                	addi	a5,a5,8
    1348:	e03e                	sd	a5,0(sp)
    134a:	d5bff0ef          	jal	ra,10a4 <printint.constprop.0>
        if (!*s)
    134e:	0009c783          	lbu	a5,0(s3)
    1352:	f3dd                	bnez	a5,12f8 <printf+0x4c>
    }
    va_end(ap);
}
    1354:	70e6                	ld	ra,120(sp)
    1356:	7446                	ld	s0,112(sp)
    1358:	74a6                	ld	s1,104(sp)
    135a:	7906                	ld	s2,96(sp)
    135c:	69e6                	ld	s3,88(sp)
    135e:	6a46                	ld	s4,80(sp)
    1360:	6aa6                	ld	s5,72(sp)
    1362:	6b06                	ld	s6,64(sp)
    1364:	7be2                	ld	s7,56(sp)
    1366:	6129                	addi	sp,sp,192
    1368:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    136a:	00164783          	lbu	a5,1(a2)
    136e:	84b2                	mv	s1,a2
    1370:	01278763          	beq	a5,s2,137e <printf+0xd2>
    1374:	bf69                	j	130e <printf+0x62>
    1376:	0014c783          	lbu	a5,1(s1)
    137a:	f9279ae3          	bne	a5,s2,130e <printf+0x62>
    137e:	0489                	addi	s1,s1,2
    1380:	0004c783          	lbu	a5,0(s1)
    1384:	0605                	addi	a2,a2,1
    1386:	ff2788e3          	beq	a5,s2,1376 <printf+0xca>
        l = z - a;
    138a:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    138e:	8622                	mv	a2,s0
    1390:	85ce                	mv	a1,s3
    1392:	4505                	li	a0,1
    1394:	1b9000ef          	jal	ra,1d4c <write>
        if (l)
    1398:	d059                	beqz	s0,131e <printf+0x72>
    139a:	89a6                	mv	s3,s1
    139c:	bf99                	j	12f2 <printf+0x46>
    139e:	06400713          	li	a4,100
    13a2:	14e79063          	bne	a5,a4,14e2 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13a6:	6782                	ld	a5,0(sp)
    13a8:	45a9                	li	a1,10
        s += 2;
    13aa:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13ae:	4388                	lw	a0,0(a5)
    13b0:	07a1                	addi	a5,a5,8
    13b2:	e03e                	sd	a5,0(sp)
    13b4:	cf1ff0ef          	jal	ra,10a4 <printint.constprop.0>
        s += 2;
    13b8:	bf59                	j	134e <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13ba:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13bc:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13c0:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13c2:	631c                	ld	a5,0(a4)
    13c4:	0721                	addi	a4,a4,8
    13c6:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13c8:	00479293          	slli	t0,a5,0x4
    13cc:	00879f93          	slli	t6,a5,0x8
    13d0:	00c79f13          	slli	t5,a5,0xc
    13d4:	01079e93          	slli	t4,a5,0x10
    13d8:	01479e13          	slli	t3,a5,0x14
    13dc:	01879313          	slli	t1,a5,0x18
    13e0:	01c79893          	slli	a7,a5,0x1c
    13e4:	02479813          	slli	a6,a5,0x24
    13e8:	02879513          	slli	a0,a5,0x28
    13ec:	02c79593          	slli	a1,a5,0x2c
    13f0:	03079693          	slli	a3,a5,0x30
    13f4:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13f8:	03c7d413          	srli	s0,a5,0x3c
    13fc:	01c7d39b          	srliw	t2,a5,0x1c
    1400:	03c2d293          	srli	t0,t0,0x3c
    1404:	03cfdf93          	srli	t6,t6,0x3c
    1408:	03cf5f13          	srli	t5,t5,0x3c
    140c:	03cede93          	srli	t4,t4,0x3c
    1410:	03ce5e13          	srli	t3,t3,0x3c
    1414:	03c35313          	srli	t1,t1,0x3c
    1418:	03c8d893          	srli	a7,a7,0x3c
    141c:	03c85813          	srli	a6,a6,0x3c
    1420:	9171                	srli	a0,a0,0x3c
    1422:	91f1                	srli	a1,a1,0x3c
    1424:	92f1                	srli	a3,a3,0x3c
    1426:	9371                	srli	a4,a4,0x3c
    1428:	96d2                	add	a3,a3,s4
    142a:	9752                	add	a4,a4,s4
    142c:	9452                	add	s0,s0,s4
    142e:	92d2                	add	t0,t0,s4
    1430:	9fd2                	add	t6,t6,s4
    1432:	9f52                	add	t5,t5,s4
    1434:	9ed2                	add	t4,t4,s4
    1436:	9e52                	add	t3,t3,s4
    1438:	9352                	add	t1,t1,s4
    143a:	98d2                	add	a7,a7,s4
    143c:	93d2                	add	t2,t2,s4
    143e:	9852                	add	a6,a6,s4
    1440:	9552                	add	a0,a0,s4
    1442:	95d2                	add	a1,a1,s4
    1444:	0006c983          	lbu	s3,0(a3)
    1448:	0002c283          	lbu	t0,0(t0)
    144c:	00074683          	lbu	a3,0(a4)
    1450:	000fcf83          	lbu	t6,0(t6)
    1454:	000f4f03          	lbu	t5,0(t5)
    1458:	000ece83          	lbu	t4,0(t4)
    145c:	000e4e03          	lbu	t3,0(t3)
    1460:	00034303          	lbu	t1,0(t1)
    1464:	0008c883          	lbu	a7,0(a7)
    1468:	0003c383          	lbu	t2,0(t2)
    146c:	00084803          	lbu	a6,0(a6)
    1470:	00054503          	lbu	a0,0(a0)
    1474:	0005c583          	lbu	a1,0(a1)
    1478:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    147c:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1480:	9371                	srli	a4,a4,0x3c
    1482:	8bbd                	andi	a5,a5,15
    1484:	9752                	add	a4,a4,s4
    1486:	97d2                	add	a5,a5,s4
    1488:	005105a3          	sb	t0,11(sp)
    148c:	01f10623          	sb	t6,12(sp)
    1490:	01e106a3          	sb	t5,13(sp)
    1494:	01d10723          	sb	t4,14(sp)
    1498:	01c107a3          	sb	t3,15(sp)
    149c:	00610823          	sb	t1,16(sp)
    14a0:	011108a3          	sb	a7,17(sp)
    14a4:	00710923          	sb	t2,18(sp)
    14a8:	010109a3          	sb	a6,19(sp)
    14ac:	00a10a23          	sb	a0,20(sp)
    14b0:	00b10aa3          	sb	a1,21(sp)
    14b4:	01310b23          	sb	s3,22(sp)
    14b8:	00d10ba3          	sb	a3,23(sp)
    14bc:	00810523          	sb	s0,10(sp)
    14c0:	00074703          	lbu	a4,0(a4)
    14c4:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14c8:	002c                	addi	a1,sp,8
    14ca:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14cc:	00e10c23          	sb	a4,24(sp)
    14d0:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14d4:	00010d23          	sb	zero,26(sp)
        s += 2;
    14d8:	00248993          	addi	s3,s1,2
    write(f, s, l);
    14dc:	071000ef          	jal	ra,1d4c <write>
        s += 2;
    14e0:	b5bd                	j	134e <printf+0xa2>
    char byte = c;
    14e2:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    14e6:	4605                	li	a2,1
    14e8:	002c                	addi	a1,sp,8
    14ea:	4505                	li	a0,1
    char byte = c;
    14ec:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    14f0:	05d000ef          	jal	ra,1d4c <write>
    char byte = c;
    14f4:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    14f8:	4605                	li	a2,1
    14fa:	002c                	addi	a1,sp,8
    14fc:	4505                	li	a0,1
    char byte = c;
    14fe:	00f10423          	sb	a5,8(sp)
        s += 2;
    1502:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    1506:	047000ef          	jal	ra,1d4c <write>
        s += 2;
    150a:	b591                	j	134e <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    150c:	6782                	ld	a5,0(sp)
    150e:	6380                	ld	s0,0(a5)
    1510:	07a1                	addi	a5,a5,8
    1512:	e03e                	sd	a5,0(sp)
    1514:	cc05                	beqz	s0,154c <printf+0x2a0>
            l = strnlen(a, 200);
    1516:	0c800593          	li	a1,200
    151a:	8522                	mv	a0,s0
    151c:	446000ef          	jal	ra,1962 <strnlen>
    write(f, s, l);
    1520:	0005061b          	sext.w	a2,a0
    1524:	85a2                	mv	a1,s0
    1526:	4505                	li	a0,1
    1528:	025000ef          	jal	ra,1d4c <write>
        s += 2;
    152c:	00248993          	addi	s3,s1,2
    1530:	bd39                	j	134e <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1532:	0019c783          	lbu	a5,1(s3)
    1536:	84ce                	mv	s1,s3
    1538:	864e                	mv	a2,s3
    153a:	e52782e3          	beq	a5,s2,137e <printf+0xd2>
    write(f, s, l);
    153e:	4601                	li	a2,0
    1540:	85ce                	mv	a1,s3
    1542:	4505                	li	a0,1
    1544:	009000ef          	jal	ra,1d4c <write>
    1548:	84ce                	mv	s1,s3
    154a:	bbd1                	j	131e <printf+0x72>
                a = "(null)";
    154c:	845e                	mv	s0,s7
    154e:	b7e1                	j	1516 <printf+0x26a>

0000000000001550 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1550:	02000793          	li	a5,32
    1554:	00f50663          	beq	a0,a5,1560 <isspace+0x10>
    1558:	355d                	addiw	a0,a0,-9
    155a:	00553513          	sltiu	a0,a0,5
    155e:	8082                	ret
    1560:	4505                	li	a0,1
}
    1562:	8082                	ret

0000000000001564 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1564:	fd05051b          	addiw	a0,a0,-48
}
    1568:	00a53513          	sltiu	a0,a0,10
    156c:	8082                	ret

000000000000156e <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    156e:	02000613          	li	a2,32
    1572:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1574:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1578:	0007079b          	sext.w	a5,a4
    157c:	ff77869b          	addiw	a3,a5,-9
    1580:	04c70b63          	beq	a4,a2,15d6 <atoi+0x68>
    1584:	04d5f963          	bleu	a3,a1,15d6 <atoi+0x68>
        s++;
    switch (*s)
    1588:	02b00693          	li	a3,43
    158c:	04d70a63          	beq	a4,a3,15e0 <atoi+0x72>
    1590:	02d00693          	li	a3,45
    1594:	06d70463          	beq	a4,a3,15fc <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1598:	fd07859b          	addiw	a1,a5,-48
    159c:	4625                	li	a2,9
    159e:	873e                	mv	a4,a5
    15a0:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15a2:	4e01                	li	t3,0
    while (isdigit(*s))
    15a4:	04b66a63          	bltu	a2,a1,15f8 <atoi+0x8a>
    int n = 0, neg = 0;
    15a8:	4501                	li	a0,0
    while (isdigit(*s))
    15aa:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15ac:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15ae:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15b2:	0025179b          	slliw	a5,a0,0x2
    15b6:	9d3d                	addw	a0,a0,a5
    15b8:	fd07031b          	addiw	t1,a4,-48
    15bc:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15c0:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15c4:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15c8:	0006071b          	sext.w	a4,a2
    15cc:	feb870e3          	bleu	a1,a6,15ac <atoi+0x3e>
    return neg ? n : -n;
    15d0:	000e0563          	beqz	t3,15da <atoi+0x6c>
}
    15d4:	8082                	ret
        s++;
    15d6:	0505                	addi	a0,a0,1
    15d8:	bf71                	j	1574 <atoi+0x6>
    15da:	4113053b          	subw	a0,t1,a7
    15de:	8082                	ret
    while (isdigit(*s))
    15e0:	00154783          	lbu	a5,1(a0)
    15e4:	4625                	li	a2,9
        s++;
    15e6:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15ea:	fd07859b          	addiw	a1,a5,-48
    15ee:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    15f2:	4e01                	li	t3,0
    while (isdigit(*s))
    15f4:	fab67ae3          	bleu	a1,a2,15a8 <atoi+0x3a>
    15f8:	4501                	li	a0,0
}
    15fa:	8082                	ret
    while (isdigit(*s))
    15fc:	00154783          	lbu	a5,1(a0)
    1600:	4625                	li	a2,9
        s++;
    1602:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1606:	fd07859b          	addiw	a1,a5,-48
    160a:	0007871b          	sext.w	a4,a5
    160e:	feb665e3          	bltu	a2,a1,15f8 <atoi+0x8a>
        neg = 1;
    1612:	4e05                	li	t3,1
    1614:	bf51                	j	15a8 <atoi+0x3a>

0000000000001616 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1616:	16060d63          	beqz	a2,1790 <memset+0x17a>
    161a:	40a007b3          	neg	a5,a0
    161e:	8b9d                	andi	a5,a5,7
    1620:	00778713          	addi	a4,a5,7
    1624:	482d                	li	a6,11
    1626:	0ff5f593          	andi	a1,a1,255
    162a:	fff60693          	addi	a3,a2,-1
    162e:	17076263          	bltu	a4,a6,1792 <memset+0x17c>
    1632:	16e6ea63          	bltu	a3,a4,17a6 <memset+0x190>
    1636:	16078563          	beqz	a5,17a0 <memset+0x18a>
    163a:	00b50023          	sb	a1,0(a0)
    163e:	4705                	li	a4,1
    1640:	00150e93          	addi	t4,a0,1
    1644:	14e78c63          	beq	a5,a4,179c <memset+0x186>
    1648:	00b500a3          	sb	a1,1(a0)
    164c:	4709                	li	a4,2
    164e:	00250e93          	addi	t4,a0,2
    1652:	14e78d63          	beq	a5,a4,17ac <memset+0x196>
    1656:	00b50123          	sb	a1,2(a0)
    165a:	470d                	li	a4,3
    165c:	00350e93          	addi	t4,a0,3
    1660:	12e78b63          	beq	a5,a4,1796 <memset+0x180>
    1664:	00b501a3          	sb	a1,3(a0)
    1668:	4711                	li	a4,4
    166a:	00450e93          	addi	t4,a0,4
    166e:	14e78163          	beq	a5,a4,17b0 <memset+0x19a>
    1672:	00b50223          	sb	a1,4(a0)
    1676:	4715                	li	a4,5
    1678:	00550e93          	addi	t4,a0,5
    167c:	12e78c63          	beq	a5,a4,17b4 <memset+0x19e>
    1680:	00b502a3          	sb	a1,5(a0)
    1684:	471d                	li	a4,7
    1686:	00650e93          	addi	t4,a0,6
    168a:	12e79763          	bne	a5,a4,17b8 <memset+0x1a2>
    168e:	00750e93          	addi	t4,a0,7
    1692:	00b50323          	sb	a1,6(a0)
    1696:	4f1d                	li	t5,7
    1698:	00859713          	slli	a4,a1,0x8
    169c:	8f4d                	or	a4,a4,a1
    169e:	01059e13          	slli	t3,a1,0x10
    16a2:	01c76e33          	or	t3,a4,t3
    16a6:	01859313          	slli	t1,a1,0x18
    16aa:	006e6333          	or	t1,t3,t1
    16ae:	02059893          	slli	a7,a1,0x20
    16b2:	011368b3          	or	a7,t1,a7
    16b6:	02859813          	slli	a6,a1,0x28
    16ba:	40f60333          	sub	t1,a2,a5
    16be:	0108e833          	or	a6,a7,a6
    16c2:	03059693          	slli	a3,a1,0x30
    16c6:	00d866b3          	or	a3,a6,a3
    16ca:	03859713          	slli	a4,a1,0x38
    16ce:	97aa                	add	a5,a5,a0
    16d0:	ff837813          	andi	a6,t1,-8
    16d4:	8f55                	or	a4,a4,a3
    16d6:	00f806b3          	add	a3,a6,a5
    16da:	e398                	sd	a4,0(a5)
    16dc:	07a1                	addi	a5,a5,8
    16de:	fed79ee3          	bne	a5,a3,16da <memset+0xc4>
    16e2:	ff837693          	andi	a3,t1,-8
    16e6:	00de87b3          	add	a5,t4,a3
    16ea:	01e6873b          	addw	a4,a3,t5
    16ee:	0ad30663          	beq	t1,a3,179a <memset+0x184>
    16f2:	00b78023          	sb	a1,0(a5)
    16f6:	0017069b          	addiw	a3,a4,1
    16fa:	08c6fb63          	bleu	a2,a3,1790 <memset+0x17a>
    16fe:	00b780a3          	sb	a1,1(a5)
    1702:	0027069b          	addiw	a3,a4,2
    1706:	08c6f563          	bleu	a2,a3,1790 <memset+0x17a>
    170a:	00b78123          	sb	a1,2(a5)
    170e:	0037069b          	addiw	a3,a4,3
    1712:	06c6ff63          	bleu	a2,a3,1790 <memset+0x17a>
    1716:	00b781a3          	sb	a1,3(a5)
    171a:	0047069b          	addiw	a3,a4,4
    171e:	06c6f963          	bleu	a2,a3,1790 <memset+0x17a>
    1722:	00b78223          	sb	a1,4(a5)
    1726:	0057069b          	addiw	a3,a4,5
    172a:	06c6f363          	bleu	a2,a3,1790 <memset+0x17a>
    172e:	00b782a3          	sb	a1,5(a5)
    1732:	0067069b          	addiw	a3,a4,6
    1736:	04c6fd63          	bleu	a2,a3,1790 <memset+0x17a>
    173a:	00b78323          	sb	a1,6(a5)
    173e:	0077069b          	addiw	a3,a4,7
    1742:	04c6f763          	bleu	a2,a3,1790 <memset+0x17a>
    1746:	00b783a3          	sb	a1,7(a5)
    174a:	0087069b          	addiw	a3,a4,8
    174e:	04c6f163          	bleu	a2,a3,1790 <memset+0x17a>
    1752:	00b78423          	sb	a1,8(a5)
    1756:	0097069b          	addiw	a3,a4,9
    175a:	02c6fb63          	bleu	a2,a3,1790 <memset+0x17a>
    175e:	00b784a3          	sb	a1,9(a5)
    1762:	00a7069b          	addiw	a3,a4,10
    1766:	02c6f563          	bleu	a2,a3,1790 <memset+0x17a>
    176a:	00b78523          	sb	a1,10(a5)
    176e:	00b7069b          	addiw	a3,a4,11
    1772:	00c6ff63          	bleu	a2,a3,1790 <memset+0x17a>
    1776:	00b785a3          	sb	a1,11(a5)
    177a:	00c7069b          	addiw	a3,a4,12
    177e:	00c6f963          	bleu	a2,a3,1790 <memset+0x17a>
    1782:	00b78623          	sb	a1,12(a5)
    1786:	2735                	addiw	a4,a4,13
    1788:	00c77463          	bleu	a2,a4,1790 <memset+0x17a>
    178c:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1790:	8082                	ret
    1792:	472d                	li	a4,11
    1794:	bd79                	j	1632 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1796:	4f0d                	li	t5,3
    1798:	b701                	j	1698 <memset+0x82>
    179a:	8082                	ret
    179c:	4f05                	li	t5,1
    179e:	bded                	j	1698 <memset+0x82>
    17a0:	8eaa                	mv	t4,a0
    17a2:	4f01                	li	t5,0
    17a4:	bdd5                	j	1698 <memset+0x82>
    17a6:	87aa                	mv	a5,a0
    17a8:	4701                	li	a4,0
    17aa:	b7a1                	j	16f2 <memset+0xdc>
    17ac:	4f09                	li	t5,2
    17ae:	b5ed                	j	1698 <memset+0x82>
    17b0:	4f11                	li	t5,4
    17b2:	b5dd                	j	1698 <memset+0x82>
    17b4:	4f15                	li	t5,5
    17b6:	b5cd                	j	1698 <memset+0x82>
    17b8:	4f19                	li	t5,6
    17ba:	bdf9                	j	1698 <memset+0x82>

00000000000017bc <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17bc:	00054703          	lbu	a4,0(a0)
    17c0:	0005c783          	lbu	a5,0(a1)
    17c4:	00e79b63          	bne	a5,a4,17da <strcmp+0x1e>
    17c8:	cf89                	beqz	a5,17e2 <strcmp+0x26>
    17ca:	0505                	addi	a0,a0,1
    17cc:	0585                	addi	a1,a1,1
    17ce:	0005c783          	lbu	a5,0(a1)
    17d2:	00054703          	lbu	a4,0(a0)
    17d6:	fef709e3          	beq	a4,a5,17c8 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    17da:	0007051b          	sext.w	a0,a4
}
    17de:	9d1d                	subw	a0,a0,a5
    17e0:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    17e2:	4501                	li	a0,0
}
    17e4:	9d1d                	subw	a0,a0,a5
    17e6:	8082                	ret

00000000000017e8 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17e8:	c231                	beqz	a2,182c <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17ea:	00054783          	lbu	a5,0(a0)
    17ee:	0005c683          	lbu	a3,0(a1)
    17f2:	c795                	beqz	a5,181e <strncmp+0x36>
    17f4:	ca85                	beqz	a3,1824 <strncmp+0x3c>
    if (!n--)
    17f6:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17f8:	c615                	beqz	a2,1824 <strncmp+0x3c>
    17fa:	00150713          	addi	a4,a0,1
    17fe:	9532                	add	a0,a0,a2
    1800:	00d78963          	beq	a5,a3,1812 <strncmp+0x2a>
    1804:	a005                	j	1824 <strncmp+0x3c>
    1806:	ce99                	beqz	a3,1824 <strncmp+0x3c>
    1808:	00e50e63          	beq	a0,a4,1824 <strncmp+0x3c>
    180c:	0705                	addi	a4,a4,1
    180e:	00d79b63          	bne	a5,a3,1824 <strncmp+0x3c>
    1812:	00074783          	lbu	a5,0(a4)
    1816:	0585                	addi	a1,a1,1
    1818:	0005c683          	lbu	a3,0(a1)
    181c:	f7ed                	bnez	a5,1806 <strncmp+0x1e>
    181e:	4501                	li	a0,0
        ;
    return *l - *r;
    1820:	9d15                	subw	a0,a0,a3
    1822:	8082                	ret
    1824:	0007851b          	sext.w	a0,a5
    1828:	9d15                	subw	a0,a0,a3
    182a:	8082                	ret
        return 0;
    182c:	4501                	li	a0,0
}
    182e:	8082                	ret

0000000000001830 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1830:	00757793          	andi	a5,a0,7
    1834:	cfa1                	beqz	a5,188c <strlen+0x5c>
        if (!*s)
    1836:	00054783          	lbu	a5,0(a0)
    183a:	cbb9                	beqz	a5,1890 <strlen+0x60>
    183c:	87aa                	mv	a5,a0
    183e:	a021                	j	1846 <strlen+0x16>
    1840:	0007c703          	lbu	a4,0(a5)
    1844:	c329                	beqz	a4,1886 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    1846:	0785                	addi	a5,a5,1
    1848:	0077f713          	andi	a4,a5,7
    184c:	fb75                	bnez	a4,1840 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    184e:	00000717          	auipc	a4,0x0
    1852:	7da70713          	addi	a4,a4,2010 # 2028 <__clone+0xa2>
    1856:	630c                	ld	a1,0(a4)
    1858:	00000717          	auipc	a4,0x0
    185c:	7d870713          	addi	a4,a4,2008 # 2030 <__clone+0xaa>
    1860:	6394                	ld	a3,0(a5)
    1862:	6310                	ld	a2,0(a4)
    1864:	a019                	j	186a <strlen+0x3a>
    1866:	07a1                	addi	a5,a5,8
    1868:	6394                	ld	a3,0(a5)
    186a:	00b68733          	add	a4,a3,a1
    186e:	fff6c693          	not	a3,a3
    1872:	8f75                	and	a4,a4,a3
    1874:	8f71                	and	a4,a4,a2
    1876:	db65                	beqz	a4,1866 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    1878:	0007c703          	lbu	a4,0(a5)
    187c:	c709                	beqz	a4,1886 <strlen+0x56>
    187e:	0785                	addi	a5,a5,1
    1880:	0007c703          	lbu	a4,0(a5)
    1884:	ff6d                	bnez	a4,187e <strlen+0x4e>
        ;
    return s - a;
    1886:	40a78533          	sub	a0,a5,a0
}
    188a:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    188c:	87aa                	mv	a5,a0
    188e:	b7c1                	j	184e <strlen+0x1e>
        if (!*s)
    1890:	4501                	li	a0,0
            return s - a;
    1892:	8082                	ret

0000000000001894 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1894:	00757793          	andi	a5,a0,7
    1898:	0ff5f593          	andi	a1,a1,255
    189c:	cb99                	beqz	a5,18b2 <memchr+0x1e>
    189e:	c655                	beqz	a2,194a <memchr+0xb6>
    18a0:	00054783          	lbu	a5,0(a0)
    18a4:	0ab78663          	beq	a5,a1,1950 <memchr+0xbc>
    18a8:	0505                	addi	a0,a0,1
    18aa:	00757793          	andi	a5,a0,7
    18ae:	167d                	addi	a2,a2,-1
    18b0:	f7fd                	bnez	a5,189e <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18b2:	4701                	li	a4,0
    if (n && *s != c)
    18b4:	ca49                	beqz	a2,1946 <memchr+0xb2>
    18b6:	00054783          	lbu	a5,0(a0)
    18ba:	08b78b63          	beq	a5,a1,1950 <memchr+0xbc>
        size_t k = ONES * c;
    18be:	00000797          	auipc	a5,0x0
    18c2:	77a78793          	addi	a5,a5,1914 # 2038 <__clone+0xb2>
    18c6:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18c8:	479d                	li	a5,7
        size_t k = ONES * c;
    18ca:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18ce:	08c7f863          	bleu	a2,a5,195e <memchr+0xca>
    18d2:	611c                	ld	a5,0(a0)
    18d4:	00000317          	auipc	t1,0x0
    18d8:	75c30313          	addi	t1,t1,1884 # 2030 <__clone+0xaa>
    18dc:	00033803          	ld	a6,0(t1)
    18e0:	00f8c7b3          	xor	a5,a7,a5
    18e4:	fff7c713          	not	a4,a5
    18e8:	8f95                	sub	a5,a5,a3
    18ea:	8ff9                	and	a5,a5,a4
    18ec:	0107f7b3          	and	a5,a5,a6
    18f0:	e7bd                	bnez	a5,195e <memchr+0xca>
    18f2:	4e1d                	li	t3,7
    18f4:	00000e97          	auipc	t4,0x0
    18f8:	734e8e93          	addi	t4,t4,1844 # 2028 <__clone+0xa2>
    18fc:	a005                	j	191c <memchr+0x88>
    18fe:	6514                	ld	a3,8(a0)
    1900:	000eb783          	ld	a5,0(t4)
    1904:	00033803          	ld	a6,0(t1)
    1908:	00d8c6b3          	xor	a3,a7,a3
    190c:	97b6                	add	a5,a5,a3
    190e:	fff6c693          	not	a3,a3
    1912:	8ff5                	and	a5,a5,a3
    1914:	0107f7b3          	and	a5,a5,a6
    1918:	e3a1                	bnez	a5,1958 <memchr+0xc4>
    191a:	853a                	mv	a0,a4
    191c:	1661                	addi	a2,a2,-8
    191e:	00850713          	addi	a4,a0,8
    1922:	fcce6ee3          	bltu	t3,a2,18fe <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1926:	c215                	beqz	a2,194a <memchr+0xb6>
    1928:	00074783          	lbu	a5,0(a4)
    192c:	00f58d63          	beq	a1,a5,1946 <memchr+0xb2>
    1930:	00170793          	addi	a5,a4,1
    1934:	963a                	add	a2,a2,a4
    1936:	873e                	mv	a4,a5
    1938:	00f60963          	beq	a2,a5,194a <memchr+0xb6>
    193c:	0007c683          	lbu	a3,0(a5)
    1940:	0785                	addi	a5,a5,1
    1942:	feb69ae3          	bne	a3,a1,1936 <memchr+0xa2>
}
    1946:	853a                	mv	a0,a4
    1948:	8082                	ret
    return n ? (void *)s : 0;
    194a:	4701                	li	a4,0
}
    194c:	853a                	mv	a0,a4
    194e:	8082                	ret
    1950:	872a                	mv	a4,a0
    1952:	00074783          	lbu	a5,0(a4)
    1956:	bfd9                	j	192c <memchr+0x98>
    1958:	00854783          	lbu	a5,8(a0)
    195c:	bfc1                	j	192c <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    195e:	872a                	mv	a4,a0
    1960:	bfc1                	j	1930 <memchr+0x9c>

0000000000001962 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1962:	00757793          	andi	a5,a0,7
    1966:	cfc5                	beqz	a5,1a1e <strnlen+0xbc>
    1968:	c1c5                	beqz	a1,1a08 <strnlen+0xa6>
    196a:	00054783          	lbu	a5,0(a0)
    196e:	cfd9                	beqz	a5,1a0c <strnlen+0xaa>
    1970:	87ae                	mv	a5,a1
    1972:	86aa                	mv	a3,a0
    1974:	a029                	j	197e <strnlen+0x1c>
    1976:	cbc9                	beqz	a5,1a08 <strnlen+0xa6>
    1978:	0006c703          	lbu	a4,0(a3)
    197c:	cb51                	beqz	a4,1a10 <strnlen+0xae>
    197e:	0685                	addi	a3,a3,1
    1980:	0076f713          	andi	a4,a3,7
    1984:	17fd                	addi	a5,a5,-1
    1986:	fb65                	bnez	a4,1976 <strnlen+0x14>
    if (n && *s != c)
    1988:	c3c1                	beqz	a5,1a08 <strnlen+0xa6>
    198a:	0006c703          	lbu	a4,0(a3)
    198e:	c349                	beqz	a4,1a10 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1990:	471d                	li	a4,7
    1992:	08f77a63          	bleu	a5,a4,1a26 <strnlen+0xc4>
    1996:	00000e17          	auipc	t3,0x0
    199a:	692e0e13          	addi	t3,t3,1682 # 2028 <__clone+0xa2>
    199e:	6290                	ld	a2,0(a3)
    19a0:	000e3703          	ld	a4,0(t3)
    19a4:	00000e97          	auipc	t4,0x0
    19a8:	68ce8e93          	addi	t4,t4,1676 # 2030 <__clone+0xaa>
    19ac:	000eb803          	ld	a6,0(t4)
    19b0:	9732                	add	a4,a4,a2
    19b2:	fff64613          	not	a2,a2
    19b6:	8f71                	and	a4,a4,a2
    19b8:	01077733          	and	a4,a4,a6
    19bc:	e72d                	bnez	a4,1a26 <strnlen+0xc4>
    19be:	4f1d                	li	t5,7
    19c0:	a839                	j	19de <strnlen+0x7c>
    19c2:	6698                	ld	a4,8(a3)
    19c4:	000e3303          	ld	t1,0(t3)
    19c8:	000eb803          	ld	a6,0(t4)
    19cc:	fff74893          	not	a7,a4
    19d0:	971a                	add	a4,a4,t1
    19d2:	01177733          	and	a4,a4,a7
    19d6:	01077733          	and	a4,a4,a6
    19da:	ef1d                	bnez	a4,1a18 <strnlen+0xb6>
    19dc:	86b2                	mv	a3,a2
    19de:	17e1                	addi	a5,a5,-8
    19e0:	00868613          	addi	a2,a3,8
    19e4:	fcff6fe3          	bltu	t5,a5,19c2 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    19e8:	c385                	beqz	a5,1a08 <strnlen+0xa6>
    19ea:	00064703          	lbu	a4,0(a2)
    19ee:	cb19                	beqz	a4,1a04 <strnlen+0xa2>
    19f0:	00160713          	addi	a4,a2,1
    19f4:	97b2                	add	a5,a5,a2
    19f6:	863a                	mv	a2,a4
    19f8:	00e78863          	beq	a5,a4,1a08 <strnlen+0xa6>
    19fc:	0705                	addi	a4,a4,1
    19fe:	fff74683          	lbu	a3,-1(a4)
    1a02:	faf5                	bnez	a3,19f6 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a04:	40a605b3          	sub	a1,a2,a0
}
    1a08:	852e                	mv	a0,a1
    1a0a:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a0c:	87ae                	mv	a5,a1
    1a0e:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a10:	8636                	mv	a2,a3
    1a12:	00064703          	lbu	a4,0(a2)
    1a16:	bfe1                	j	19ee <strnlen+0x8c>
    1a18:	0086c703          	lbu	a4,8(a3)
    1a1c:	bfc9                	j	19ee <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a1e:	87ae                	mv	a5,a1
    1a20:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a22:	f7a5                	bnez	a5,198a <strnlen+0x28>
    1a24:	b7d5                	j	1a08 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a26:	8636                	mv	a2,a3
    1a28:	b7e1                	j	19f0 <strnlen+0x8e>

0000000000001a2a <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a2a:	00b547b3          	xor	a5,a0,a1
    1a2e:	8b9d                	andi	a5,a5,7
    1a30:	efa9                	bnez	a5,1a8a <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a32:	0075f793          	andi	a5,a1,7
    1a36:	c38d                	beqz	a5,1a58 <strcpy+0x2e>
            if (!(*d = *s))
    1a38:	0005c783          	lbu	a5,0(a1)
    1a3c:	00f50023          	sb	a5,0(a0)
    1a40:	e799                	bnez	a5,1a4e <strcpy+0x24>
    1a42:	a095                	j	1aa6 <strcpy+0x7c>
    1a44:	0005c783          	lbu	a5,0(a1)
    1a48:	00f50023          	sb	a5,0(a0)
    1a4c:	cbb9                	beqz	a5,1aa2 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a4e:	0585                	addi	a1,a1,1
    1a50:	0075f793          	andi	a5,a1,7
    1a54:	0505                	addi	a0,a0,1
    1a56:	f7fd                	bnez	a5,1a44 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a58:	00000797          	auipc	a5,0x0
    1a5c:	5d078793          	addi	a5,a5,1488 # 2028 <__clone+0xa2>
    1a60:	0007b803          	ld	a6,0(a5)
    1a64:	00000797          	auipc	a5,0x0
    1a68:	5cc78793          	addi	a5,a5,1484 # 2030 <__clone+0xaa>
    1a6c:	6198                	ld	a4,0(a1)
    1a6e:	6390                	ld	a2,0(a5)
    1a70:	a031                	j	1a7c <strcpy+0x52>
    1a72:	0521                	addi	a0,a0,8
    1a74:	05a1                	addi	a1,a1,8
    1a76:	fee53c23          	sd	a4,-8(a0)
    1a7a:	6198                	ld	a4,0(a1)
    1a7c:	010707b3          	add	a5,a4,a6
    1a80:	fff74693          	not	a3,a4
    1a84:	8ff5                	and	a5,a5,a3
    1a86:	8ff1                	and	a5,a5,a2
    1a88:	d7ed                	beqz	a5,1a72 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a8a:	0005c783          	lbu	a5,0(a1)
    1a8e:	00f50023          	sb	a5,0(a0)
    1a92:	cb89                	beqz	a5,1aa4 <strcpy+0x7a>
    1a94:	0585                	addi	a1,a1,1
    1a96:	0005c783          	lbu	a5,0(a1)
    1a9a:	0505                	addi	a0,a0,1
    1a9c:	00f50023          	sb	a5,0(a0)
    1aa0:	fbf5                	bnez	a5,1a94 <strcpy+0x6a>
        ;
    return d;
}
    1aa2:	8082                	ret
    1aa4:	8082                	ret
    1aa6:	8082                	ret

0000000000001aa8 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1aa8:	00b547b3          	xor	a5,a0,a1
    1aac:	8b9d                	andi	a5,a5,7
    1aae:	ebc1                	bnez	a5,1b3e <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ab0:	0075f793          	andi	a5,a1,7
    1ab4:	cf91                	beqz	a5,1ad0 <strncpy+0x28>
    1ab6:	20060e63          	beqz	a2,1cd2 <strncpy+0x22a>
    1aba:	0005c783          	lbu	a5,0(a1)
    1abe:	00f50023          	sb	a5,0(a0)
    1ac2:	c3d5                	beqz	a5,1b66 <strncpy+0xbe>
    1ac4:	0585                	addi	a1,a1,1
    1ac6:	0075f793          	andi	a5,a1,7
    1aca:	167d                	addi	a2,a2,-1
    1acc:	0505                	addi	a0,a0,1
    1ace:	f7e5                	bnez	a5,1ab6 <strncpy+0xe>
            ;
        if (!n || !*s)
    1ad0:	20060163          	beqz	a2,1cd2 <strncpy+0x22a>
    1ad4:	0005c683          	lbu	a3,0(a1)
    1ad8:	c6d9                	beqz	a3,1b66 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ada:	479d                	li	a5,7
    1adc:	22c7f563          	bleu	a2,a5,1d06 <strncpy+0x25e>
    1ae0:	00000317          	auipc	t1,0x0
    1ae4:	54830313          	addi	t1,t1,1352 # 2028 <__clone+0xa2>
    1ae8:	6198                	ld	a4,0(a1)
    1aea:	00033783          	ld	a5,0(t1)
    1aee:	00000e17          	auipc	t3,0x0
    1af2:	542e0e13          	addi	t3,t3,1346 # 2030 <__clone+0xaa>
    1af6:	000e3803          	ld	a6,0(t3)
    1afa:	97ba                	add	a5,a5,a4
    1afc:	fff74893          	not	a7,a4
    1b00:	0117f7b3          	and	a5,a5,a7
    1b04:	0107f7b3          	and	a5,a5,a6
    1b08:	1e079f63          	bnez	a5,1d06 <strncpy+0x25e>
    1b0c:	4e9d                	li	t4,7
    1b0e:	a005                	j	1b2e <strncpy+0x86>
    1b10:	6598                	ld	a4,8(a1)
    1b12:	00033783          	ld	a5,0(t1)
    1b16:	000e3803          	ld	a6,0(t3)
    1b1a:	fff74893          	not	a7,a4
    1b1e:	97ba                	add	a5,a5,a4
    1b20:	0117f7b3          	and	a5,a5,a7
    1b24:	0107f7b3          	and	a5,a5,a6
    1b28:	1a079f63          	bnez	a5,1ce6 <strncpy+0x23e>
    1b2c:	85b6                	mv	a1,a3
            *wd = *ws;
    1b2e:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b30:	1661                	addi	a2,a2,-8
    1b32:	00858693          	addi	a3,a1,8
    1b36:	0521                	addi	a0,a0,8
    1b38:	fcceece3          	bltu	t4,a2,1b10 <strncpy+0x68>
    1b3c:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b3e:	18060a63          	beqz	a2,1cd2 <strncpy+0x22a>
    1b42:	0005c783          	lbu	a5,0(a1)
    1b46:	872a                	mv	a4,a0
    1b48:	00f50023          	sb	a5,0(a0)
    1b4c:	e799                	bnez	a5,1b5a <strncpy+0xb2>
    1b4e:	a829                	j	1b68 <strncpy+0xc0>
    1b50:	0005c783          	lbu	a5,0(a1)
    1b54:	00f70023          	sb	a5,0(a4)
    1b58:	cb81                	beqz	a5,1b68 <strncpy+0xc0>
    1b5a:	167d                	addi	a2,a2,-1
    1b5c:	0585                	addi	a1,a1,1
    1b5e:	0705                	addi	a4,a4,1
    1b60:	fa65                	bnez	a2,1b50 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b62:	853a                	mv	a0,a4
    1b64:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1b66:	872a                	mv	a4,a0
    1b68:	4805                	li	a6,1
    1b6a:	14061c63          	bnez	a2,1cc2 <strncpy+0x21a>
    1b6e:	40e007b3          	neg	a5,a4
    1b72:	8b9d                	andi	a5,a5,7
    1b74:	4581                	li	a1,0
    1b76:	12061e63          	bnez	a2,1cb2 <strncpy+0x20a>
    1b7a:	00778693          	addi	a3,a5,7
    1b7e:	452d                	li	a0,11
    1b80:	12a6e763          	bltu	a3,a0,1cae <strncpy+0x206>
    1b84:	16d5e663          	bltu	a1,a3,1cf0 <strncpy+0x248>
    1b88:	14078c63          	beqz	a5,1ce0 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b8c:	00070023          	sb	zero,0(a4)
    1b90:	4585                	li	a1,1
    1b92:	00170693          	addi	a3,a4,1
    1b96:	14b78363          	beq	a5,a1,1cdc <strncpy+0x234>
    1b9a:	000700a3          	sb	zero,1(a4)
    1b9e:	4589                	li	a1,2
    1ba0:	00270693          	addi	a3,a4,2
    1ba4:	14b78963          	beq	a5,a1,1cf6 <strncpy+0x24e>
    1ba8:	00070123          	sb	zero,2(a4)
    1bac:	458d                	li	a1,3
    1bae:	00370693          	addi	a3,a4,3
    1bb2:	12b78363          	beq	a5,a1,1cd8 <strncpy+0x230>
    1bb6:	000701a3          	sb	zero,3(a4)
    1bba:	4591                	li	a1,4
    1bbc:	00470693          	addi	a3,a4,4
    1bc0:	12b78d63          	beq	a5,a1,1cfa <strncpy+0x252>
    1bc4:	00070223          	sb	zero,4(a4)
    1bc8:	4595                	li	a1,5
    1bca:	00570693          	addi	a3,a4,5
    1bce:	12b78863          	beq	a5,a1,1cfe <strncpy+0x256>
    1bd2:	000702a3          	sb	zero,5(a4)
    1bd6:	459d                	li	a1,7
    1bd8:	00670693          	addi	a3,a4,6
    1bdc:	12b79363          	bne	a5,a1,1d02 <strncpy+0x25a>
    1be0:	00770693          	addi	a3,a4,7
    1be4:	00070323          	sb	zero,6(a4)
    1be8:	40f80833          	sub	a6,a6,a5
    1bec:	ff887513          	andi	a0,a6,-8
    1bf0:	97ba                	add	a5,a5,a4
    1bf2:	953e                	add	a0,a0,a5
    1bf4:	0007b023          	sd	zero,0(a5)
    1bf8:	07a1                	addi	a5,a5,8
    1bfa:	fea79de3          	bne	a5,a0,1bf4 <strncpy+0x14c>
    1bfe:	ff887513          	andi	a0,a6,-8
    1c02:	9da9                	addw	a1,a1,a0
    1c04:	00a687b3          	add	a5,a3,a0
    1c08:	f4a80de3          	beq	a6,a0,1b62 <strncpy+0xba>
    1c0c:	00078023          	sb	zero,0(a5)
    1c10:	0015869b          	addiw	a3,a1,1
    1c14:	f4c6f7e3          	bleu	a2,a3,1b62 <strncpy+0xba>
    1c18:	000780a3          	sb	zero,1(a5)
    1c1c:	0025869b          	addiw	a3,a1,2
    1c20:	f4c6f1e3          	bleu	a2,a3,1b62 <strncpy+0xba>
    1c24:	00078123          	sb	zero,2(a5)
    1c28:	0035869b          	addiw	a3,a1,3
    1c2c:	f2c6fbe3          	bleu	a2,a3,1b62 <strncpy+0xba>
    1c30:	000781a3          	sb	zero,3(a5)
    1c34:	0045869b          	addiw	a3,a1,4
    1c38:	f2c6f5e3          	bleu	a2,a3,1b62 <strncpy+0xba>
    1c3c:	00078223          	sb	zero,4(a5)
    1c40:	0055869b          	addiw	a3,a1,5
    1c44:	f0c6ffe3          	bleu	a2,a3,1b62 <strncpy+0xba>
    1c48:	000782a3          	sb	zero,5(a5)
    1c4c:	0065869b          	addiw	a3,a1,6
    1c50:	f0c6f9e3          	bleu	a2,a3,1b62 <strncpy+0xba>
    1c54:	00078323          	sb	zero,6(a5)
    1c58:	0075869b          	addiw	a3,a1,7
    1c5c:	f0c6f3e3          	bleu	a2,a3,1b62 <strncpy+0xba>
    1c60:	000783a3          	sb	zero,7(a5)
    1c64:	0085869b          	addiw	a3,a1,8
    1c68:	eec6fde3          	bleu	a2,a3,1b62 <strncpy+0xba>
    1c6c:	00078423          	sb	zero,8(a5)
    1c70:	0095869b          	addiw	a3,a1,9
    1c74:	eec6f7e3          	bleu	a2,a3,1b62 <strncpy+0xba>
    1c78:	000784a3          	sb	zero,9(a5)
    1c7c:	00a5869b          	addiw	a3,a1,10
    1c80:	eec6f1e3          	bleu	a2,a3,1b62 <strncpy+0xba>
    1c84:	00078523          	sb	zero,10(a5)
    1c88:	00b5869b          	addiw	a3,a1,11
    1c8c:	ecc6fbe3          	bleu	a2,a3,1b62 <strncpy+0xba>
    1c90:	000785a3          	sb	zero,11(a5)
    1c94:	00c5869b          	addiw	a3,a1,12
    1c98:	ecc6f5e3          	bleu	a2,a3,1b62 <strncpy+0xba>
    1c9c:	00078623          	sb	zero,12(a5)
    1ca0:	25b5                	addiw	a1,a1,13
    1ca2:	ecc5f0e3          	bleu	a2,a1,1b62 <strncpy+0xba>
    1ca6:	000786a3          	sb	zero,13(a5)
}
    1caa:	853a                	mv	a0,a4
    1cac:	8082                	ret
    1cae:	46ad                	li	a3,11
    1cb0:	bdd1                	j	1b84 <strncpy+0xdc>
    1cb2:	00778693          	addi	a3,a5,7
    1cb6:	452d                	li	a0,11
    1cb8:	fff60593          	addi	a1,a2,-1
    1cbc:	eca6f4e3          	bleu	a0,a3,1b84 <strncpy+0xdc>
    1cc0:	b7fd                	j	1cae <strncpy+0x206>
    1cc2:	40e007b3          	neg	a5,a4
    1cc6:	8832                	mv	a6,a2
    1cc8:	8b9d                	andi	a5,a5,7
    1cca:	4581                	li	a1,0
    1ccc:	ea0607e3          	beqz	a2,1b7a <strncpy+0xd2>
    1cd0:	b7cd                	j	1cb2 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1cd2:	872a                	mv	a4,a0
}
    1cd4:	853a                	mv	a0,a4
    1cd6:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cd8:	458d                	li	a1,3
    1cda:	b739                	j	1be8 <strncpy+0x140>
    1cdc:	4585                	li	a1,1
    1cde:	b729                	j	1be8 <strncpy+0x140>
    1ce0:	86ba                	mv	a3,a4
    1ce2:	4581                	li	a1,0
    1ce4:	b711                	j	1be8 <strncpy+0x140>
    1ce6:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1cea:	872a                	mv	a4,a0
    1cec:	85b6                	mv	a1,a3
    1cee:	bda9                	j	1b48 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cf0:	87ba                	mv	a5,a4
    1cf2:	4581                	li	a1,0
    1cf4:	bf21                	j	1c0c <strncpy+0x164>
    1cf6:	4589                	li	a1,2
    1cf8:	bdc5                	j	1be8 <strncpy+0x140>
    1cfa:	4591                	li	a1,4
    1cfc:	b5f5                	j	1be8 <strncpy+0x140>
    1cfe:	4595                	li	a1,5
    1d00:	b5e5                	j	1be8 <strncpy+0x140>
    1d02:	4599                	li	a1,6
    1d04:	b5d5                	j	1be8 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d06:	00d50023          	sb	a3,0(a0)
    1d0a:	872a                	mv	a4,a0
    1d0c:	b5b9                	j	1b5a <strncpy+0xb2>

0000000000001d0e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d0e:	87aa                	mv	a5,a0
    1d10:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d12:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d16:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d1a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d1c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d1e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d22:	2501                	sext.w	a0,a0
    1d24:	8082                	ret

0000000000001d26 <openat>:
    register long a7 __asm__("a7") = n;
    1d26:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d2a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d2e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d32:	2501                	sext.w	a0,a0
    1d34:	8082                	ret

0000000000001d36 <close>:
    register long a7 __asm__("a7") = n;
    1d36:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d3a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <read>:
    register long a7 __asm__("a7") = n;
    1d42:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d46:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d4a:	8082                	ret

0000000000001d4c <write>:
    register long a7 __asm__("a7") = n;
    1d4c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d50:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d54:	8082                	ret

0000000000001d56 <getpid>:
    register long a7 __asm__("a7") = n;
    1d56:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d5a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d5e:	2501                	sext.w	a0,a0
    1d60:	8082                	ret

0000000000001d62 <getppid>:
    register long a7 __asm__("a7") = n;
    1d62:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d66:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d6e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d72:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <fork>:
    register long a7 __asm__("a7") = n;
    1d7a:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d7e:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d80:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d82:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d86:	2501                	sext.w	a0,a0
    1d88:	8082                	ret

0000000000001d8a <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d8a:	85b2                	mv	a1,a2
    1d8c:	863a                	mv	a2,a4
    if (stack)
    1d8e:	c191                	beqz	a1,1d92 <clone+0x8>
	stack += stack_size;
    1d90:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d92:	4781                	li	a5,0
    1d94:	4701                	li	a4,0
    1d96:	4681                	li	a3,0
    1d98:	2601                	sext.w	a2,a2
    1d9a:	1ec0006f          	j	1f86 <__clone>

0000000000001d9e <exit>:
    register long a7 __asm__("a7") = n;
    1d9e:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1da2:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1da6:	8082                	ret

0000000000001da8 <waitpid>:
    register long a7 __asm__("a7") = n;
    1da8:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1dac:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dae:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <exec>:
    register long a7 __asm__("a7") = n;
    1db6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1dba:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <execve>:
    register long a7 __asm__("a7") = n;
    1dc2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc6:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <times>:
    register long a7 __asm__("a7") = n;
    1dce:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1dd2:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <get_time>:

int64 get_time()
{
    1dda:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1ddc:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1de0:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1de2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de4:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1de8:	2501                	sext.w	a0,a0
    1dea:	ed09                	bnez	a0,1e04 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1dec:	67a2                	ld	a5,8(sp)
    1dee:	3e800713          	li	a4,1000
    1df2:	00015503          	lhu	a0,0(sp)
    1df6:	02e7d7b3          	divu	a5,a5,a4
    1dfa:	02e50533          	mul	a0,a0,a4
    1dfe:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e00:	0141                	addi	sp,sp,16
    1e02:	8082                	ret
        return -1;
    1e04:	557d                	li	a0,-1
    1e06:	bfed                	j	1e00 <get_time+0x26>

0000000000001e08 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e08:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e10:	2501                	sext.w	a0,a0
    1e12:	8082                	ret

0000000000001e14 <time>:
    register long a7 __asm__("a7") = n;
    1e14:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e18:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	8082                	ret

0000000000001e20 <sleep>:

int sleep(unsigned long long time)
{
    1e20:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e22:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e24:	850a                	mv	a0,sp
    1e26:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e28:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e2c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e2e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e32:	e501                	bnez	a0,1e3a <sleep+0x1a>
    return 0;
    1e34:	4501                	li	a0,0
}
    1e36:	0141                	addi	sp,sp,16
    1e38:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e3a:	4502                	lw	a0,0(sp)
}
    1e3c:	0141                	addi	sp,sp,16
    1e3e:	8082                	ret

0000000000001e40 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e40:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e44:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e4c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e50:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e54:	8082                	ret

0000000000001e56 <munmap>:
    register long a7 __asm__("a7") = n;
    1e56:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5a:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e5e:	2501                	sext.w	a0,a0
    1e60:	8082                	ret

0000000000001e62 <wait>:

int wait(int *code)
{
    1e62:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e64:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e68:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e6a:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e6c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e6e:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <spawn>:
    register long a7 __asm__("a7") = n;
    1e76:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e7a:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <mailread>:
    register long a7 __asm__("a7") = n;
    1e82:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e86:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e8e:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e92:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <fstat>:
    register long a7 __asm__("a7") = n;
    1e9a:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9e:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	8082                	ret

0000000000001ea6 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ea6:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ea8:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1eac:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eae:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1eb6:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eb8:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ebc:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ebe:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1ec2:	2501                	sext.w	a0,a0
    1ec4:	8082                	ret

0000000000001ec6 <link>:

int link(char *old_path, char *new_path)
{
    1ec6:	87aa                	mv	a5,a0
    1ec8:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1eca:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1ece:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ed2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ed4:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1ed8:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eda:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <unlink>:

int unlink(char *path)
{
    1ee2:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ee4:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1ee8:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1eec:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eee:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1ef2:	2501                	sext.w	a0,a0
    1ef4:	8082                	ret

0000000000001ef6 <uname>:
    register long a7 __asm__("a7") = n;
    1ef6:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1efa:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1efe:	2501                	sext.w	a0,a0
    1f00:	8082                	ret

0000000000001f02 <brk>:
    register long a7 __asm__("a7") = n;
    1f02:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f06:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f0a:	2501                	sext.w	a0,a0
    1f0c:	8082                	ret

0000000000001f0e <getcwd>:
    register long a7 __asm__("a7") = n;
    1f0e:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f10:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f14:	8082                	ret

0000000000001f16 <chdir>:
    register long a7 __asm__("a7") = n;
    1f16:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f1a:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f1e:	2501                	sext.w	a0,a0
    1f20:	8082                	ret

0000000000001f22 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f22:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f24:	02059613          	slli	a2,a1,0x20
    1f28:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f2a:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f2e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f32:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f34:	00000073          	ecall
}
    1f38:	2501                	sext.w	a0,a0
    1f3a:	8082                	ret

0000000000001f3c <getdents>:
    register long a7 __asm__("a7") = n;
    1f3c:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f40:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f44:	2501                	sext.w	a0,a0
    1f46:	8082                	ret

0000000000001f48 <pipe>:
    register long a7 __asm__("a7") = n;
    1f48:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f4c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f4e:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f52:	2501                	sext.w	a0,a0
    1f54:	8082                	ret

0000000000001f56 <dup>:
    register long a7 __asm__("a7") = n;
    1f56:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f58:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f5c:	2501                	sext.w	a0,a0
    1f5e:	8082                	ret

0000000000001f60 <dup2>:
    register long a7 __asm__("a7") = n;
    1f60:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f62:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f64:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f68:	2501                	sext.w	a0,a0
    1f6a:	8082                	ret

0000000000001f6c <mount>:
    register long a7 __asm__("a7") = n;
    1f6c:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f70:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f74:	2501                	sext.w	a0,a0
    1f76:	8082                	ret

0000000000001f78 <umount>:
    register long a7 __asm__("a7") = n;
    1f78:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f7c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f7e:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f82:	2501                	sext.w	a0,a0
    1f84:	8082                	ret

0000000000001f86 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f86:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1f88:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f8a:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f8c:	8532                	mv	a0,a2
	mv a2, a4
    1f8e:	863a                	mv	a2,a4
	mv a3, a5
    1f90:	86be                	mv	a3,a5
	mv a4, a6
    1f92:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f94:	0dc00893          	li	a7,220
	ecall
    1f98:	00000073          	ecall

	beqz a0, 1f
    1f9c:	c111                	beqz	a0,1fa0 <__clone+0x1a>
	# Parent
	ret
    1f9e:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fa0:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fa2:	6522                	ld	a0,8(sp)
	jalr a1
    1fa4:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fa6:	05d00893          	li	a7,93
	ecall
    1faa:	00000073          	ecall
