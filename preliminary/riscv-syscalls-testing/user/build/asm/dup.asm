
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/dup:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	08e0006f          	j	1090 <__start_main>

0000000000001006 <test_dup>:
/*
 * 测试通过时应输出：
 * "  new fd is 3."
 */

void test_dup(){
    1006:	1101                	addi	sp,sp,-32
	TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	fc050513          	addi	a0,a0,-64 # 1fc8 <__clone+0x28>
void test_dup(){
    1010:	ec06                	sd	ra,24(sp)
	TEST_START(__func__);
    1012:	27e000ef          	jal	ra,1290 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	04250513          	addi	a0,a0,66 # 2058 <__func__.1185>
    101e:	272000ef          	jal	ra,1290 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	fbe50513          	addi	a0,a0,-66 # 1fe0 <__clone+0x40>
    102a:	266000ef          	jal	ra,1290 <puts>
	int fd = dup(STDOUT);
    102e:	4505                	li	a0,1
    1030:	741000ef          	jal	ra,1f70 <dup>
    1034:	85aa                	mv	a1,a0
	assert(fd >=0);
    1036:	02054c63          	bltz	a0,106e <test_dup+0x68>
	printf("  new fd is %d.\n", fd);
    103a:	00001517          	auipc	a0,0x1
    103e:	fd650513          	addi	a0,a0,-42 # 2010 <__clone+0x70>
    1042:	270000ef          	jal	ra,12b2 <printf>
	TEST_END(__func__);
    1046:	00001517          	auipc	a0,0x1
    104a:	fe250513          	addi	a0,a0,-30 # 2028 <__clone+0x88>
    104e:	242000ef          	jal	ra,1290 <puts>
    1052:	00001517          	auipc	a0,0x1
    1056:	00650513          	addi	a0,a0,6 # 2058 <__func__.1185>
    105a:	236000ef          	jal	ra,1290 <puts>
}
    105e:	60e2                	ld	ra,24(sp)
	TEST_END(__func__);
    1060:	00001517          	auipc	a0,0x1
    1064:	f8050513          	addi	a0,a0,-128 # 1fe0 <__clone+0x40>
}
    1068:	6105                	addi	sp,sp,32
	TEST_END(__func__);
    106a:	2260006f          	j	1290 <puts>
    106e:	e42a                	sd	a0,8(sp)
	assert(fd >=0);
    1070:	00001517          	auipc	a0,0x1
    1074:	f8050513          	addi	a0,a0,-128 # 1ff0 <__clone+0x50>
    1078:	4de000ef          	jal	ra,1556 <panic>
    107c:	65a2                	ld	a1,8(sp)
    107e:	bf75                	j	103a <test_dup+0x34>

0000000000001080 <main>:

int main(void) {
    1080:	1141                	addi	sp,sp,-16
    1082:	e406                	sd	ra,8(sp)
	test_dup();
    1084:	f83ff0ef          	jal	ra,1006 <test_dup>
	return 0;
}
    1088:	60a2                	ld	ra,8(sp)
    108a:	4501                	li	a0,0
    108c:	0141                	addi	sp,sp,16
    108e:	8082                	ret

0000000000001090 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1090:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1092:	4108                	lw	a0,0(a0)
{
    1094:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1096:	05a1                	addi	a1,a1,8
{
    1098:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    109a:	fe7ff0ef          	jal	ra,1080 <main>
    109e:	51b000ef          	jal	ra,1db8 <exit>
	return 0;
}
    10a2:	60a2                	ld	ra,8(sp)
    10a4:	4501                	li	a0,0
    10a6:	0141                	addi	sp,sp,16
    10a8:	8082                	ret

00000000000010aa <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10aa:	7179                	addi	sp,sp,-48
    10ac:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ae:	12054e63          	bltz	a0,11ea <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10b2:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10b6:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10b8:	02b7f6bb          	remuw	a3,a5,a1
    10bc:	00001717          	auipc	a4,0x1
    10c0:	fac70713          	addi	a4,a4,-84 # 2068 <digits>
    buf[16] = 0;
    10c4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10c8:	1682                	slli	a3,a3,0x20
    10ca:	9281                	srli	a3,a3,0x20
    10cc:	96ba                	add	a3,a3,a4
    10ce:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    10d2:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    10d6:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10da:	16b7e363          	bltu	a5,a1,1240 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    10de:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    10e2:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    10e6:	1602                	slli	a2,a2,0x20
    10e8:	9201                	srli	a2,a2,0x20
    10ea:	963a                	add	a2,a2,a4
    10ec:	00064603          	lbu	a2,0(a2)
    10f0:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10f4:	0007861b          	sext.w	a2,a5
    10f8:	12b6e863          	bltu	a3,a1,1228 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    10fc:	02b7f6bb          	remuw	a3,a5,a1
    1100:	1682                	slli	a3,a3,0x20
    1102:	9281                	srli	a3,a3,0x20
    1104:	96ba                	add	a3,a3,a4
    1106:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    110a:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    110e:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1112:	10b66e63          	bltu	a2,a1,122e <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1116:	02b876bb          	remuw	a3,a6,a1
    111a:	1682                	slli	a3,a3,0x20
    111c:	9281                	srli	a3,a3,0x20
    111e:	96ba                	add	a3,a3,a4
    1120:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1124:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1128:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    112c:	10b86463          	bltu	a6,a1,1234 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1130:	02b676bb          	remuw	a3,a2,a1
    1134:	1682                	slli	a3,a3,0x20
    1136:	9281                	srli	a3,a3,0x20
    1138:	96ba                	add	a3,a3,a4
    113a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    113e:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1142:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1146:	0eb66a63          	bltu	a2,a1,123a <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    114a:	02b876bb          	remuw	a3,a6,a1
    114e:	1682                	slli	a3,a3,0x20
    1150:	9281                	srli	a3,a3,0x20
    1152:	96ba                	add	a3,a3,a4
    1154:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1158:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    115c:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1160:	0cb86163          	bltu	a6,a1,1222 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    1164:	02b676bb          	remuw	a3,a2,a1
    1168:	1682                	slli	a3,a3,0x20
    116a:	9281                	srli	a3,a3,0x20
    116c:	96ba                	add	a3,a3,a4
    116e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1172:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1176:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    117a:	0cb66563          	bltu	a2,a1,1244 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    117e:	02b876bb          	remuw	a3,a6,a1
    1182:	1682                	slli	a3,a3,0x20
    1184:	9281                	srli	a3,a3,0x20
    1186:	96ba                	add	a3,a3,a4
    1188:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    118c:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1190:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1194:	0ab86b63          	bltu	a6,a1,124a <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1198:	02b676bb          	remuw	a3,a2,a1
    119c:	1682                	slli	a3,a3,0x20
    119e:	9281                	srli	a3,a3,0x20
    11a0:	96ba                	add	a3,a3,a4
    11a2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a6:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11aa:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11ae:	0ab66163          	bltu	a2,a1,1250 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11b2:	1782                	slli	a5,a5,0x20
    11b4:	9381                	srli	a5,a5,0x20
    11b6:	97ba                	add	a5,a5,a4
    11b8:	0007c703          	lbu	a4,0(a5)
    11bc:	4599                	li	a1,6
    11be:	4795                	li	a5,5
    11c0:	00e10723          	sb	a4,14(sp)

    if (sign)
    11c4:	00055963          	bgez	a0,11d6 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11c8:	1018                	addi	a4,sp,32
    11ca:	973e                	add	a4,a4,a5
    11cc:	02d00693          	li	a3,45
    11d0:	fed70423          	sb	a3,-24(a4)
    11d4:	85be                	mv	a1,a5
    write(f, s, l);
    11d6:	003c                	addi	a5,sp,8
    11d8:	4641                	li	a2,16
    11da:	9e0d                	subw	a2,a2,a1
    11dc:	4505                	li	a0,1
    11de:	95be                	add	a1,a1,a5
    11e0:	387000ef          	jal	ra,1d66 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11e4:	70a2                	ld	ra,40(sp)
    11e6:	6145                	addi	sp,sp,48
    11e8:	8082                	ret
        x = -xx;
    11ea:	40a0063b          	negw	a2,a0
    11ee:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    11f0:	02b677bb          	remuw	a5,a2,a1
    11f4:	00001717          	auipc	a4,0x1
    11f8:	e7470713          	addi	a4,a4,-396 # 2068 <digits>
    buf[16] = 0;
    11fc:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1200:	1782                	slli	a5,a5,0x20
    1202:	9381                	srli	a5,a5,0x20
    1204:	97ba                	add	a5,a5,a4
    1206:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    120a:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    120e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1212:	ecb676e3          	bleu	a1,a2,10de <printint.constprop.0+0x34>
        buf[i--] = '-';
    1216:	02d00793          	li	a5,45
    121a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    121e:	45b9                	li	a1,14
    1220:	bf5d                	j	11d6 <printint.constprop.0+0x12c>
    1222:	47a5                	li	a5,9
    1224:	45a9                	li	a1,10
    1226:	bf79                	j	11c4 <printint.constprop.0+0x11a>
    1228:	47b5                	li	a5,13
    122a:	45b9                	li	a1,14
    122c:	bf61                	j	11c4 <printint.constprop.0+0x11a>
    122e:	47b1                	li	a5,12
    1230:	45b5                	li	a1,13
    1232:	bf49                	j	11c4 <printint.constprop.0+0x11a>
    1234:	47ad                	li	a5,11
    1236:	45b1                	li	a1,12
    1238:	b771                	j	11c4 <printint.constprop.0+0x11a>
    123a:	47a9                	li	a5,10
    123c:	45ad                	li	a1,11
    123e:	b759                	j	11c4 <printint.constprop.0+0x11a>
    i = 15;
    1240:	45bd                	li	a1,15
    1242:	bf51                	j	11d6 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1244:	47a1                	li	a5,8
    1246:	45a5                	li	a1,9
    1248:	bfb5                	j	11c4 <printint.constprop.0+0x11a>
    124a:	479d                	li	a5,7
    124c:	45a1                	li	a1,8
    124e:	bf9d                	j	11c4 <printint.constprop.0+0x11a>
    1250:	4799                	li	a5,6
    1252:	459d                	li	a1,7
    1254:	bf85                	j	11c4 <printint.constprop.0+0x11a>

0000000000001256 <getchar>:
{
    1256:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1258:	00f10593          	addi	a1,sp,15
    125c:	4605                	li	a2,1
    125e:	4501                	li	a0,0
{
    1260:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1262:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1266:	2f7000ef          	jal	ra,1d5c <read>
}
    126a:	60e2                	ld	ra,24(sp)
    126c:	00f14503          	lbu	a0,15(sp)
    1270:	6105                	addi	sp,sp,32
    1272:	8082                	ret

0000000000001274 <putchar>:
{
    1274:	1101                	addi	sp,sp,-32
    char byte = c;
    1276:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    127a:	00f10593          	addi	a1,sp,15
    127e:	4605                	li	a2,1
    1280:	4505                	li	a0,1
{
    1282:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    1284:	2e3000ef          	jal	ra,1d66 <write>
}
    1288:	60e2                	ld	ra,24(sp)
    128a:	2501                	sext.w	a0,a0
    128c:	6105                	addi	sp,sp,32
    128e:	8082                	ret

0000000000001290 <puts>:
{
    1290:	1141                	addi	sp,sp,-16
    1292:	e406                	sd	ra,8(sp)
    1294:	e022                	sd	s0,0(sp)
    1296:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1298:	5b2000ef          	jal	ra,184a <strlen>
    129c:	862a                	mv	a2,a0
    129e:	85a2                	mv	a1,s0
    12a0:	4505                	li	a0,1
    12a2:	2c5000ef          	jal	ra,1d66 <write>
}
    12a6:	60a2                	ld	ra,8(sp)
    12a8:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12aa:	957d                	srai	a0,a0,0x3f
    return r;
    12ac:	2501                	sext.w	a0,a0
}
    12ae:	0141                	addi	sp,sp,16
    12b0:	8082                	ret

00000000000012b2 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12b2:	7131                	addi	sp,sp,-192
    12b4:	e0da                	sd	s6,64(sp)
    12b6:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12b8:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12ba:	013c                	addi	a5,sp,136
{
    12bc:	f0ca                	sd	s2,96(sp)
    12be:	ecce                	sd	s3,88(sp)
    12c0:	e8d2                	sd	s4,80(sp)
    12c2:	e4d6                	sd	s5,72(sp)
    12c4:	fc5e                	sd	s7,56(sp)
    12c6:	fc86                	sd	ra,120(sp)
    12c8:	f8a2                	sd	s0,112(sp)
    12ca:	f4a6                	sd	s1,104(sp)
    12cc:	89aa                	mv	s3,a0
    12ce:	e52e                	sd	a1,136(sp)
    12d0:	e932                	sd	a2,144(sp)
    12d2:	ed36                	sd	a3,152(sp)
    12d4:	f13a                	sd	a4,160(sp)
    12d6:	f942                	sd	a6,176(sp)
    12d8:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12da:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12dc:	02500913          	li	s2,37
    12e0:	07000a93          	li	s5,112
    buf[i++] = '0';
    12e4:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12e8:	00001a17          	auipc	s4,0x1
    12ec:	d80a0a13          	addi	s4,s4,-640 # 2068 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12f0:	00001b97          	auipc	s7,0x1
    12f4:	d48b8b93          	addi	s7,s7,-696 # 2038 <__clone+0x98>
        if (!*s)
    12f8:	0009c783          	lbu	a5,0(s3)
    12fc:	cfb9                	beqz	a5,135a <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    12fe:	23278d63          	beq	a5,s2,1538 <printf+0x286>
    1302:	864e                	mv	a2,s3
    1304:	a019                	j	130a <printf+0x58>
    1306:	07278563          	beq	a5,s2,1370 <printf+0xbe>
    130a:	0605                	addi	a2,a2,1
    130c:	00064783          	lbu	a5,0(a2)
    1310:	fbfd                	bnez	a5,1306 <printf+0x54>
    1312:	84b2                	mv	s1,a2
        l = z - a;
    1314:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1318:	8622                	mv	a2,s0
    131a:	85ce                	mv	a1,s3
    131c:	4505                	li	a0,1
    131e:	249000ef          	jal	ra,1d66 <write>
        if (l)
    1322:	ec3d                	bnez	s0,13a0 <printf+0xee>
        if (s[1] == 0)
    1324:	0014c783          	lbu	a5,1(s1)
    1328:	cb8d                	beqz	a5,135a <printf+0xa8>
        switch (s[1])
    132a:	09578b63          	beq	a5,s5,13c0 <printf+0x10e>
    132e:	06fafb63          	bleu	a5,s5,13a4 <printf+0xf2>
    1332:	07300713          	li	a4,115
    1336:	1ce78e63          	beq	a5,a4,1512 <printf+0x260>
    133a:	07800713          	li	a4,120
    133e:	1ae79563          	bne	a5,a4,14e8 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1342:	6782                	ld	a5,0(sp)
    1344:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1346:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    134a:	4388                	lw	a0,0(a5)
    134c:	07a1                	addi	a5,a5,8
    134e:	e03e                	sd	a5,0(sp)
    1350:	d5bff0ef          	jal	ra,10aa <printint.constprop.0>
        if (!*s)
    1354:	0009c783          	lbu	a5,0(s3)
    1358:	f3dd                	bnez	a5,12fe <printf+0x4c>
    }
    va_end(ap);
}
    135a:	70e6                	ld	ra,120(sp)
    135c:	7446                	ld	s0,112(sp)
    135e:	74a6                	ld	s1,104(sp)
    1360:	7906                	ld	s2,96(sp)
    1362:	69e6                	ld	s3,88(sp)
    1364:	6a46                	ld	s4,80(sp)
    1366:	6aa6                	ld	s5,72(sp)
    1368:	6b06                	ld	s6,64(sp)
    136a:	7be2                	ld	s7,56(sp)
    136c:	6129                	addi	sp,sp,192
    136e:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1370:	00164783          	lbu	a5,1(a2)
    1374:	84b2                	mv	s1,a2
    1376:	01278763          	beq	a5,s2,1384 <printf+0xd2>
    137a:	bf69                	j	1314 <printf+0x62>
    137c:	0014c783          	lbu	a5,1(s1)
    1380:	f9279ae3          	bne	a5,s2,1314 <printf+0x62>
    1384:	0489                	addi	s1,s1,2
    1386:	0004c783          	lbu	a5,0(s1)
    138a:	0605                	addi	a2,a2,1
    138c:	ff2788e3          	beq	a5,s2,137c <printf+0xca>
        l = z - a;
    1390:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1394:	8622                	mv	a2,s0
    1396:	85ce                	mv	a1,s3
    1398:	4505                	li	a0,1
    139a:	1cd000ef          	jal	ra,1d66 <write>
        if (l)
    139e:	d059                	beqz	s0,1324 <printf+0x72>
    13a0:	89a6                	mv	s3,s1
    13a2:	bf99                	j	12f8 <printf+0x46>
    13a4:	06400713          	li	a4,100
    13a8:	14e79063          	bne	a5,a4,14e8 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13ac:	6782                	ld	a5,0(sp)
    13ae:	45a9                	li	a1,10
        s += 2;
    13b0:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13b4:	4388                	lw	a0,0(a5)
    13b6:	07a1                	addi	a5,a5,8
    13b8:	e03e                	sd	a5,0(sp)
    13ba:	cf1ff0ef          	jal	ra,10aa <printint.constprop.0>
        s += 2;
    13be:	bf59                	j	1354 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13c0:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13c2:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13c6:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13c8:	631c                	ld	a5,0(a4)
    13ca:	0721                	addi	a4,a4,8
    13cc:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13ce:	00479293          	slli	t0,a5,0x4
    13d2:	00879f93          	slli	t6,a5,0x8
    13d6:	00c79f13          	slli	t5,a5,0xc
    13da:	01079e93          	slli	t4,a5,0x10
    13de:	01479e13          	slli	t3,a5,0x14
    13e2:	01879313          	slli	t1,a5,0x18
    13e6:	01c79893          	slli	a7,a5,0x1c
    13ea:	02479813          	slli	a6,a5,0x24
    13ee:	02879513          	slli	a0,a5,0x28
    13f2:	02c79593          	slli	a1,a5,0x2c
    13f6:	03079693          	slli	a3,a5,0x30
    13fa:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13fe:	03c7d413          	srli	s0,a5,0x3c
    1402:	01c7d39b          	srliw	t2,a5,0x1c
    1406:	03c2d293          	srli	t0,t0,0x3c
    140a:	03cfdf93          	srli	t6,t6,0x3c
    140e:	03cf5f13          	srli	t5,t5,0x3c
    1412:	03cede93          	srli	t4,t4,0x3c
    1416:	03ce5e13          	srli	t3,t3,0x3c
    141a:	03c35313          	srli	t1,t1,0x3c
    141e:	03c8d893          	srli	a7,a7,0x3c
    1422:	03c85813          	srli	a6,a6,0x3c
    1426:	9171                	srli	a0,a0,0x3c
    1428:	91f1                	srli	a1,a1,0x3c
    142a:	92f1                	srli	a3,a3,0x3c
    142c:	9371                	srli	a4,a4,0x3c
    142e:	96d2                	add	a3,a3,s4
    1430:	9752                	add	a4,a4,s4
    1432:	9452                	add	s0,s0,s4
    1434:	92d2                	add	t0,t0,s4
    1436:	9fd2                	add	t6,t6,s4
    1438:	9f52                	add	t5,t5,s4
    143a:	9ed2                	add	t4,t4,s4
    143c:	9e52                	add	t3,t3,s4
    143e:	9352                	add	t1,t1,s4
    1440:	98d2                	add	a7,a7,s4
    1442:	93d2                	add	t2,t2,s4
    1444:	9852                	add	a6,a6,s4
    1446:	9552                	add	a0,a0,s4
    1448:	95d2                	add	a1,a1,s4
    144a:	0006c983          	lbu	s3,0(a3)
    144e:	0002c283          	lbu	t0,0(t0)
    1452:	00074683          	lbu	a3,0(a4)
    1456:	000fcf83          	lbu	t6,0(t6)
    145a:	000f4f03          	lbu	t5,0(t5)
    145e:	000ece83          	lbu	t4,0(t4)
    1462:	000e4e03          	lbu	t3,0(t3)
    1466:	00034303          	lbu	t1,0(t1)
    146a:	0008c883          	lbu	a7,0(a7)
    146e:	0003c383          	lbu	t2,0(t2)
    1472:	00084803          	lbu	a6,0(a6)
    1476:	00054503          	lbu	a0,0(a0)
    147a:	0005c583          	lbu	a1,0(a1)
    147e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1482:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1486:	9371                	srli	a4,a4,0x3c
    1488:	8bbd                	andi	a5,a5,15
    148a:	9752                	add	a4,a4,s4
    148c:	97d2                	add	a5,a5,s4
    148e:	005105a3          	sb	t0,11(sp)
    1492:	01f10623          	sb	t6,12(sp)
    1496:	01e106a3          	sb	t5,13(sp)
    149a:	01d10723          	sb	t4,14(sp)
    149e:	01c107a3          	sb	t3,15(sp)
    14a2:	00610823          	sb	t1,16(sp)
    14a6:	011108a3          	sb	a7,17(sp)
    14aa:	00710923          	sb	t2,18(sp)
    14ae:	010109a3          	sb	a6,19(sp)
    14b2:	00a10a23          	sb	a0,20(sp)
    14b6:	00b10aa3          	sb	a1,21(sp)
    14ba:	01310b23          	sb	s3,22(sp)
    14be:	00d10ba3          	sb	a3,23(sp)
    14c2:	00810523          	sb	s0,10(sp)
    14c6:	00074703          	lbu	a4,0(a4)
    14ca:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14ce:	002c                	addi	a1,sp,8
    14d0:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14d2:	00e10c23          	sb	a4,24(sp)
    14d6:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14da:	00010d23          	sb	zero,26(sp)
        s += 2;
    14de:	00248993          	addi	s3,s1,2
    write(f, s, l);
    14e2:	085000ef          	jal	ra,1d66 <write>
        s += 2;
    14e6:	b5bd                	j	1354 <printf+0xa2>
    char byte = c;
    14e8:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    14ec:	4605                	li	a2,1
    14ee:	002c                	addi	a1,sp,8
    14f0:	4505                	li	a0,1
    char byte = c;
    14f2:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    14f6:	071000ef          	jal	ra,1d66 <write>
    char byte = c;
    14fa:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    14fe:	4605                	li	a2,1
    1500:	002c                	addi	a1,sp,8
    1502:	4505                	li	a0,1
    char byte = c;
    1504:	00f10423          	sb	a5,8(sp)
        s += 2;
    1508:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    150c:	05b000ef          	jal	ra,1d66 <write>
        s += 2;
    1510:	b591                	j	1354 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1512:	6782                	ld	a5,0(sp)
    1514:	6380                	ld	s0,0(a5)
    1516:	07a1                	addi	a5,a5,8
    1518:	e03e                	sd	a5,0(sp)
    151a:	cc05                	beqz	s0,1552 <printf+0x2a0>
            l = strnlen(a, 200);
    151c:	0c800593          	li	a1,200
    1520:	8522                	mv	a0,s0
    1522:	45a000ef          	jal	ra,197c <strnlen>
    write(f, s, l);
    1526:	0005061b          	sext.w	a2,a0
    152a:	85a2                	mv	a1,s0
    152c:	4505                	li	a0,1
    152e:	039000ef          	jal	ra,1d66 <write>
        s += 2;
    1532:	00248993          	addi	s3,s1,2
    1536:	bd39                	j	1354 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1538:	0019c783          	lbu	a5,1(s3)
    153c:	84ce                	mv	s1,s3
    153e:	864e                	mv	a2,s3
    1540:	e52782e3          	beq	a5,s2,1384 <printf+0xd2>
    write(f, s, l);
    1544:	4601                	li	a2,0
    1546:	85ce                	mv	a1,s3
    1548:	4505                	li	a0,1
    154a:	01d000ef          	jal	ra,1d66 <write>
    154e:	84ce                	mv	s1,s3
    1550:	bbd1                	j	1324 <printf+0x72>
                a = "(null)";
    1552:	845e                	mv	s0,s7
    1554:	b7e1                	j	151c <printf+0x26a>

0000000000001556 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1556:	1141                	addi	sp,sp,-16
    1558:	e406                	sd	ra,8(sp)
    puts(m);
    155a:	d37ff0ef          	jal	ra,1290 <puts>
    exit(-100);
}
    155e:	60a2                	ld	ra,8(sp)
    exit(-100);
    1560:	f9c00513          	li	a0,-100
}
    1564:	0141                	addi	sp,sp,16
    exit(-100);
    1566:	0530006f          	j	1db8 <exit>

000000000000156a <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    156a:	02000793          	li	a5,32
    156e:	00f50663          	beq	a0,a5,157a <isspace+0x10>
    1572:	355d                	addiw	a0,a0,-9
    1574:	00553513          	sltiu	a0,a0,5
    1578:	8082                	ret
    157a:	4505                	li	a0,1
}
    157c:	8082                	ret

000000000000157e <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    157e:	fd05051b          	addiw	a0,a0,-48
}
    1582:	00a53513          	sltiu	a0,a0,10
    1586:	8082                	ret

0000000000001588 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1588:	02000613          	li	a2,32
    158c:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    158e:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1592:	0007079b          	sext.w	a5,a4
    1596:	ff77869b          	addiw	a3,a5,-9
    159a:	04c70b63          	beq	a4,a2,15f0 <atoi+0x68>
    159e:	04d5f963          	bleu	a3,a1,15f0 <atoi+0x68>
        s++;
    switch (*s)
    15a2:	02b00693          	li	a3,43
    15a6:	04d70a63          	beq	a4,a3,15fa <atoi+0x72>
    15aa:	02d00693          	li	a3,45
    15ae:	06d70463          	beq	a4,a3,1616 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15b2:	fd07859b          	addiw	a1,a5,-48
    15b6:	4625                	li	a2,9
    15b8:	873e                	mv	a4,a5
    15ba:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15bc:	4e01                	li	t3,0
    while (isdigit(*s))
    15be:	04b66a63          	bltu	a2,a1,1612 <atoi+0x8a>
    int n = 0, neg = 0;
    15c2:	4501                	li	a0,0
    while (isdigit(*s))
    15c4:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15c6:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15c8:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15cc:	0025179b          	slliw	a5,a0,0x2
    15d0:	9d3d                	addw	a0,a0,a5
    15d2:	fd07031b          	addiw	t1,a4,-48
    15d6:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15da:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15de:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15e2:	0006071b          	sext.w	a4,a2
    15e6:	feb870e3          	bleu	a1,a6,15c6 <atoi+0x3e>
    return neg ? n : -n;
    15ea:	000e0563          	beqz	t3,15f4 <atoi+0x6c>
}
    15ee:	8082                	ret
        s++;
    15f0:	0505                	addi	a0,a0,1
    15f2:	bf71                	j	158e <atoi+0x6>
    15f4:	4113053b          	subw	a0,t1,a7
    15f8:	8082                	ret
    while (isdigit(*s))
    15fa:	00154783          	lbu	a5,1(a0)
    15fe:	4625                	li	a2,9
        s++;
    1600:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1604:	fd07859b          	addiw	a1,a5,-48
    1608:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    160c:	4e01                	li	t3,0
    while (isdigit(*s))
    160e:	fab67ae3          	bleu	a1,a2,15c2 <atoi+0x3a>
    1612:	4501                	li	a0,0
}
    1614:	8082                	ret
    while (isdigit(*s))
    1616:	00154783          	lbu	a5,1(a0)
    161a:	4625                	li	a2,9
        s++;
    161c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1620:	fd07859b          	addiw	a1,a5,-48
    1624:	0007871b          	sext.w	a4,a5
    1628:	feb665e3          	bltu	a2,a1,1612 <atoi+0x8a>
        neg = 1;
    162c:	4e05                	li	t3,1
    162e:	bf51                	j	15c2 <atoi+0x3a>

0000000000001630 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1630:	16060d63          	beqz	a2,17aa <memset+0x17a>
    1634:	40a007b3          	neg	a5,a0
    1638:	8b9d                	andi	a5,a5,7
    163a:	00778713          	addi	a4,a5,7
    163e:	482d                	li	a6,11
    1640:	0ff5f593          	andi	a1,a1,255
    1644:	fff60693          	addi	a3,a2,-1
    1648:	17076263          	bltu	a4,a6,17ac <memset+0x17c>
    164c:	16e6ea63          	bltu	a3,a4,17c0 <memset+0x190>
    1650:	16078563          	beqz	a5,17ba <memset+0x18a>
    1654:	00b50023          	sb	a1,0(a0)
    1658:	4705                	li	a4,1
    165a:	00150e93          	addi	t4,a0,1
    165e:	14e78c63          	beq	a5,a4,17b6 <memset+0x186>
    1662:	00b500a3          	sb	a1,1(a0)
    1666:	4709                	li	a4,2
    1668:	00250e93          	addi	t4,a0,2
    166c:	14e78d63          	beq	a5,a4,17c6 <memset+0x196>
    1670:	00b50123          	sb	a1,2(a0)
    1674:	470d                	li	a4,3
    1676:	00350e93          	addi	t4,a0,3
    167a:	12e78b63          	beq	a5,a4,17b0 <memset+0x180>
    167e:	00b501a3          	sb	a1,3(a0)
    1682:	4711                	li	a4,4
    1684:	00450e93          	addi	t4,a0,4
    1688:	14e78163          	beq	a5,a4,17ca <memset+0x19a>
    168c:	00b50223          	sb	a1,4(a0)
    1690:	4715                	li	a4,5
    1692:	00550e93          	addi	t4,a0,5
    1696:	12e78c63          	beq	a5,a4,17ce <memset+0x19e>
    169a:	00b502a3          	sb	a1,5(a0)
    169e:	471d                	li	a4,7
    16a0:	00650e93          	addi	t4,a0,6
    16a4:	12e79763          	bne	a5,a4,17d2 <memset+0x1a2>
    16a8:	00750e93          	addi	t4,a0,7
    16ac:	00b50323          	sb	a1,6(a0)
    16b0:	4f1d                	li	t5,7
    16b2:	00859713          	slli	a4,a1,0x8
    16b6:	8f4d                	or	a4,a4,a1
    16b8:	01059e13          	slli	t3,a1,0x10
    16bc:	01c76e33          	or	t3,a4,t3
    16c0:	01859313          	slli	t1,a1,0x18
    16c4:	006e6333          	or	t1,t3,t1
    16c8:	02059893          	slli	a7,a1,0x20
    16cc:	011368b3          	or	a7,t1,a7
    16d0:	02859813          	slli	a6,a1,0x28
    16d4:	40f60333          	sub	t1,a2,a5
    16d8:	0108e833          	or	a6,a7,a6
    16dc:	03059693          	slli	a3,a1,0x30
    16e0:	00d866b3          	or	a3,a6,a3
    16e4:	03859713          	slli	a4,a1,0x38
    16e8:	97aa                	add	a5,a5,a0
    16ea:	ff837813          	andi	a6,t1,-8
    16ee:	8f55                	or	a4,a4,a3
    16f0:	00f806b3          	add	a3,a6,a5
    16f4:	e398                	sd	a4,0(a5)
    16f6:	07a1                	addi	a5,a5,8
    16f8:	fed79ee3          	bne	a5,a3,16f4 <memset+0xc4>
    16fc:	ff837693          	andi	a3,t1,-8
    1700:	00de87b3          	add	a5,t4,a3
    1704:	01e6873b          	addw	a4,a3,t5
    1708:	0ad30663          	beq	t1,a3,17b4 <memset+0x184>
    170c:	00b78023          	sb	a1,0(a5)
    1710:	0017069b          	addiw	a3,a4,1
    1714:	08c6fb63          	bleu	a2,a3,17aa <memset+0x17a>
    1718:	00b780a3          	sb	a1,1(a5)
    171c:	0027069b          	addiw	a3,a4,2
    1720:	08c6f563          	bleu	a2,a3,17aa <memset+0x17a>
    1724:	00b78123          	sb	a1,2(a5)
    1728:	0037069b          	addiw	a3,a4,3
    172c:	06c6ff63          	bleu	a2,a3,17aa <memset+0x17a>
    1730:	00b781a3          	sb	a1,3(a5)
    1734:	0047069b          	addiw	a3,a4,4
    1738:	06c6f963          	bleu	a2,a3,17aa <memset+0x17a>
    173c:	00b78223          	sb	a1,4(a5)
    1740:	0057069b          	addiw	a3,a4,5
    1744:	06c6f363          	bleu	a2,a3,17aa <memset+0x17a>
    1748:	00b782a3          	sb	a1,5(a5)
    174c:	0067069b          	addiw	a3,a4,6
    1750:	04c6fd63          	bleu	a2,a3,17aa <memset+0x17a>
    1754:	00b78323          	sb	a1,6(a5)
    1758:	0077069b          	addiw	a3,a4,7
    175c:	04c6f763          	bleu	a2,a3,17aa <memset+0x17a>
    1760:	00b783a3          	sb	a1,7(a5)
    1764:	0087069b          	addiw	a3,a4,8
    1768:	04c6f163          	bleu	a2,a3,17aa <memset+0x17a>
    176c:	00b78423          	sb	a1,8(a5)
    1770:	0097069b          	addiw	a3,a4,9
    1774:	02c6fb63          	bleu	a2,a3,17aa <memset+0x17a>
    1778:	00b784a3          	sb	a1,9(a5)
    177c:	00a7069b          	addiw	a3,a4,10
    1780:	02c6f563          	bleu	a2,a3,17aa <memset+0x17a>
    1784:	00b78523          	sb	a1,10(a5)
    1788:	00b7069b          	addiw	a3,a4,11
    178c:	00c6ff63          	bleu	a2,a3,17aa <memset+0x17a>
    1790:	00b785a3          	sb	a1,11(a5)
    1794:	00c7069b          	addiw	a3,a4,12
    1798:	00c6f963          	bleu	a2,a3,17aa <memset+0x17a>
    179c:	00b78623          	sb	a1,12(a5)
    17a0:	2735                	addiw	a4,a4,13
    17a2:	00c77463          	bleu	a2,a4,17aa <memset+0x17a>
    17a6:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17aa:	8082                	ret
    17ac:	472d                	li	a4,11
    17ae:	bd79                	j	164c <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17b0:	4f0d                	li	t5,3
    17b2:	b701                	j	16b2 <memset+0x82>
    17b4:	8082                	ret
    17b6:	4f05                	li	t5,1
    17b8:	bded                	j	16b2 <memset+0x82>
    17ba:	8eaa                	mv	t4,a0
    17bc:	4f01                	li	t5,0
    17be:	bdd5                	j	16b2 <memset+0x82>
    17c0:	87aa                	mv	a5,a0
    17c2:	4701                	li	a4,0
    17c4:	b7a1                	j	170c <memset+0xdc>
    17c6:	4f09                	li	t5,2
    17c8:	b5ed                	j	16b2 <memset+0x82>
    17ca:	4f11                	li	t5,4
    17cc:	b5dd                	j	16b2 <memset+0x82>
    17ce:	4f15                	li	t5,5
    17d0:	b5cd                	j	16b2 <memset+0x82>
    17d2:	4f19                	li	t5,6
    17d4:	bdf9                	j	16b2 <memset+0x82>

00000000000017d6 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17d6:	00054703          	lbu	a4,0(a0)
    17da:	0005c783          	lbu	a5,0(a1)
    17de:	00e79b63          	bne	a5,a4,17f4 <strcmp+0x1e>
    17e2:	cf89                	beqz	a5,17fc <strcmp+0x26>
    17e4:	0505                	addi	a0,a0,1
    17e6:	0585                	addi	a1,a1,1
    17e8:	0005c783          	lbu	a5,0(a1)
    17ec:	00054703          	lbu	a4,0(a0)
    17f0:	fef709e3          	beq	a4,a5,17e2 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    17f4:	0007051b          	sext.w	a0,a4
}
    17f8:	9d1d                	subw	a0,a0,a5
    17fa:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    17fc:	4501                	li	a0,0
}
    17fe:	9d1d                	subw	a0,a0,a5
    1800:	8082                	ret

0000000000001802 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1802:	c231                	beqz	a2,1846 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1804:	00054783          	lbu	a5,0(a0)
    1808:	0005c683          	lbu	a3,0(a1)
    180c:	c795                	beqz	a5,1838 <strncmp+0x36>
    180e:	ca85                	beqz	a3,183e <strncmp+0x3c>
    if (!n--)
    1810:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1812:	c615                	beqz	a2,183e <strncmp+0x3c>
    1814:	00150713          	addi	a4,a0,1
    1818:	9532                	add	a0,a0,a2
    181a:	00d78963          	beq	a5,a3,182c <strncmp+0x2a>
    181e:	a005                	j	183e <strncmp+0x3c>
    1820:	ce99                	beqz	a3,183e <strncmp+0x3c>
    1822:	00e50e63          	beq	a0,a4,183e <strncmp+0x3c>
    1826:	0705                	addi	a4,a4,1
    1828:	00d79b63          	bne	a5,a3,183e <strncmp+0x3c>
    182c:	00074783          	lbu	a5,0(a4)
    1830:	0585                	addi	a1,a1,1
    1832:	0005c683          	lbu	a3,0(a1)
    1836:	f7ed                	bnez	a5,1820 <strncmp+0x1e>
    1838:	4501                	li	a0,0
        ;
    return *l - *r;
    183a:	9d15                	subw	a0,a0,a3
    183c:	8082                	ret
    183e:	0007851b          	sext.w	a0,a5
    1842:	9d15                	subw	a0,a0,a3
    1844:	8082                	ret
        return 0;
    1846:	4501                	li	a0,0
}
    1848:	8082                	ret

000000000000184a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    184a:	00757793          	andi	a5,a0,7
    184e:	cfa1                	beqz	a5,18a6 <strlen+0x5c>
        if (!*s)
    1850:	00054783          	lbu	a5,0(a0)
    1854:	cbb9                	beqz	a5,18aa <strlen+0x60>
    1856:	87aa                	mv	a5,a0
    1858:	a021                	j	1860 <strlen+0x16>
    185a:	0007c703          	lbu	a4,0(a5)
    185e:	c329                	beqz	a4,18a0 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    1860:	0785                	addi	a5,a5,1
    1862:	0077f713          	andi	a4,a5,7
    1866:	fb75                	bnez	a4,185a <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    1868:	00000717          	auipc	a4,0x0
    186c:	7d870713          	addi	a4,a4,2008 # 2040 <__clone+0xa0>
    1870:	630c                	ld	a1,0(a4)
    1872:	00000717          	auipc	a4,0x0
    1876:	7d670713          	addi	a4,a4,2006 # 2048 <__clone+0xa8>
    187a:	6394                	ld	a3,0(a5)
    187c:	6310                	ld	a2,0(a4)
    187e:	a019                	j	1884 <strlen+0x3a>
    1880:	07a1                	addi	a5,a5,8
    1882:	6394                	ld	a3,0(a5)
    1884:	00b68733          	add	a4,a3,a1
    1888:	fff6c693          	not	a3,a3
    188c:	8f75                	and	a4,a4,a3
    188e:	8f71                	and	a4,a4,a2
    1890:	db65                	beqz	a4,1880 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    1892:	0007c703          	lbu	a4,0(a5)
    1896:	c709                	beqz	a4,18a0 <strlen+0x56>
    1898:	0785                	addi	a5,a5,1
    189a:	0007c703          	lbu	a4,0(a5)
    189e:	ff6d                	bnez	a4,1898 <strlen+0x4e>
        ;
    return s - a;
    18a0:	40a78533          	sub	a0,a5,a0
}
    18a4:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18a6:	87aa                	mv	a5,a0
    18a8:	b7c1                	j	1868 <strlen+0x1e>
        if (!*s)
    18aa:	4501                	li	a0,0
            return s - a;
    18ac:	8082                	ret

00000000000018ae <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ae:	00757793          	andi	a5,a0,7
    18b2:	0ff5f593          	andi	a1,a1,255
    18b6:	cb99                	beqz	a5,18cc <memchr+0x1e>
    18b8:	c655                	beqz	a2,1964 <memchr+0xb6>
    18ba:	00054783          	lbu	a5,0(a0)
    18be:	0ab78663          	beq	a5,a1,196a <memchr+0xbc>
    18c2:	0505                	addi	a0,a0,1
    18c4:	00757793          	andi	a5,a0,7
    18c8:	167d                	addi	a2,a2,-1
    18ca:	f7fd                	bnez	a5,18b8 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18cc:	4701                	li	a4,0
    if (n && *s != c)
    18ce:	ca49                	beqz	a2,1960 <memchr+0xb2>
    18d0:	00054783          	lbu	a5,0(a0)
    18d4:	08b78b63          	beq	a5,a1,196a <memchr+0xbc>
        size_t k = ONES * c;
    18d8:	00000797          	auipc	a5,0x0
    18dc:	77878793          	addi	a5,a5,1912 # 2050 <__clone+0xb0>
    18e0:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18e2:	479d                	li	a5,7
        size_t k = ONES * c;
    18e4:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18e8:	08c7f863          	bleu	a2,a5,1978 <memchr+0xca>
    18ec:	611c                	ld	a5,0(a0)
    18ee:	00000317          	auipc	t1,0x0
    18f2:	75a30313          	addi	t1,t1,1882 # 2048 <__clone+0xa8>
    18f6:	00033803          	ld	a6,0(t1)
    18fa:	00f8c7b3          	xor	a5,a7,a5
    18fe:	fff7c713          	not	a4,a5
    1902:	8f95                	sub	a5,a5,a3
    1904:	8ff9                	and	a5,a5,a4
    1906:	0107f7b3          	and	a5,a5,a6
    190a:	e7bd                	bnez	a5,1978 <memchr+0xca>
    190c:	4e1d                	li	t3,7
    190e:	00000e97          	auipc	t4,0x0
    1912:	732e8e93          	addi	t4,t4,1842 # 2040 <__clone+0xa0>
    1916:	a005                	j	1936 <memchr+0x88>
    1918:	6514                	ld	a3,8(a0)
    191a:	000eb783          	ld	a5,0(t4)
    191e:	00033803          	ld	a6,0(t1)
    1922:	00d8c6b3          	xor	a3,a7,a3
    1926:	97b6                	add	a5,a5,a3
    1928:	fff6c693          	not	a3,a3
    192c:	8ff5                	and	a5,a5,a3
    192e:	0107f7b3          	and	a5,a5,a6
    1932:	e3a1                	bnez	a5,1972 <memchr+0xc4>
    1934:	853a                	mv	a0,a4
    1936:	1661                	addi	a2,a2,-8
    1938:	00850713          	addi	a4,a0,8
    193c:	fcce6ee3          	bltu	t3,a2,1918 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1940:	c215                	beqz	a2,1964 <memchr+0xb6>
    1942:	00074783          	lbu	a5,0(a4)
    1946:	00f58d63          	beq	a1,a5,1960 <memchr+0xb2>
    194a:	00170793          	addi	a5,a4,1
    194e:	963a                	add	a2,a2,a4
    1950:	873e                	mv	a4,a5
    1952:	00f60963          	beq	a2,a5,1964 <memchr+0xb6>
    1956:	0007c683          	lbu	a3,0(a5)
    195a:	0785                	addi	a5,a5,1
    195c:	feb69ae3          	bne	a3,a1,1950 <memchr+0xa2>
}
    1960:	853a                	mv	a0,a4
    1962:	8082                	ret
    return n ? (void *)s : 0;
    1964:	4701                	li	a4,0
}
    1966:	853a                	mv	a0,a4
    1968:	8082                	ret
    196a:	872a                	mv	a4,a0
    196c:	00074783          	lbu	a5,0(a4)
    1970:	bfd9                	j	1946 <memchr+0x98>
    1972:	00854783          	lbu	a5,8(a0)
    1976:	bfc1                	j	1946 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1978:	872a                	mv	a4,a0
    197a:	bfc1                	j	194a <memchr+0x9c>

000000000000197c <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    197c:	00757793          	andi	a5,a0,7
    1980:	cfc5                	beqz	a5,1a38 <strnlen+0xbc>
    1982:	c1c5                	beqz	a1,1a22 <strnlen+0xa6>
    1984:	00054783          	lbu	a5,0(a0)
    1988:	cfd9                	beqz	a5,1a26 <strnlen+0xaa>
    198a:	87ae                	mv	a5,a1
    198c:	86aa                	mv	a3,a0
    198e:	a029                	j	1998 <strnlen+0x1c>
    1990:	cbc9                	beqz	a5,1a22 <strnlen+0xa6>
    1992:	0006c703          	lbu	a4,0(a3)
    1996:	cb51                	beqz	a4,1a2a <strnlen+0xae>
    1998:	0685                	addi	a3,a3,1
    199a:	0076f713          	andi	a4,a3,7
    199e:	17fd                	addi	a5,a5,-1
    19a0:	fb65                	bnez	a4,1990 <strnlen+0x14>
    if (n && *s != c)
    19a2:	c3c1                	beqz	a5,1a22 <strnlen+0xa6>
    19a4:	0006c703          	lbu	a4,0(a3)
    19a8:	c349                	beqz	a4,1a2a <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19aa:	471d                	li	a4,7
    19ac:	08f77a63          	bleu	a5,a4,1a40 <strnlen+0xc4>
    19b0:	00000e17          	auipc	t3,0x0
    19b4:	690e0e13          	addi	t3,t3,1680 # 2040 <__clone+0xa0>
    19b8:	6290                	ld	a2,0(a3)
    19ba:	000e3703          	ld	a4,0(t3)
    19be:	00000e97          	auipc	t4,0x0
    19c2:	68ae8e93          	addi	t4,t4,1674 # 2048 <__clone+0xa8>
    19c6:	000eb803          	ld	a6,0(t4)
    19ca:	9732                	add	a4,a4,a2
    19cc:	fff64613          	not	a2,a2
    19d0:	8f71                	and	a4,a4,a2
    19d2:	01077733          	and	a4,a4,a6
    19d6:	e72d                	bnez	a4,1a40 <strnlen+0xc4>
    19d8:	4f1d                	li	t5,7
    19da:	a839                	j	19f8 <strnlen+0x7c>
    19dc:	6698                	ld	a4,8(a3)
    19de:	000e3303          	ld	t1,0(t3)
    19e2:	000eb803          	ld	a6,0(t4)
    19e6:	fff74893          	not	a7,a4
    19ea:	971a                	add	a4,a4,t1
    19ec:	01177733          	and	a4,a4,a7
    19f0:	01077733          	and	a4,a4,a6
    19f4:	ef1d                	bnez	a4,1a32 <strnlen+0xb6>
    19f6:	86b2                	mv	a3,a2
    19f8:	17e1                	addi	a5,a5,-8
    19fa:	00868613          	addi	a2,a3,8
    19fe:	fcff6fe3          	bltu	t5,a5,19dc <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a02:	c385                	beqz	a5,1a22 <strnlen+0xa6>
    1a04:	00064703          	lbu	a4,0(a2)
    1a08:	cb19                	beqz	a4,1a1e <strnlen+0xa2>
    1a0a:	00160713          	addi	a4,a2,1
    1a0e:	97b2                	add	a5,a5,a2
    1a10:	863a                	mv	a2,a4
    1a12:	00e78863          	beq	a5,a4,1a22 <strnlen+0xa6>
    1a16:	0705                	addi	a4,a4,1
    1a18:	fff74683          	lbu	a3,-1(a4)
    1a1c:	faf5                	bnez	a3,1a10 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a1e:	40a605b3          	sub	a1,a2,a0
}
    1a22:	852e                	mv	a0,a1
    1a24:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a26:	87ae                	mv	a5,a1
    1a28:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a2a:	8636                	mv	a2,a3
    1a2c:	00064703          	lbu	a4,0(a2)
    1a30:	bfe1                	j	1a08 <strnlen+0x8c>
    1a32:	0086c703          	lbu	a4,8(a3)
    1a36:	bfc9                	j	1a08 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a38:	87ae                	mv	a5,a1
    1a3a:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a3c:	f7a5                	bnez	a5,19a4 <strnlen+0x28>
    1a3e:	b7d5                	j	1a22 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a40:	8636                	mv	a2,a3
    1a42:	b7e1                	j	1a0a <strnlen+0x8e>

0000000000001a44 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a44:	00b547b3          	xor	a5,a0,a1
    1a48:	8b9d                	andi	a5,a5,7
    1a4a:	efa9                	bnez	a5,1aa4 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a4c:	0075f793          	andi	a5,a1,7
    1a50:	c38d                	beqz	a5,1a72 <strcpy+0x2e>
            if (!(*d = *s))
    1a52:	0005c783          	lbu	a5,0(a1)
    1a56:	00f50023          	sb	a5,0(a0)
    1a5a:	e799                	bnez	a5,1a68 <strcpy+0x24>
    1a5c:	a095                	j	1ac0 <strcpy+0x7c>
    1a5e:	0005c783          	lbu	a5,0(a1)
    1a62:	00f50023          	sb	a5,0(a0)
    1a66:	cbb9                	beqz	a5,1abc <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a68:	0585                	addi	a1,a1,1
    1a6a:	0075f793          	andi	a5,a1,7
    1a6e:	0505                	addi	a0,a0,1
    1a70:	f7fd                	bnez	a5,1a5e <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a72:	00000797          	auipc	a5,0x0
    1a76:	5ce78793          	addi	a5,a5,1486 # 2040 <__clone+0xa0>
    1a7a:	0007b803          	ld	a6,0(a5)
    1a7e:	00000797          	auipc	a5,0x0
    1a82:	5ca78793          	addi	a5,a5,1482 # 2048 <__clone+0xa8>
    1a86:	6198                	ld	a4,0(a1)
    1a88:	6390                	ld	a2,0(a5)
    1a8a:	a031                	j	1a96 <strcpy+0x52>
    1a8c:	0521                	addi	a0,a0,8
    1a8e:	05a1                	addi	a1,a1,8
    1a90:	fee53c23          	sd	a4,-8(a0)
    1a94:	6198                	ld	a4,0(a1)
    1a96:	010707b3          	add	a5,a4,a6
    1a9a:	fff74693          	not	a3,a4
    1a9e:	8ff5                	and	a5,a5,a3
    1aa0:	8ff1                	and	a5,a5,a2
    1aa2:	d7ed                	beqz	a5,1a8c <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1aa4:	0005c783          	lbu	a5,0(a1)
    1aa8:	00f50023          	sb	a5,0(a0)
    1aac:	cb89                	beqz	a5,1abe <strcpy+0x7a>
    1aae:	0585                	addi	a1,a1,1
    1ab0:	0005c783          	lbu	a5,0(a1)
    1ab4:	0505                	addi	a0,a0,1
    1ab6:	00f50023          	sb	a5,0(a0)
    1aba:	fbf5                	bnez	a5,1aae <strcpy+0x6a>
        ;
    return d;
}
    1abc:	8082                	ret
    1abe:	8082                	ret
    1ac0:	8082                	ret

0000000000001ac2 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ac2:	00b547b3          	xor	a5,a0,a1
    1ac6:	8b9d                	andi	a5,a5,7
    1ac8:	ebc1                	bnez	a5,1b58 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1aca:	0075f793          	andi	a5,a1,7
    1ace:	cf91                	beqz	a5,1aea <strncpy+0x28>
    1ad0:	20060e63          	beqz	a2,1cec <strncpy+0x22a>
    1ad4:	0005c783          	lbu	a5,0(a1)
    1ad8:	00f50023          	sb	a5,0(a0)
    1adc:	c3d5                	beqz	a5,1b80 <strncpy+0xbe>
    1ade:	0585                	addi	a1,a1,1
    1ae0:	0075f793          	andi	a5,a1,7
    1ae4:	167d                	addi	a2,a2,-1
    1ae6:	0505                	addi	a0,a0,1
    1ae8:	f7e5                	bnez	a5,1ad0 <strncpy+0xe>
            ;
        if (!n || !*s)
    1aea:	20060163          	beqz	a2,1cec <strncpy+0x22a>
    1aee:	0005c683          	lbu	a3,0(a1)
    1af2:	c6d9                	beqz	a3,1b80 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1af4:	479d                	li	a5,7
    1af6:	22c7f563          	bleu	a2,a5,1d20 <strncpy+0x25e>
    1afa:	00000317          	auipc	t1,0x0
    1afe:	54630313          	addi	t1,t1,1350 # 2040 <__clone+0xa0>
    1b02:	6198                	ld	a4,0(a1)
    1b04:	00033783          	ld	a5,0(t1)
    1b08:	00000e17          	auipc	t3,0x0
    1b0c:	540e0e13          	addi	t3,t3,1344 # 2048 <__clone+0xa8>
    1b10:	000e3803          	ld	a6,0(t3)
    1b14:	97ba                	add	a5,a5,a4
    1b16:	fff74893          	not	a7,a4
    1b1a:	0117f7b3          	and	a5,a5,a7
    1b1e:	0107f7b3          	and	a5,a5,a6
    1b22:	1e079f63          	bnez	a5,1d20 <strncpy+0x25e>
    1b26:	4e9d                	li	t4,7
    1b28:	a005                	j	1b48 <strncpy+0x86>
    1b2a:	6598                	ld	a4,8(a1)
    1b2c:	00033783          	ld	a5,0(t1)
    1b30:	000e3803          	ld	a6,0(t3)
    1b34:	fff74893          	not	a7,a4
    1b38:	97ba                	add	a5,a5,a4
    1b3a:	0117f7b3          	and	a5,a5,a7
    1b3e:	0107f7b3          	and	a5,a5,a6
    1b42:	1a079f63          	bnez	a5,1d00 <strncpy+0x23e>
    1b46:	85b6                	mv	a1,a3
            *wd = *ws;
    1b48:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b4a:	1661                	addi	a2,a2,-8
    1b4c:	00858693          	addi	a3,a1,8
    1b50:	0521                	addi	a0,a0,8
    1b52:	fcceece3          	bltu	t4,a2,1b2a <strncpy+0x68>
    1b56:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b58:	18060a63          	beqz	a2,1cec <strncpy+0x22a>
    1b5c:	0005c783          	lbu	a5,0(a1)
    1b60:	872a                	mv	a4,a0
    1b62:	00f50023          	sb	a5,0(a0)
    1b66:	e799                	bnez	a5,1b74 <strncpy+0xb2>
    1b68:	a829                	j	1b82 <strncpy+0xc0>
    1b6a:	0005c783          	lbu	a5,0(a1)
    1b6e:	00f70023          	sb	a5,0(a4)
    1b72:	cb81                	beqz	a5,1b82 <strncpy+0xc0>
    1b74:	167d                	addi	a2,a2,-1
    1b76:	0585                	addi	a1,a1,1
    1b78:	0705                	addi	a4,a4,1
    1b7a:	fa65                	bnez	a2,1b6a <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b7c:	853a                	mv	a0,a4
    1b7e:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1b80:	872a                	mv	a4,a0
    1b82:	4805                	li	a6,1
    1b84:	14061c63          	bnez	a2,1cdc <strncpy+0x21a>
    1b88:	40e007b3          	neg	a5,a4
    1b8c:	8b9d                	andi	a5,a5,7
    1b8e:	4581                	li	a1,0
    1b90:	12061e63          	bnez	a2,1ccc <strncpy+0x20a>
    1b94:	00778693          	addi	a3,a5,7
    1b98:	452d                	li	a0,11
    1b9a:	12a6e763          	bltu	a3,a0,1cc8 <strncpy+0x206>
    1b9e:	16d5e663          	bltu	a1,a3,1d0a <strncpy+0x248>
    1ba2:	14078c63          	beqz	a5,1cfa <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ba6:	00070023          	sb	zero,0(a4)
    1baa:	4585                	li	a1,1
    1bac:	00170693          	addi	a3,a4,1
    1bb0:	14b78363          	beq	a5,a1,1cf6 <strncpy+0x234>
    1bb4:	000700a3          	sb	zero,1(a4)
    1bb8:	4589                	li	a1,2
    1bba:	00270693          	addi	a3,a4,2
    1bbe:	14b78963          	beq	a5,a1,1d10 <strncpy+0x24e>
    1bc2:	00070123          	sb	zero,2(a4)
    1bc6:	458d                	li	a1,3
    1bc8:	00370693          	addi	a3,a4,3
    1bcc:	12b78363          	beq	a5,a1,1cf2 <strncpy+0x230>
    1bd0:	000701a3          	sb	zero,3(a4)
    1bd4:	4591                	li	a1,4
    1bd6:	00470693          	addi	a3,a4,4
    1bda:	12b78d63          	beq	a5,a1,1d14 <strncpy+0x252>
    1bde:	00070223          	sb	zero,4(a4)
    1be2:	4595                	li	a1,5
    1be4:	00570693          	addi	a3,a4,5
    1be8:	12b78863          	beq	a5,a1,1d18 <strncpy+0x256>
    1bec:	000702a3          	sb	zero,5(a4)
    1bf0:	459d                	li	a1,7
    1bf2:	00670693          	addi	a3,a4,6
    1bf6:	12b79363          	bne	a5,a1,1d1c <strncpy+0x25a>
    1bfa:	00770693          	addi	a3,a4,7
    1bfe:	00070323          	sb	zero,6(a4)
    1c02:	40f80833          	sub	a6,a6,a5
    1c06:	ff887513          	andi	a0,a6,-8
    1c0a:	97ba                	add	a5,a5,a4
    1c0c:	953e                	add	a0,a0,a5
    1c0e:	0007b023          	sd	zero,0(a5)
    1c12:	07a1                	addi	a5,a5,8
    1c14:	fea79de3          	bne	a5,a0,1c0e <strncpy+0x14c>
    1c18:	ff887513          	andi	a0,a6,-8
    1c1c:	9da9                	addw	a1,a1,a0
    1c1e:	00a687b3          	add	a5,a3,a0
    1c22:	f4a80de3          	beq	a6,a0,1b7c <strncpy+0xba>
    1c26:	00078023          	sb	zero,0(a5)
    1c2a:	0015869b          	addiw	a3,a1,1
    1c2e:	f4c6f7e3          	bleu	a2,a3,1b7c <strncpy+0xba>
    1c32:	000780a3          	sb	zero,1(a5)
    1c36:	0025869b          	addiw	a3,a1,2
    1c3a:	f4c6f1e3          	bleu	a2,a3,1b7c <strncpy+0xba>
    1c3e:	00078123          	sb	zero,2(a5)
    1c42:	0035869b          	addiw	a3,a1,3
    1c46:	f2c6fbe3          	bleu	a2,a3,1b7c <strncpy+0xba>
    1c4a:	000781a3          	sb	zero,3(a5)
    1c4e:	0045869b          	addiw	a3,a1,4
    1c52:	f2c6f5e3          	bleu	a2,a3,1b7c <strncpy+0xba>
    1c56:	00078223          	sb	zero,4(a5)
    1c5a:	0055869b          	addiw	a3,a1,5
    1c5e:	f0c6ffe3          	bleu	a2,a3,1b7c <strncpy+0xba>
    1c62:	000782a3          	sb	zero,5(a5)
    1c66:	0065869b          	addiw	a3,a1,6
    1c6a:	f0c6f9e3          	bleu	a2,a3,1b7c <strncpy+0xba>
    1c6e:	00078323          	sb	zero,6(a5)
    1c72:	0075869b          	addiw	a3,a1,7
    1c76:	f0c6f3e3          	bleu	a2,a3,1b7c <strncpy+0xba>
    1c7a:	000783a3          	sb	zero,7(a5)
    1c7e:	0085869b          	addiw	a3,a1,8
    1c82:	eec6fde3          	bleu	a2,a3,1b7c <strncpy+0xba>
    1c86:	00078423          	sb	zero,8(a5)
    1c8a:	0095869b          	addiw	a3,a1,9
    1c8e:	eec6f7e3          	bleu	a2,a3,1b7c <strncpy+0xba>
    1c92:	000784a3          	sb	zero,9(a5)
    1c96:	00a5869b          	addiw	a3,a1,10
    1c9a:	eec6f1e3          	bleu	a2,a3,1b7c <strncpy+0xba>
    1c9e:	00078523          	sb	zero,10(a5)
    1ca2:	00b5869b          	addiw	a3,a1,11
    1ca6:	ecc6fbe3          	bleu	a2,a3,1b7c <strncpy+0xba>
    1caa:	000785a3          	sb	zero,11(a5)
    1cae:	00c5869b          	addiw	a3,a1,12
    1cb2:	ecc6f5e3          	bleu	a2,a3,1b7c <strncpy+0xba>
    1cb6:	00078623          	sb	zero,12(a5)
    1cba:	25b5                	addiw	a1,a1,13
    1cbc:	ecc5f0e3          	bleu	a2,a1,1b7c <strncpy+0xba>
    1cc0:	000786a3          	sb	zero,13(a5)
}
    1cc4:	853a                	mv	a0,a4
    1cc6:	8082                	ret
    1cc8:	46ad                	li	a3,11
    1cca:	bdd1                	j	1b9e <strncpy+0xdc>
    1ccc:	00778693          	addi	a3,a5,7
    1cd0:	452d                	li	a0,11
    1cd2:	fff60593          	addi	a1,a2,-1
    1cd6:	eca6f4e3          	bleu	a0,a3,1b9e <strncpy+0xdc>
    1cda:	b7fd                	j	1cc8 <strncpy+0x206>
    1cdc:	40e007b3          	neg	a5,a4
    1ce0:	8832                	mv	a6,a2
    1ce2:	8b9d                	andi	a5,a5,7
    1ce4:	4581                	li	a1,0
    1ce6:	ea0607e3          	beqz	a2,1b94 <strncpy+0xd2>
    1cea:	b7cd                	j	1ccc <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1cec:	872a                	mv	a4,a0
}
    1cee:	853a                	mv	a0,a4
    1cf0:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cf2:	458d                	li	a1,3
    1cf4:	b739                	j	1c02 <strncpy+0x140>
    1cf6:	4585                	li	a1,1
    1cf8:	b729                	j	1c02 <strncpy+0x140>
    1cfa:	86ba                	mv	a3,a4
    1cfc:	4581                	li	a1,0
    1cfe:	b711                	j	1c02 <strncpy+0x140>
    1d00:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d04:	872a                	mv	a4,a0
    1d06:	85b6                	mv	a1,a3
    1d08:	bda9                	j	1b62 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d0a:	87ba                	mv	a5,a4
    1d0c:	4581                	li	a1,0
    1d0e:	bf21                	j	1c26 <strncpy+0x164>
    1d10:	4589                	li	a1,2
    1d12:	bdc5                	j	1c02 <strncpy+0x140>
    1d14:	4591                	li	a1,4
    1d16:	b5f5                	j	1c02 <strncpy+0x140>
    1d18:	4595                	li	a1,5
    1d1a:	b5e5                	j	1c02 <strncpy+0x140>
    1d1c:	4599                	li	a1,6
    1d1e:	b5d5                	j	1c02 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d20:	00d50023          	sb	a3,0(a0)
    1d24:	872a                	mv	a4,a0
    1d26:	b5b9                	j	1b74 <strncpy+0xb2>

0000000000001d28 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d28:	87aa                	mv	a5,a0
    1d2a:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d2c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d30:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d34:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d36:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d38:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d3c:	2501                	sext.w	a0,a0
    1d3e:	8082                	ret

0000000000001d40 <openat>:
    register long a7 __asm__("a7") = n;
    1d40:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d44:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d48:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d4c:	2501                	sext.w	a0,a0
    1d4e:	8082                	ret

0000000000001d50 <close>:
    register long a7 __asm__("a7") = n;
    1d50:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d54:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d58:	2501                	sext.w	a0,a0
    1d5a:	8082                	ret

0000000000001d5c <read>:
    register long a7 __asm__("a7") = n;
    1d5c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d60:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d64:	8082                	ret

0000000000001d66 <write>:
    register long a7 __asm__("a7") = n;
    1d66:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d6a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d6e:	8082                	ret

0000000000001d70 <getpid>:
    register long a7 __asm__("a7") = n;
    1d70:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d74:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <getppid>:
    register long a7 __asm__("a7") = n;
    1d7c:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d80:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d84:	2501                	sext.w	a0,a0
    1d86:	8082                	ret

0000000000001d88 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d88:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d8c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <fork>:
    register long a7 __asm__("a7") = n;
    1d94:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d98:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d9a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d9c:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1da4:	85b2                	mv	a1,a2
    1da6:	863a                	mv	a2,a4
    if (stack)
    1da8:	c191                	beqz	a1,1dac <clone+0x8>
	stack += stack_size;
    1daa:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dac:	4781                	li	a5,0
    1dae:	4701                	li	a4,0
    1db0:	4681                	li	a3,0
    1db2:	2601                	sext.w	a2,a2
    1db4:	1ec0006f          	j	1fa0 <__clone>

0000000000001db8 <exit>:
    register long a7 __asm__("a7") = n;
    1db8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dbc:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dc0:	8082                	ret

0000000000001dc2 <waitpid>:
    register long a7 __asm__("a7") = n;
    1dc2:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1dc6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dc8:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <exec>:
    register long a7 __asm__("a7") = n;
    1dd0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1dd4:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <execve>:
    register long a7 __asm__("a7") = n;
    1ddc:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1de0:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <times>:
    register long a7 __asm__("a7") = n;
    1de8:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1dec:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <get_time>:

int64 get_time()
{
    1df4:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1df6:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1dfa:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1dfc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dfe:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e02:	2501                	sext.w	a0,a0
    1e04:	ed09                	bnez	a0,1e1e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e06:	67a2                	ld	a5,8(sp)
    1e08:	3e800713          	li	a4,1000
    1e0c:	00015503          	lhu	a0,0(sp)
    1e10:	02e7d7b3          	divu	a5,a5,a4
    1e14:	02e50533          	mul	a0,a0,a4
    1e18:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e1a:	0141                	addi	sp,sp,16
    1e1c:	8082                	ret
        return -1;
    1e1e:	557d                	li	a0,-1
    1e20:	bfed                	j	1e1a <get_time+0x26>

0000000000001e22 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e22:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e26:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <time>:
    register long a7 __asm__("a7") = n;
    1e2e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e32:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e36:	2501                	sext.w	a0,a0
    1e38:	8082                	ret

0000000000001e3a <sleep>:

int sleep(unsigned long long time)
{
    1e3a:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e3c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e3e:	850a                	mv	a0,sp
    1e40:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e42:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e46:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e48:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e4c:	e501                	bnez	a0,1e54 <sleep+0x1a>
    return 0;
    1e4e:	4501                	li	a0,0
}
    1e50:	0141                	addi	sp,sp,16
    1e52:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e54:	4502                	lw	a0,0(sp)
}
    1e56:	0141                	addi	sp,sp,16
    1e58:	8082                	ret

0000000000001e5a <set_priority>:
    register long a7 __asm__("a7") = n;
    1e5a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e5e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e62:	2501                	sext.w	a0,a0
    1e64:	8082                	ret

0000000000001e66 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e66:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e6a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e6e:	8082                	ret

0000000000001e70 <munmap>:
    register long a7 __asm__("a7") = n;
    1e70:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e74:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <wait>:

int wait(int *code)
{
    1e7c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e7e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e82:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e84:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e86:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e88:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e8c:	2501                	sext.w	a0,a0
    1e8e:	8082                	ret

0000000000001e90 <spawn>:
    register long a7 __asm__("a7") = n;
    1e90:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e94:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e98:	2501                	sext.w	a0,a0
    1e9a:	8082                	ret

0000000000001e9c <mailread>:
    register long a7 __asm__("a7") = n;
    1e9c:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea0:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ea8:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eac:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <fstat>:
    register long a7 __asm__("a7") = n;
    1eb4:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb8:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ec0:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ec2:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ec6:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ec8:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ed0:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ed2:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ed6:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed8:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1edc:	2501                	sext.w	a0,a0
    1ede:	8082                	ret

0000000000001ee0 <link>:

int link(char *old_path, char *new_path)
{
    1ee0:	87aa                	mv	a5,a0
    1ee2:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1ee4:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1ee8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eec:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eee:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1ef2:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ef4:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1ef8:	2501                	sext.w	a0,a0
    1efa:	8082                	ret

0000000000001efc <unlink>:

int unlink(char *path)
{
    1efc:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1efe:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f02:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f06:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f08:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f0c:	2501                	sext.w	a0,a0
    1f0e:	8082                	ret

0000000000001f10 <uname>:
    register long a7 __asm__("a7") = n;
    1f10:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f14:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f18:	2501                	sext.w	a0,a0
    1f1a:	8082                	ret

0000000000001f1c <brk>:
    register long a7 __asm__("a7") = n;
    1f1c:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f20:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f24:	2501                	sext.w	a0,a0
    1f26:	8082                	ret

0000000000001f28 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f28:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f2a:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f2e:	8082                	ret

0000000000001f30 <chdir>:
    register long a7 __asm__("a7") = n;
    1f30:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f34:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f38:	2501                	sext.w	a0,a0
    1f3a:	8082                	ret

0000000000001f3c <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f3c:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f3e:	02059613          	slli	a2,a1,0x20
    1f42:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f44:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f48:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f4c:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f4e:	00000073          	ecall
}
    1f52:	2501                	sext.w	a0,a0
    1f54:	8082                	ret

0000000000001f56 <getdents>:
    register long a7 __asm__("a7") = n;
    1f56:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f5a:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f5e:	2501                	sext.w	a0,a0
    1f60:	8082                	ret

0000000000001f62 <pipe>:
    register long a7 __asm__("a7") = n;
    1f62:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f66:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f68:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f6c:	2501                	sext.w	a0,a0
    1f6e:	8082                	ret

0000000000001f70 <dup>:
    register long a7 __asm__("a7") = n;
    1f70:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f72:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f76:	2501                	sext.w	a0,a0
    1f78:	8082                	ret

0000000000001f7a <dup2>:
    register long a7 __asm__("a7") = n;
    1f7a:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f7c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f7e:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f82:	2501                	sext.w	a0,a0
    1f84:	8082                	ret

0000000000001f86 <mount>:
    register long a7 __asm__("a7") = n;
    1f86:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f8a:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f8e:	2501                	sext.w	a0,a0
    1f90:	8082                	ret

0000000000001f92 <umount>:
    register long a7 __asm__("a7") = n;
    1f92:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f96:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f98:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f9c:	2501                	sext.w	a0,a0
    1f9e:	8082                	ret

0000000000001fa0 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fa0:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fa2:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fa4:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fa6:	8532                	mv	a0,a2
	mv a2, a4
    1fa8:	863a                	mv	a2,a4
	mv a3, a5
    1faa:	86be                	mv	a3,a5
	mv a4, a6
    1fac:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fae:	0dc00893          	li	a7,220
	ecall
    1fb2:	00000073          	ecall

	beqz a0, 1f
    1fb6:	c111                	beqz	a0,1fba <__clone+0x1a>
	# Parent
	ret
    1fb8:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fba:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fbc:	6522                	ld	a0,8(sp)
	jalr a1
    1fbe:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fc0:	05d00893          	li	a7,93
	ecall
    1fc4:	00000073          	ecall
