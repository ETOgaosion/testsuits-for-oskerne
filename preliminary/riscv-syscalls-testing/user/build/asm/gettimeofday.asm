
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/gettimeofday:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0de0006f          	j	10e0 <__start_main>

0000000000001006 <test_gettimeofday>:
 * "start:[num], end:[num]"
 * "interval: [num]"	注：数字[num]的值应大于0
 * 测试失败时的输出：
 * "gettimeofday error."
 */
void test_gettimeofday() {
    1006:	7179                	addi	sp,sp,-48
	TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	00050513          	mv	a0,a0
void test_gettimeofday() {
    1010:	f406                	sd	ra,40(sp)
    1012:	ec26                	sd	s1,24(sp)
    1014:	f022                	sd	s0,32(sp)
	TEST_START(__func__);
    1016:	2ca000ef          	jal	ra,12e0 <puts>
    101a:	00001517          	auipc	a0,0x1
    101e:	09e50513          	addi	a0,a0,158 # 20b8 <__func__.1185>
    1022:	2be000ef          	jal	ra,12e0 <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	ffa50513          	addi	a0,a0,-6 # 2020 <__clone+0x44>
    102e:	2b2000ef          	jal	ra,12e0 <puts>
	int test_ret1 = get_time();
    1032:	5ff000ef          	jal	ra,1e30 <get_time>
	volatile int i = 12500000;	// qemu时钟频率12500000
    1036:	00bec7b7          	lui	a5,0xbec
    103a:	c207879b          	addiw	a5,a5,-992
    103e:	c63e                	sw	a5,12(sp)
	while(i > 0) i--;
    1040:	47b2                	lw	a5,12(sp)
	int test_ret1 = get_time();
    1042:	0005049b          	sext.w	s1,a0
	while(i > 0) i--;
    1046:	2781                	sext.w	a5,a5
    1048:	00f05963          	blez	a5,105a <test_gettimeofday+0x54>
    104c:	47b2                	lw	a5,12(sp)
    104e:	37fd                	addiw	a5,a5,-1
    1050:	c63e                	sw	a5,12(sp)
    1052:	47b2                	lw	a5,12(sp)
    1054:	2781                	sext.w	a5,a5
    1056:	fef04be3          	bgtz	a5,104c <test_gettimeofday+0x46>
	int test_ret2 = get_time();
    105a:	5d7000ef          	jal	ra,1e30 <get_time>
	if(test_ret1 > 0 && test_ret2 > 0){
    105e:	00905663          	blez	s1,106a <test_gettimeofday+0x64>
	int test_ret2 = get_time();
    1062:	0005041b          	sext.w	s0,a0
	if(test_ret1 > 0 && test_ret2 > 0){
    1066:	02804e63          	bgtz	s0,10a2 <test_gettimeofday+0x9c>
		printf("gettimeofday success.\n");
		printf("start:%d, end:%d\n", test_ret1, test_ret2);
                printf("interval: %d\n", test_ret2 - test_ret1);
	}else{
		printf("gettimeofday error.\n");
    106a:	00001517          	auipc	a0,0x1
    106e:	00650513          	addi	a0,a0,6 # 2070 <__clone+0x94>
    1072:	290000ef          	jal	ra,1302 <printf>
	}
	TEST_END(__func__);
    1076:	00001517          	auipc	a0,0x1
    107a:	01250513          	addi	a0,a0,18 # 2088 <__clone+0xac>
    107e:	262000ef          	jal	ra,12e0 <puts>
    1082:	00001517          	auipc	a0,0x1
    1086:	03650513          	addi	a0,a0,54 # 20b8 <__func__.1185>
    108a:	256000ef          	jal	ra,12e0 <puts>
}
    108e:	7402                	ld	s0,32(sp)
    1090:	70a2                	ld	ra,40(sp)
    1092:	64e2                	ld	s1,24(sp)
	TEST_END(__func__);
    1094:	00001517          	auipc	a0,0x1
    1098:	f8c50513          	addi	a0,a0,-116 # 2020 <__clone+0x44>
}
    109c:	6145                	addi	sp,sp,48
	TEST_END(__func__);
    109e:	2420006f          	j	12e0 <puts>
		printf("gettimeofday success.\n");
    10a2:	00001517          	auipc	a0,0x1
    10a6:	f8e50513          	addi	a0,a0,-114 # 2030 <__clone+0x54>
    10aa:	258000ef          	jal	ra,1302 <printf>
		printf("start:%d, end:%d\n", test_ret1, test_ret2);
    10ae:	85a6                	mv	a1,s1
    10b0:	8622                	mv	a2,s0
    10b2:	00001517          	auipc	a0,0x1
    10b6:	f9650513          	addi	a0,a0,-106 # 2048 <__clone+0x6c>
    10ba:	248000ef          	jal	ra,1302 <printf>
                printf("interval: %d\n", test_ret2 - test_ret1);
    10be:	409405bb          	subw	a1,s0,s1
    10c2:	00001517          	auipc	a0,0x1
    10c6:	f9e50513          	addi	a0,a0,-98 # 2060 <__clone+0x84>
    10ca:	238000ef          	jal	ra,1302 <printf>
    10ce:	b765                	j	1076 <test_gettimeofday+0x70>

00000000000010d0 <main>:

int main(void) {
    10d0:	1141                	addi	sp,sp,-16
    10d2:	e406                	sd	ra,8(sp)
	test_gettimeofday();
    10d4:	f33ff0ef          	jal	ra,1006 <test_gettimeofday>
	return 0;
}
    10d8:	60a2                	ld	ra,8(sp)
    10da:	4501                	li	a0,0
    10dc:	0141                	addi	sp,sp,16
    10de:	8082                	ret

00000000000010e0 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10e0:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10e2:	4108                	lw	a0,0(a0)
{
    10e4:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10e6:	05a1                	addi	a1,a1,8
{
    10e8:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ea:	fe7ff0ef          	jal	ra,10d0 <main>
    10ee:	507000ef          	jal	ra,1df4 <exit>
	return 0;
}
    10f2:	60a2                	ld	ra,8(sp)
    10f4:	4501                	li	a0,0
    10f6:	0141                	addi	sp,sp,16
    10f8:	8082                	ret

00000000000010fa <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10fa:	7179                	addi	sp,sp,-48
    10fc:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10fe:	12054e63          	bltz	a0,123a <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    1102:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    1106:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1108:	02b7f6bb          	remuw	a3,a5,a1
    110c:	00001717          	auipc	a4,0x1
    1110:	fc470713          	addi	a4,a4,-60 # 20d0 <digits>
    buf[16] = 0;
    1114:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1118:	1682                	slli	a3,a3,0x20
    111a:	9281                	srli	a3,a3,0x20
    111c:	96ba                	add	a3,a3,a4
    111e:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1122:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1126:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    112a:	16b7e363          	bltu	a5,a1,1290 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    112e:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1132:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1136:	1602                	slli	a2,a2,0x20
    1138:	9201                	srli	a2,a2,0x20
    113a:	963a                	add	a2,a2,a4
    113c:	00064603          	lbu	a2,0(a2)
    1140:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1144:	0007861b          	sext.w	a2,a5
    1148:	12b6e863          	bltu	a3,a1,1278 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    114c:	02b7f6bb          	remuw	a3,a5,a1
    1150:	1682                	slli	a3,a3,0x20
    1152:	9281                	srli	a3,a3,0x20
    1154:	96ba                	add	a3,a3,a4
    1156:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    115a:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    115e:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1162:	10b66e63          	bltu	a2,a1,127e <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1166:	02b876bb          	remuw	a3,a6,a1
    116a:	1682                	slli	a3,a3,0x20
    116c:	9281                	srli	a3,a3,0x20
    116e:	96ba                	add	a3,a3,a4
    1170:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1174:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1178:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    117c:	10b86463          	bltu	a6,a1,1284 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1180:	02b676bb          	remuw	a3,a2,a1
    1184:	1682                	slli	a3,a3,0x20
    1186:	9281                	srli	a3,a3,0x20
    1188:	96ba                	add	a3,a3,a4
    118a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    118e:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1192:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1196:	0eb66a63          	bltu	a2,a1,128a <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    119a:	02b876bb          	remuw	a3,a6,a1
    119e:	1682                	slli	a3,a3,0x20
    11a0:	9281                	srli	a3,a3,0x20
    11a2:	96ba                	add	a3,a3,a4
    11a4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a8:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11ac:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11b0:	0cb86163          	bltu	a6,a1,1272 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    11b4:	02b676bb          	remuw	a3,a2,a1
    11b8:	1682                	slli	a3,a3,0x20
    11ba:	9281                	srli	a3,a3,0x20
    11bc:	96ba                	add	a3,a3,a4
    11be:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c2:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11c6:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11ca:	0cb66563          	bltu	a2,a1,1294 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11ce:	02b876bb          	remuw	a3,a6,a1
    11d2:	1682                	slli	a3,a3,0x20
    11d4:	9281                	srli	a3,a3,0x20
    11d6:	96ba                	add	a3,a3,a4
    11d8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11dc:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11e0:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11e4:	0ab86b63          	bltu	a6,a1,129a <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11e8:	02b676bb          	remuw	a3,a2,a1
    11ec:	1682                	slli	a3,a3,0x20
    11ee:	9281                	srli	a3,a3,0x20
    11f0:	96ba                	add	a3,a3,a4
    11f2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11f6:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11fa:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11fe:	0ab66163          	bltu	a2,a1,12a0 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    1202:	1782                	slli	a5,a5,0x20
    1204:	9381                	srli	a5,a5,0x20
    1206:	97ba                	add	a5,a5,a4
    1208:	0007c703          	lbu	a4,0(a5) # bec000 <digits+0xbe9f30>
    120c:	4599                	li	a1,6
    120e:	4795                	li	a5,5
    1210:	00e10723          	sb	a4,14(sp)

    if (sign)
    1214:	00055963          	bgez	a0,1226 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1218:	1018                	addi	a4,sp,32
    121a:	973e                	add	a4,a4,a5
    121c:	02d00693          	li	a3,45
    1220:	fed70423          	sb	a3,-24(a4)
    1224:	85be                	mv	a1,a5
    write(f, s, l);
    1226:	003c                	addi	a5,sp,8
    1228:	4641                	li	a2,16
    122a:	9e0d                	subw	a2,a2,a1
    122c:	4505                	li	a0,1
    122e:	95be                	add	a1,a1,a5
    1230:	373000ef          	jal	ra,1da2 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1234:	70a2                	ld	ra,40(sp)
    1236:	6145                	addi	sp,sp,48
    1238:	8082                	ret
        x = -xx;
    123a:	40a0063b          	negw	a2,a0
    123e:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1240:	02b677bb          	remuw	a5,a2,a1
    1244:	00001717          	auipc	a4,0x1
    1248:	e8c70713          	addi	a4,a4,-372 # 20d0 <digits>
    buf[16] = 0;
    124c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1250:	1782                	slli	a5,a5,0x20
    1252:	9381                	srli	a5,a5,0x20
    1254:	97ba                	add	a5,a5,a4
    1256:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    125a:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    125e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1262:	ecb676e3          	bleu	a1,a2,112e <printint.constprop.0+0x34>
        buf[i--] = '-';
    1266:	02d00793          	li	a5,45
    126a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    126e:	45b9                	li	a1,14
    1270:	bf5d                	j	1226 <printint.constprop.0+0x12c>
    1272:	47a5                	li	a5,9
    1274:	45a9                	li	a1,10
    1276:	bf79                	j	1214 <printint.constprop.0+0x11a>
    1278:	47b5                	li	a5,13
    127a:	45b9                	li	a1,14
    127c:	bf61                	j	1214 <printint.constprop.0+0x11a>
    127e:	47b1                	li	a5,12
    1280:	45b5                	li	a1,13
    1282:	bf49                	j	1214 <printint.constprop.0+0x11a>
    1284:	47ad                	li	a5,11
    1286:	45b1                	li	a1,12
    1288:	b771                	j	1214 <printint.constprop.0+0x11a>
    128a:	47a9                	li	a5,10
    128c:	45ad                	li	a1,11
    128e:	b759                	j	1214 <printint.constprop.0+0x11a>
    i = 15;
    1290:	45bd                	li	a1,15
    1292:	bf51                	j	1226 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1294:	47a1                	li	a5,8
    1296:	45a5                	li	a1,9
    1298:	bfb5                	j	1214 <printint.constprop.0+0x11a>
    129a:	479d                	li	a5,7
    129c:	45a1                	li	a1,8
    129e:	bf9d                	j	1214 <printint.constprop.0+0x11a>
    12a0:	4799                	li	a5,6
    12a2:	459d                	li	a1,7
    12a4:	bf85                	j	1214 <printint.constprop.0+0x11a>

00000000000012a6 <getchar>:
{
    12a6:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12a8:	00f10593          	addi	a1,sp,15
    12ac:	4605                	li	a2,1
    12ae:	4501                	li	a0,0
{
    12b0:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12b2:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12b6:	2e3000ef          	jal	ra,1d98 <read>
}
    12ba:	60e2                	ld	ra,24(sp)
    12bc:	00f14503          	lbu	a0,15(sp)
    12c0:	6105                	addi	sp,sp,32
    12c2:	8082                	ret

00000000000012c4 <putchar>:
{
    12c4:	1101                	addi	sp,sp,-32
    char byte = c;
    12c6:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12ca:	00f10593          	addi	a1,sp,15
    12ce:	4605                	li	a2,1
    12d0:	4505                	li	a0,1
{
    12d2:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12d4:	2cf000ef          	jal	ra,1da2 <write>
}
    12d8:	60e2                	ld	ra,24(sp)
    12da:	2501                	sext.w	a0,a0
    12dc:	6105                	addi	sp,sp,32
    12de:	8082                	ret

00000000000012e0 <puts>:
{
    12e0:	1141                	addi	sp,sp,-16
    12e2:	e406                	sd	ra,8(sp)
    12e4:	e022                	sd	s0,0(sp)
    12e6:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12e8:	59e000ef          	jal	ra,1886 <strlen>
    12ec:	862a                	mv	a2,a0
    12ee:	85a2                	mv	a1,s0
    12f0:	4505                	li	a0,1
    12f2:	2b1000ef          	jal	ra,1da2 <write>
}
    12f6:	60a2                	ld	ra,8(sp)
    12f8:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12fa:	957d                	srai	a0,a0,0x3f
    return r;
    12fc:	2501                	sext.w	a0,a0
}
    12fe:	0141                	addi	sp,sp,16
    1300:	8082                	ret

0000000000001302 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1302:	7131                	addi	sp,sp,-192
    1304:	e0da                	sd	s6,64(sp)
    1306:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1308:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    130a:	013c                	addi	a5,sp,136
{
    130c:	f0ca                	sd	s2,96(sp)
    130e:	ecce                	sd	s3,88(sp)
    1310:	e8d2                	sd	s4,80(sp)
    1312:	e4d6                	sd	s5,72(sp)
    1314:	fc5e                	sd	s7,56(sp)
    1316:	fc86                	sd	ra,120(sp)
    1318:	f8a2                	sd	s0,112(sp)
    131a:	f4a6                	sd	s1,104(sp)
    131c:	89aa                	mv	s3,a0
    131e:	e52e                	sd	a1,136(sp)
    1320:	e932                	sd	a2,144(sp)
    1322:	ed36                	sd	a3,152(sp)
    1324:	f13a                	sd	a4,160(sp)
    1326:	f942                	sd	a6,176(sp)
    1328:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    132a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    132c:	02500913          	li	s2,37
    1330:	07000a93          	li	s5,112
    buf[i++] = '0';
    1334:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1338:	00001a17          	auipc	s4,0x1
    133c:	d98a0a13          	addi	s4,s4,-616 # 20d0 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1340:	00001b97          	auipc	s7,0x1
    1344:	d58b8b93          	addi	s7,s7,-680 # 2098 <__clone+0xbc>
        if (!*s)
    1348:	0009c783          	lbu	a5,0(s3)
    134c:	cfb9                	beqz	a5,13aa <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    134e:	23278d63          	beq	a5,s2,1588 <printf+0x286>
    1352:	864e                	mv	a2,s3
    1354:	a019                	j	135a <printf+0x58>
    1356:	07278563          	beq	a5,s2,13c0 <printf+0xbe>
    135a:	0605                	addi	a2,a2,1
    135c:	00064783          	lbu	a5,0(a2)
    1360:	fbfd                	bnez	a5,1356 <printf+0x54>
    1362:	84b2                	mv	s1,a2
        l = z - a;
    1364:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1368:	8622                	mv	a2,s0
    136a:	85ce                	mv	a1,s3
    136c:	4505                	li	a0,1
    136e:	235000ef          	jal	ra,1da2 <write>
        if (l)
    1372:	ec3d                	bnez	s0,13f0 <printf+0xee>
        if (s[1] == 0)
    1374:	0014c783          	lbu	a5,1(s1)
    1378:	cb8d                	beqz	a5,13aa <printf+0xa8>
        switch (s[1])
    137a:	09578b63          	beq	a5,s5,1410 <printf+0x10e>
    137e:	06fafb63          	bleu	a5,s5,13f4 <printf+0xf2>
    1382:	07300713          	li	a4,115
    1386:	1ce78e63          	beq	a5,a4,1562 <printf+0x260>
    138a:	07800713          	li	a4,120
    138e:	1ae79563          	bne	a5,a4,1538 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1392:	6782                	ld	a5,0(sp)
    1394:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1396:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    139a:	4388                	lw	a0,0(a5)
    139c:	07a1                	addi	a5,a5,8
    139e:	e03e                	sd	a5,0(sp)
    13a0:	d5bff0ef          	jal	ra,10fa <printint.constprop.0>
        if (!*s)
    13a4:	0009c783          	lbu	a5,0(s3)
    13a8:	f3dd                	bnez	a5,134e <printf+0x4c>
    }
    va_end(ap);
}
    13aa:	70e6                	ld	ra,120(sp)
    13ac:	7446                	ld	s0,112(sp)
    13ae:	74a6                	ld	s1,104(sp)
    13b0:	7906                	ld	s2,96(sp)
    13b2:	69e6                	ld	s3,88(sp)
    13b4:	6a46                	ld	s4,80(sp)
    13b6:	6aa6                	ld	s5,72(sp)
    13b8:	6b06                	ld	s6,64(sp)
    13ba:	7be2                	ld	s7,56(sp)
    13bc:	6129                	addi	sp,sp,192
    13be:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13c0:	00164783          	lbu	a5,1(a2)
    13c4:	84b2                	mv	s1,a2
    13c6:	01278763          	beq	a5,s2,13d4 <printf+0xd2>
    13ca:	bf69                	j	1364 <printf+0x62>
    13cc:	0014c783          	lbu	a5,1(s1)
    13d0:	f9279ae3          	bne	a5,s2,1364 <printf+0x62>
    13d4:	0489                	addi	s1,s1,2
    13d6:	0004c783          	lbu	a5,0(s1)
    13da:	0605                	addi	a2,a2,1
    13dc:	ff2788e3          	beq	a5,s2,13cc <printf+0xca>
        l = z - a;
    13e0:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13e4:	8622                	mv	a2,s0
    13e6:	85ce                	mv	a1,s3
    13e8:	4505                	li	a0,1
    13ea:	1b9000ef          	jal	ra,1da2 <write>
        if (l)
    13ee:	d059                	beqz	s0,1374 <printf+0x72>
    13f0:	89a6                	mv	s3,s1
    13f2:	bf99                	j	1348 <printf+0x46>
    13f4:	06400713          	li	a4,100
    13f8:	14e79063          	bne	a5,a4,1538 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13fc:	6782                	ld	a5,0(sp)
    13fe:	45a9                	li	a1,10
        s += 2;
    1400:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    1404:	4388                	lw	a0,0(a5)
    1406:	07a1                	addi	a5,a5,8
    1408:	e03e                	sd	a5,0(sp)
    140a:	cf1ff0ef          	jal	ra,10fa <printint.constprop.0>
        s += 2;
    140e:	bf59                	j	13a4 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    1410:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1412:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1416:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1418:	631c                	ld	a5,0(a4)
    141a:	0721                	addi	a4,a4,8
    141c:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    141e:	00479293          	slli	t0,a5,0x4
    1422:	00879f93          	slli	t6,a5,0x8
    1426:	00c79f13          	slli	t5,a5,0xc
    142a:	01079e93          	slli	t4,a5,0x10
    142e:	01479e13          	slli	t3,a5,0x14
    1432:	01879313          	slli	t1,a5,0x18
    1436:	01c79893          	slli	a7,a5,0x1c
    143a:	02479813          	slli	a6,a5,0x24
    143e:	02879513          	slli	a0,a5,0x28
    1442:	02c79593          	slli	a1,a5,0x2c
    1446:	03079693          	slli	a3,a5,0x30
    144a:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    144e:	03c7d413          	srli	s0,a5,0x3c
    1452:	01c7d39b          	srliw	t2,a5,0x1c
    1456:	03c2d293          	srli	t0,t0,0x3c
    145a:	03cfdf93          	srli	t6,t6,0x3c
    145e:	03cf5f13          	srli	t5,t5,0x3c
    1462:	03cede93          	srli	t4,t4,0x3c
    1466:	03ce5e13          	srli	t3,t3,0x3c
    146a:	03c35313          	srli	t1,t1,0x3c
    146e:	03c8d893          	srli	a7,a7,0x3c
    1472:	03c85813          	srli	a6,a6,0x3c
    1476:	9171                	srli	a0,a0,0x3c
    1478:	91f1                	srli	a1,a1,0x3c
    147a:	92f1                	srli	a3,a3,0x3c
    147c:	9371                	srli	a4,a4,0x3c
    147e:	96d2                	add	a3,a3,s4
    1480:	9752                	add	a4,a4,s4
    1482:	9452                	add	s0,s0,s4
    1484:	92d2                	add	t0,t0,s4
    1486:	9fd2                	add	t6,t6,s4
    1488:	9f52                	add	t5,t5,s4
    148a:	9ed2                	add	t4,t4,s4
    148c:	9e52                	add	t3,t3,s4
    148e:	9352                	add	t1,t1,s4
    1490:	98d2                	add	a7,a7,s4
    1492:	93d2                	add	t2,t2,s4
    1494:	9852                	add	a6,a6,s4
    1496:	9552                	add	a0,a0,s4
    1498:	95d2                	add	a1,a1,s4
    149a:	0006c983          	lbu	s3,0(a3)
    149e:	0002c283          	lbu	t0,0(t0)
    14a2:	00074683          	lbu	a3,0(a4)
    14a6:	000fcf83          	lbu	t6,0(t6)
    14aa:	000f4f03          	lbu	t5,0(t5)
    14ae:	000ece83          	lbu	t4,0(t4)
    14b2:	000e4e03          	lbu	t3,0(t3)
    14b6:	00034303          	lbu	t1,0(t1)
    14ba:	0008c883          	lbu	a7,0(a7)
    14be:	0003c383          	lbu	t2,0(t2)
    14c2:	00084803          	lbu	a6,0(a6)
    14c6:	00054503          	lbu	a0,0(a0)
    14ca:	0005c583          	lbu	a1,0(a1)
    14ce:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14d2:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14d6:	9371                	srli	a4,a4,0x3c
    14d8:	8bbd                	andi	a5,a5,15
    14da:	9752                	add	a4,a4,s4
    14dc:	97d2                	add	a5,a5,s4
    14de:	005105a3          	sb	t0,11(sp)
    14e2:	01f10623          	sb	t6,12(sp)
    14e6:	01e106a3          	sb	t5,13(sp)
    14ea:	01d10723          	sb	t4,14(sp)
    14ee:	01c107a3          	sb	t3,15(sp)
    14f2:	00610823          	sb	t1,16(sp)
    14f6:	011108a3          	sb	a7,17(sp)
    14fa:	00710923          	sb	t2,18(sp)
    14fe:	010109a3          	sb	a6,19(sp)
    1502:	00a10a23          	sb	a0,20(sp)
    1506:	00b10aa3          	sb	a1,21(sp)
    150a:	01310b23          	sb	s3,22(sp)
    150e:	00d10ba3          	sb	a3,23(sp)
    1512:	00810523          	sb	s0,10(sp)
    1516:	00074703          	lbu	a4,0(a4)
    151a:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    151e:	002c                	addi	a1,sp,8
    1520:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1522:	00e10c23          	sb	a4,24(sp)
    1526:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    152a:	00010d23          	sb	zero,26(sp)
        s += 2;
    152e:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1532:	071000ef          	jal	ra,1da2 <write>
        s += 2;
    1536:	b5bd                	j	13a4 <printf+0xa2>
    char byte = c;
    1538:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    153c:	4605                	li	a2,1
    153e:	002c                	addi	a1,sp,8
    1540:	4505                	li	a0,1
    char byte = c;
    1542:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1546:	05d000ef          	jal	ra,1da2 <write>
    char byte = c;
    154a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    154e:	4605                	li	a2,1
    1550:	002c                	addi	a1,sp,8
    1552:	4505                	li	a0,1
    char byte = c;
    1554:	00f10423          	sb	a5,8(sp)
        s += 2;
    1558:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    155c:	047000ef          	jal	ra,1da2 <write>
        s += 2;
    1560:	b591                	j	13a4 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1562:	6782                	ld	a5,0(sp)
    1564:	6380                	ld	s0,0(a5)
    1566:	07a1                	addi	a5,a5,8
    1568:	e03e                	sd	a5,0(sp)
    156a:	cc05                	beqz	s0,15a2 <printf+0x2a0>
            l = strnlen(a, 200);
    156c:	0c800593          	li	a1,200
    1570:	8522                	mv	a0,s0
    1572:	446000ef          	jal	ra,19b8 <strnlen>
    write(f, s, l);
    1576:	0005061b          	sext.w	a2,a0
    157a:	85a2                	mv	a1,s0
    157c:	4505                	li	a0,1
    157e:	025000ef          	jal	ra,1da2 <write>
        s += 2;
    1582:	00248993          	addi	s3,s1,2
    1586:	bd39                	j	13a4 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1588:	0019c783          	lbu	a5,1(s3)
    158c:	84ce                	mv	s1,s3
    158e:	864e                	mv	a2,s3
    1590:	e52782e3          	beq	a5,s2,13d4 <printf+0xd2>
    write(f, s, l);
    1594:	4601                	li	a2,0
    1596:	85ce                	mv	a1,s3
    1598:	4505                	li	a0,1
    159a:	009000ef          	jal	ra,1da2 <write>
    159e:	84ce                	mv	s1,s3
    15a0:	bbd1                	j	1374 <printf+0x72>
                a = "(null)";
    15a2:	845e                	mv	s0,s7
    15a4:	b7e1                	j	156c <printf+0x26a>

00000000000015a6 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a6:	02000793          	li	a5,32
    15aa:	00f50663          	beq	a0,a5,15b6 <isspace+0x10>
    15ae:	355d                	addiw	a0,a0,-9
    15b0:	00553513          	sltiu	a0,a0,5
    15b4:	8082                	ret
    15b6:	4505                	li	a0,1
}
    15b8:	8082                	ret

00000000000015ba <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ba:	fd05051b          	addiw	a0,a0,-48
}
    15be:	00a53513          	sltiu	a0,a0,10
    15c2:	8082                	ret

00000000000015c4 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c4:	02000613          	li	a2,32
    15c8:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ca:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ce:	0007079b          	sext.w	a5,a4
    15d2:	ff77869b          	addiw	a3,a5,-9
    15d6:	04c70b63          	beq	a4,a2,162c <atoi+0x68>
    15da:	04d5f963          	bleu	a3,a1,162c <atoi+0x68>
        s++;
    switch (*s)
    15de:	02b00693          	li	a3,43
    15e2:	04d70a63          	beq	a4,a3,1636 <atoi+0x72>
    15e6:	02d00693          	li	a3,45
    15ea:	06d70463          	beq	a4,a3,1652 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15ee:	fd07859b          	addiw	a1,a5,-48
    15f2:	4625                	li	a2,9
    15f4:	873e                	mv	a4,a5
    15f6:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15f8:	4e01                	li	t3,0
    while (isdigit(*s))
    15fa:	04b66a63          	bltu	a2,a1,164e <atoi+0x8a>
    int n = 0, neg = 0;
    15fe:	4501                	li	a0,0
    while (isdigit(*s))
    1600:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    1602:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    1604:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    1608:	0025179b          	slliw	a5,a0,0x2
    160c:	9d3d                	addw	a0,a0,a5
    160e:	fd07031b          	addiw	t1,a4,-48
    1612:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1616:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    161a:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    161e:	0006071b          	sext.w	a4,a2
    1622:	feb870e3          	bleu	a1,a6,1602 <atoi+0x3e>
    return neg ? n : -n;
    1626:	000e0563          	beqz	t3,1630 <atoi+0x6c>
}
    162a:	8082                	ret
        s++;
    162c:	0505                	addi	a0,a0,1
    162e:	bf71                	j	15ca <atoi+0x6>
    1630:	4113053b          	subw	a0,t1,a7
    1634:	8082                	ret
    while (isdigit(*s))
    1636:	00154783          	lbu	a5,1(a0)
    163a:	4625                	li	a2,9
        s++;
    163c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1640:	fd07859b          	addiw	a1,a5,-48
    1644:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1648:	4e01                	li	t3,0
    while (isdigit(*s))
    164a:	fab67ae3          	bleu	a1,a2,15fe <atoi+0x3a>
    164e:	4501                	li	a0,0
}
    1650:	8082                	ret
    while (isdigit(*s))
    1652:	00154783          	lbu	a5,1(a0)
    1656:	4625                	li	a2,9
        s++;
    1658:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    165c:	fd07859b          	addiw	a1,a5,-48
    1660:	0007871b          	sext.w	a4,a5
    1664:	feb665e3          	bltu	a2,a1,164e <atoi+0x8a>
        neg = 1;
    1668:	4e05                	li	t3,1
    166a:	bf51                	j	15fe <atoi+0x3a>

000000000000166c <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    166c:	16060d63          	beqz	a2,17e6 <memset+0x17a>
    1670:	40a007b3          	neg	a5,a0
    1674:	8b9d                	andi	a5,a5,7
    1676:	00778713          	addi	a4,a5,7
    167a:	482d                	li	a6,11
    167c:	0ff5f593          	andi	a1,a1,255
    1680:	fff60693          	addi	a3,a2,-1
    1684:	17076263          	bltu	a4,a6,17e8 <memset+0x17c>
    1688:	16e6ea63          	bltu	a3,a4,17fc <memset+0x190>
    168c:	16078563          	beqz	a5,17f6 <memset+0x18a>
    1690:	00b50023          	sb	a1,0(a0)
    1694:	4705                	li	a4,1
    1696:	00150e93          	addi	t4,a0,1
    169a:	14e78c63          	beq	a5,a4,17f2 <memset+0x186>
    169e:	00b500a3          	sb	a1,1(a0)
    16a2:	4709                	li	a4,2
    16a4:	00250e93          	addi	t4,a0,2
    16a8:	14e78d63          	beq	a5,a4,1802 <memset+0x196>
    16ac:	00b50123          	sb	a1,2(a0)
    16b0:	470d                	li	a4,3
    16b2:	00350e93          	addi	t4,a0,3
    16b6:	12e78b63          	beq	a5,a4,17ec <memset+0x180>
    16ba:	00b501a3          	sb	a1,3(a0)
    16be:	4711                	li	a4,4
    16c0:	00450e93          	addi	t4,a0,4
    16c4:	14e78163          	beq	a5,a4,1806 <memset+0x19a>
    16c8:	00b50223          	sb	a1,4(a0)
    16cc:	4715                	li	a4,5
    16ce:	00550e93          	addi	t4,a0,5
    16d2:	12e78c63          	beq	a5,a4,180a <memset+0x19e>
    16d6:	00b502a3          	sb	a1,5(a0)
    16da:	471d                	li	a4,7
    16dc:	00650e93          	addi	t4,a0,6
    16e0:	12e79763          	bne	a5,a4,180e <memset+0x1a2>
    16e4:	00750e93          	addi	t4,a0,7
    16e8:	00b50323          	sb	a1,6(a0)
    16ec:	4f1d                	li	t5,7
    16ee:	00859713          	slli	a4,a1,0x8
    16f2:	8f4d                	or	a4,a4,a1
    16f4:	01059e13          	slli	t3,a1,0x10
    16f8:	01c76e33          	or	t3,a4,t3
    16fc:	01859313          	slli	t1,a1,0x18
    1700:	006e6333          	or	t1,t3,t1
    1704:	02059893          	slli	a7,a1,0x20
    1708:	011368b3          	or	a7,t1,a7
    170c:	02859813          	slli	a6,a1,0x28
    1710:	40f60333          	sub	t1,a2,a5
    1714:	0108e833          	or	a6,a7,a6
    1718:	03059693          	slli	a3,a1,0x30
    171c:	00d866b3          	or	a3,a6,a3
    1720:	03859713          	slli	a4,a1,0x38
    1724:	97aa                	add	a5,a5,a0
    1726:	ff837813          	andi	a6,t1,-8
    172a:	8f55                	or	a4,a4,a3
    172c:	00f806b3          	add	a3,a6,a5
    1730:	e398                	sd	a4,0(a5)
    1732:	07a1                	addi	a5,a5,8
    1734:	fed79ee3          	bne	a5,a3,1730 <memset+0xc4>
    1738:	ff837693          	andi	a3,t1,-8
    173c:	00de87b3          	add	a5,t4,a3
    1740:	01e6873b          	addw	a4,a3,t5
    1744:	0ad30663          	beq	t1,a3,17f0 <memset+0x184>
    1748:	00b78023          	sb	a1,0(a5)
    174c:	0017069b          	addiw	a3,a4,1
    1750:	08c6fb63          	bleu	a2,a3,17e6 <memset+0x17a>
    1754:	00b780a3          	sb	a1,1(a5)
    1758:	0027069b          	addiw	a3,a4,2
    175c:	08c6f563          	bleu	a2,a3,17e6 <memset+0x17a>
    1760:	00b78123          	sb	a1,2(a5)
    1764:	0037069b          	addiw	a3,a4,3
    1768:	06c6ff63          	bleu	a2,a3,17e6 <memset+0x17a>
    176c:	00b781a3          	sb	a1,3(a5)
    1770:	0047069b          	addiw	a3,a4,4
    1774:	06c6f963          	bleu	a2,a3,17e6 <memset+0x17a>
    1778:	00b78223          	sb	a1,4(a5)
    177c:	0057069b          	addiw	a3,a4,5
    1780:	06c6f363          	bleu	a2,a3,17e6 <memset+0x17a>
    1784:	00b782a3          	sb	a1,5(a5)
    1788:	0067069b          	addiw	a3,a4,6
    178c:	04c6fd63          	bleu	a2,a3,17e6 <memset+0x17a>
    1790:	00b78323          	sb	a1,6(a5)
    1794:	0077069b          	addiw	a3,a4,7
    1798:	04c6f763          	bleu	a2,a3,17e6 <memset+0x17a>
    179c:	00b783a3          	sb	a1,7(a5)
    17a0:	0087069b          	addiw	a3,a4,8
    17a4:	04c6f163          	bleu	a2,a3,17e6 <memset+0x17a>
    17a8:	00b78423          	sb	a1,8(a5)
    17ac:	0097069b          	addiw	a3,a4,9
    17b0:	02c6fb63          	bleu	a2,a3,17e6 <memset+0x17a>
    17b4:	00b784a3          	sb	a1,9(a5)
    17b8:	00a7069b          	addiw	a3,a4,10
    17bc:	02c6f563          	bleu	a2,a3,17e6 <memset+0x17a>
    17c0:	00b78523          	sb	a1,10(a5)
    17c4:	00b7069b          	addiw	a3,a4,11
    17c8:	00c6ff63          	bleu	a2,a3,17e6 <memset+0x17a>
    17cc:	00b785a3          	sb	a1,11(a5)
    17d0:	00c7069b          	addiw	a3,a4,12
    17d4:	00c6f963          	bleu	a2,a3,17e6 <memset+0x17a>
    17d8:	00b78623          	sb	a1,12(a5)
    17dc:	2735                	addiw	a4,a4,13
    17de:	00c77463          	bleu	a2,a4,17e6 <memset+0x17a>
    17e2:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17e6:	8082                	ret
    17e8:	472d                	li	a4,11
    17ea:	bd79                	j	1688 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ec:	4f0d                	li	t5,3
    17ee:	b701                	j	16ee <memset+0x82>
    17f0:	8082                	ret
    17f2:	4f05                	li	t5,1
    17f4:	bded                	j	16ee <memset+0x82>
    17f6:	8eaa                	mv	t4,a0
    17f8:	4f01                	li	t5,0
    17fa:	bdd5                	j	16ee <memset+0x82>
    17fc:	87aa                	mv	a5,a0
    17fe:	4701                	li	a4,0
    1800:	b7a1                	j	1748 <memset+0xdc>
    1802:	4f09                	li	t5,2
    1804:	b5ed                	j	16ee <memset+0x82>
    1806:	4f11                	li	t5,4
    1808:	b5dd                	j	16ee <memset+0x82>
    180a:	4f15                	li	t5,5
    180c:	b5cd                	j	16ee <memset+0x82>
    180e:	4f19                	li	t5,6
    1810:	bdf9                	j	16ee <memset+0x82>

0000000000001812 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1812:	00054703          	lbu	a4,0(a0)
    1816:	0005c783          	lbu	a5,0(a1)
    181a:	00e79b63          	bne	a5,a4,1830 <strcmp+0x1e>
    181e:	cf89                	beqz	a5,1838 <strcmp+0x26>
    1820:	0505                	addi	a0,a0,1
    1822:	0585                	addi	a1,a1,1
    1824:	0005c783          	lbu	a5,0(a1)
    1828:	00054703          	lbu	a4,0(a0)
    182c:	fef709e3          	beq	a4,a5,181e <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1830:	0007051b          	sext.w	a0,a4
}
    1834:	9d1d                	subw	a0,a0,a5
    1836:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1838:	4501                	li	a0,0
}
    183a:	9d1d                	subw	a0,a0,a5
    183c:	8082                	ret

000000000000183e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    183e:	c231                	beqz	a2,1882 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1840:	00054783          	lbu	a5,0(a0)
    1844:	0005c683          	lbu	a3,0(a1)
    1848:	c795                	beqz	a5,1874 <strncmp+0x36>
    184a:	ca85                	beqz	a3,187a <strncmp+0x3c>
    if (!n--)
    184c:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    184e:	c615                	beqz	a2,187a <strncmp+0x3c>
    1850:	00150713          	addi	a4,a0,1
    1854:	9532                	add	a0,a0,a2
    1856:	00d78963          	beq	a5,a3,1868 <strncmp+0x2a>
    185a:	a005                	j	187a <strncmp+0x3c>
    185c:	ce99                	beqz	a3,187a <strncmp+0x3c>
    185e:	00e50e63          	beq	a0,a4,187a <strncmp+0x3c>
    1862:	0705                	addi	a4,a4,1
    1864:	00d79b63          	bne	a5,a3,187a <strncmp+0x3c>
    1868:	00074783          	lbu	a5,0(a4)
    186c:	0585                	addi	a1,a1,1
    186e:	0005c683          	lbu	a3,0(a1)
    1872:	f7ed                	bnez	a5,185c <strncmp+0x1e>
    1874:	4501                	li	a0,0
        ;
    return *l - *r;
    1876:	9d15                	subw	a0,a0,a3
    1878:	8082                	ret
    187a:	0007851b          	sext.w	a0,a5
    187e:	9d15                	subw	a0,a0,a3
    1880:	8082                	ret
        return 0;
    1882:	4501                	li	a0,0
}
    1884:	8082                	ret

0000000000001886 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1886:	00757793          	andi	a5,a0,7
    188a:	cfa1                	beqz	a5,18e2 <strlen+0x5c>
        if (!*s)
    188c:	00054783          	lbu	a5,0(a0)
    1890:	cbb9                	beqz	a5,18e6 <strlen+0x60>
    1892:	87aa                	mv	a5,a0
    1894:	a021                	j	189c <strlen+0x16>
    1896:	0007c703          	lbu	a4,0(a5)
    189a:	c329                	beqz	a4,18dc <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    189c:	0785                	addi	a5,a5,1
    189e:	0077f713          	andi	a4,a5,7
    18a2:	fb75                	bnez	a4,1896 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18a4:	00000717          	auipc	a4,0x0
    18a8:	7fc70713          	addi	a4,a4,2044 # 20a0 <__clone+0xc4>
    18ac:	630c                	ld	a1,0(a4)
    18ae:	00000717          	auipc	a4,0x0
    18b2:	7fa70713          	addi	a4,a4,2042 # 20a8 <__clone+0xcc>
    18b6:	6394                	ld	a3,0(a5)
    18b8:	6310                	ld	a2,0(a4)
    18ba:	a019                	j	18c0 <strlen+0x3a>
    18bc:	07a1                	addi	a5,a5,8
    18be:	6394                	ld	a3,0(a5)
    18c0:	00b68733          	add	a4,a3,a1
    18c4:	fff6c693          	not	a3,a3
    18c8:	8f75                	and	a4,a4,a3
    18ca:	8f71                	and	a4,a4,a2
    18cc:	db65                	beqz	a4,18bc <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18ce:	0007c703          	lbu	a4,0(a5)
    18d2:	c709                	beqz	a4,18dc <strlen+0x56>
    18d4:	0785                	addi	a5,a5,1
    18d6:	0007c703          	lbu	a4,0(a5)
    18da:	ff6d                	bnez	a4,18d4 <strlen+0x4e>
        ;
    return s - a;
    18dc:	40a78533          	sub	a0,a5,a0
}
    18e0:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18e2:	87aa                	mv	a5,a0
    18e4:	b7c1                	j	18a4 <strlen+0x1e>
        if (!*s)
    18e6:	4501                	li	a0,0
            return s - a;
    18e8:	8082                	ret

00000000000018ea <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ea:	00757793          	andi	a5,a0,7
    18ee:	0ff5f593          	andi	a1,a1,255
    18f2:	cb99                	beqz	a5,1908 <memchr+0x1e>
    18f4:	c655                	beqz	a2,19a0 <memchr+0xb6>
    18f6:	00054783          	lbu	a5,0(a0)
    18fa:	0ab78663          	beq	a5,a1,19a6 <memchr+0xbc>
    18fe:	0505                	addi	a0,a0,1
    1900:	00757793          	andi	a5,a0,7
    1904:	167d                	addi	a2,a2,-1
    1906:	f7fd                	bnez	a5,18f4 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1908:	4701                	li	a4,0
    if (n && *s != c)
    190a:	ca49                	beqz	a2,199c <memchr+0xb2>
    190c:	00054783          	lbu	a5,0(a0)
    1910:	08b78b63          	beq	a5,a1,19a6 <memchr+0xbc>
        size_t k = ONES * c;
    1914:	00000797          	auipc	a5,0x0
    1918:	79c78793          	addi	a5,a5,1948 # 20b0 <__clone+0xd4>
    191c:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    191e:	479d                	li	a5,7
        size_t k = ONES * c;
    1920:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1924:	08c7f863          	bleu	a2,a5,19b4 <memchr+0xca>
    1928:	611c                	ld	a5,0(a0)
    192a:	00000317          	auipc	t1,0x0
    192e:	77e30313          	addi	t1,t1,1918 # 20a8 <__clone+0xcc>
    1932:	00033803          	ld	a6,0(t1)
    1936:	00f8c7b3          	xor	a5,a7,a5
    193a:	fff7c713          	not	a4,a5
    193e:	8f95                	sub	a5,a5,a3
    1940:	8ff9                	and	a5,a5,a4
    1942:	0107f7b3          	and	a5,a5,a6
    1946:	e7bd                	bnez	a5,19b4 <memchr+0xca>
    1948:	4e1d                	li	t3,7
    194a:	00000e97          	auipc	t4,0x0
    194e:	756e8e93          	addi	t4,t4,1878 # 20a0 <__clone+0xc4>
    1952:	a005                	j	1972 <memchr+0x88>
    1954:	6514                	ld	a3,8(a0)
    1956:	000eb783          	ld	a5,0(t4)
    195a:	00033803          	ld	a6,0(t1)
    195e:	00d8c6b3          	xor	a3,a7,a3
    1962:	97b6                	add	a5,a5,a3
    1964:	fff6c693          	not	a3,a3
    1968:	8ff5                	and	a5,a5,a3
    196a:	0107f7b3          	and	a5,a5,a6
    196e:	e3a1                	bnez	a5,19ae <memchr+0xc4>
    1970:	853a                	mv	a0,a4
    1972:	1661                	addi	a2,a2,-8
    1974:	00850713          	addi	a4,a0,8
    1978:	fcce6ee3          	bltu	t3,a2,1954 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    197c:	c215                	beqz	a2,19a0 <memchr+0xb6>
    197e:	00074783          	lbu	a5,0(a4)
    1982:	00f58d63          	beq	a1,a5,199c <memchr+0xb2>
    1986:	00170793          	addi	a5,a4,1
    198a:	963a                	add	a2,a2,a4
    198c:	873e                	mv	a4,a5
    198e:	00f60963          	beq	a2,a5,19a0 <memchr+0xb6>
    1992:	0007c683          	lbu	a3,0(a5)
    1996:	0785                	addi	a5,a5,1
    1998:	feb69ae3          	bne	a3,a1,198c <memchr+0xa2>
}
    199c:	853a                	mv	a0,a4
    199e:	8082                	ret
    return n ? (void *)s : 0;
    19a0:	4701                	li	a4,0
}
    19a2:	853a                	mv	a0,a4
    19a4:	8082                	ret
    19a6:	872a                	mv	a4,a0
    19a8:	00074783          	lbu	a5,0(a4)
    19ac:	bfd9                	j	1982 <memchr+0x98>
    19ae:	00854783          	lbu	a5,8(a0)
    19b2:	bfc1                	j	1982 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19b4:	872a                	mv	a4,a0
    19b6:	bfc1                	j	1986 <memchr+0x9c>

00000000000019b8 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19b8:	00757793          	andi	a5,a0,7
    19bc:	cfc5                	beqz	a5,1a74 <strnlen+0xbc>
    19be:	c1c5                	beqz	a1,1a5e <strnlen+0xa6>
    19c0:	00054783          	lbu	a5,0(a0)
    19c4:	cfd9                	beqz	a5,1a62 <strnlen+0xaa>
    19c6:	87ae                	mv	a5,a1
    19c8:	86aa                	mv	a3,a0
    19ca:	a029                	j	19d4 <strnlen+0x1c>
    19cc:	cbc9                	beqz	a5,1a5e <strnlen+0xa6>
    19ce:	0006c703          	lbu	a4,0(a3)
    19d2:	cb51                	beqz	a4,1a66 <strnlen+0xae>
    19d4:	0685                	addi	a3,a3,1
    19d6:	0076f713          	andi	a4,a3,7
    19da:	17fd                	addi	a5,a5,-1
    19dc:	fb65                	bnez	a4,19cc <strnlen+0x14>
    if (n && *s != c)
    19de:	c3c1                	beqz	a5,1a5e <strnlen+0xa6>
    19e0:	0006c703          	lbu	a4,0(a3)
    19e4:	c349                	beqz	a4,1a66 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19e6:	471d                	li	a4,7
    19e8:	08f77a63          	bleu	a5,a4,1a7c <strnlen+0xc4>
    19ec:	00000e17          	auipc	t3,0x0
    19f0:	6b4e0e13          	addi	t3,t3,1716 # 20a0 <__clone+0xc4>
    19f4:	6290                	ld	a2,0(a3)
    19f6:	000e3703          	ld	a4,0(t3)
    19fa:	00000e97          	auipc	t4,0x0
    19fe:	6aee8e93          	addi	t4,t4,1710 # 20a8 <__clone+0xcc>
    1a02:	000eb803          	ld	a6,0(t4)
    1a06:	9732                	add	a4,a4,a2
    1a08:	fff64613          	not	a2,a2
    1a0c:	8f71                	and	a4,a4,a2
    1a0e:	01077733          	and	a4,a4,a6
    1a12:	e72d                	bnez	a4,1a7c <strnlen+0xc4>
    1a14:	4f1d                	li	t5,7
    1a16:	a839                	j	1a34 <strnlen+0x7c>
    1a18:	6698                	ld	a4,8(a3)
    1a1a:	000e3303          	ld	t1,0(t3)
    1a1e:	000eb803          	ld	a6,0(t4)
    1a22:	fff74893          	not	a7,a4
    1a26:	971a                	add	a4,a4,t1
    1a28:	01177733          	and	a4,a4,a7
    1a2c:	01077733          	and	a4,a4,a6
    1a30:	ef1d                	bnez	a4,1a6e <strnlen+0xb6>
    1a32:	86b2                	mv	a3,a2
    1a34:	17e1                	addi	a5,a5,-8
    1a36:	00868613          	addi	a2,a3,8
    1a3a:	fcff6fe3          	bltu	t5,a5,1a18 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a3e:	c385                	beqz	a5,1a5e <strnlen+0xa6>
    1a40:	00064703          	lbu	a4,0(a2)
    1a44:	cb19                	beqz	a4,1a5a <strnlen+0xa2>
    1a46:	00160713          	addi	a4,a2,1
    1a4a:	97b2                	add	a5,a5,a2
    1a4c:	863a                	mv	a2,a4
    1a4e:	00e78863          	beq	a5,a4,1a5e <strnlen+0xa6>
    1a52:	0705                	addi	a4,a4,1
    1a54:	fff74683          	lbu	a3,-1(a4)
    1a58:	faf5                	bnez	a3,1a4c <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a5a:	40a605b3          	sub	a1,a2,a0
}
    1a5e:	852e                	mv	a0,a1
    1a60:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a62:	87ae                	mv	a5,a1
    1a64:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a66:	8636                	mv	a2,a3
    1a68:	00064703          	lbu	a4,0(a2)
    1a6c:	bfe1                	j	1a44 <strnlen+0x8c>
    1a6e:	0086c703          	lbu	a4,8(a3)
    1a72:	bfc9                	j	1a44 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a74:	87ae                	mv	a5,a1
    1a76:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a78:	f7a5                	bnez	a5,19e0 <strnlen+0x28>
    1a7a:	b7d5                	j	1a5e <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a7c:	8636                	mv	a2,a3
    1a7e:	b7e1                	j	1a46 <strnlen+0x8e>

0000000000001a80 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a80:	00b547b3          	xor	a5,a0,a1
    1a84:	8b9d                	andi	a5,a5,7
    1a86:	efa9                	bnez	a5,1ae0 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a88:	0075f793          	andi	a5,a1,7
    1a8c:	c38d                	beqz	a5,1aae <strcpy+0x2e>
            if (!(*d = *s))
    1a8e:	0005c783          	lbu	a5,0(a1)
    1a92:	00f50023          	sb	a5,0(a0)
    1a96:	e799                	bnez	a5,1aa4 <strcpy+0x24>
    1a98:	a095                	j	1afc <strcpy+0x7c>
    1a9a:	0005c783          	lbu	a5,0(a1)
    1a9e:	00f50023          	sb	a5,0(a0)
    1aa2:	cbb9                	beqz	a5,1af8 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1aa4:	0585                	addi	a1,a1,1
    1aa6:	0075f793          	andi	a5,a1,7
    1aaa:	0505                	addi	a0,a0,1
    1aac:	f7fd                	bnez	a5,1a9a <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1aae:	00000797          	auipc	a5,0x0
    1ab2:	5f278793          	addi	a5,a5,1522 # 20a0 <__clone+0xc4>
    1ab6:	0007b803          	ld	a6,0(a5)
    1aba:	00000797          	auipc	a5,0x0
    1abe:	5ee78793          	addi	a5,a5,1518 # 20a8 <__clone+0xcc>
    1ac2:	6198                	ld	a4,0(a1)
    1ac4:	6390                	ld	a2,0(a5)
    1ac6:	a031                	j	1ad2 <strcpy+0x52>
    1ac8:	0521                	addi	a0,a0,8
    1aca:	05a1                	addi	a1,a1,8
    1acc:	fee53c23          	sd	a4,-8(a0)
    1ad0:	6198                	ld	a4,0(a1)
    1ad2:	010707b3          	add	a5,a4,a6
    1ad6:	fff74693          	not	a3,a4
    1ada:	8ff5                	and	a5,a5,a3
    1adc:	8ff1                	and	a5,a5,a2
    1ade:	d7ed                	beqz	a5,1ac8 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ae0:	0005c783          	lbu	a5,0(a1)
    1ae4:	00f50023          	sb	a5,0(a0)
    1ae8:	cb89                	beqz	a5,1afa <strcpy+0x7a>
    1aea:	0585                	addi	a1,a1,1
    1aec:	0005c783          	lbu	a5,0(a1)
    1af0:	0505                	addi	a0,a0,1
    1af2:	00f50023          	sb	a5,0(a0)
    1af6:	fbf5                	bnez	a5,1aea <strcpy+0x6a>
        ;
    return d;
}
    1af8:	8082                	ret
    1afa:	8082                	ret
    1afc:	8082                	ret

0000000000001afe <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1afe:	00b547b3          	xor	a5,a0,a1
    1b02:	8b9d                	andi	a5,a5,7
    1b04:	ebc1                	bnez	a5,1b94 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b06:	0075f793          	andi	a5,a1,7
    1b0a:	cf91                	beqz	a5,1b26 <strncpy+0x28>
    1b0c:	20060e63          	beqz	a2,1d28 <strncpy+0x22a>
    1b10:	0005c783          	lbu	a5,0(a1)
    1b14:	00f50023          	sb	a5,0(a0)
    1b18:	c3d5                	beqz	a5,1bbc <strncpy+0xbe>
    1b1a:	0585                	addi	a1,a1,1
    1b1c:	0075f793          	andi	a5,a1,7
    1b20:	167d                	addi	a2,a2,-1
    1b22:	0505                	addi	a0,a0,1
    1b24:	f7e5                	bnez	a5,1b0c <strncpy+0xe>
            ;
        if (!n || !*s)
    1b26:	20060163          	beqz	a2,1d28 <strncpy+0x22a>
    1b2a:	0005c683          	lbu	a3,0(a1)
    1b2e:	c6d9                	beqz	a3,1bbc <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b30:	479d                	li	a5,7
    1b32:	22c7f563          	bleu	a2,a5,1d5c <strncpy+0x25e>
    1b36:	00000317          	auipc	t1,0x0
    1b3a:	56a30313          	addi	t1,t1,1386 # 20a0 <__clone+0xc4>
    1b3e:	6198                	ld	a4,0(a1)
    1b40:	00033783          	ld	a5,0(t1)
    1b44:	00000e17          	auipc	t3,0x0
    1b48:	564e0e13          	addi	t3,t3,1380 # 20a8 <__clone+0xcc>
    1b4c:	000e3803          	ld	a6,0(t3)
    1b50:	97ba                	add	a5,a5,a4
    1b52:	fff74893          	not	a7,a4
    1b56:	0117f7b3          	and	a5,a5,a7
    1b5a:	0107f7b3          	and	a5,a5,a6
    1b5e:	1e079f63          	bnez	a5,1d5c <strncpy+0x25e>
    1b62:	4e9d                	li	t4,7
    1b64:	a005                	j	1b84 <strncpy+0x86>
    1b66:	6598                	ld	a4,8(a1)
    1b68:	00033783          	ld	a5,0(t1)
    1b6c:	000e3803          	ld	a6,0(t3)
    1b70:	fff74893          	not	a7,a4
    1b74:	97ba                	add	a5,a5,a4
    1b76:	0117f7b3          	and	a5,a5,a7
    1b7a:	0107f7b3          	and	a5,a5,a6
    1b7e:	1a079f63          	bnez	a5,1d3c <strncpy+0x23e>
    1b82:	85b6                	mv	a1,a3
            *wd = *ws;
    1b84:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b86:	1661                	addi	a2,a2,-8
    1b88:	00858693          	addi	a3,a1,8
    1b8c:	0521                	addi	a0,a0,8
    1b8e:	fcceece3          	bltu	t4,a2,1b66 <strncpy+0x68>
    1b92:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b94:	18060a63          	beqz	a2,1d28 <strncpy+0x22a>
    1b98:	0005c783          	lbu	a5,0(a1)
    1b9c:	872a                	mv	a4,a0
    1b9e:	00f50023          	sb	a5,0(a0)
    1ba2:	e799                	bnez	a5,1bb0 <strncpy+0xb2>
    1ba4:	a829                	j	1bbe <strncpy+0xc0>
    1ba6:	0005c783          	lbu	a5,0(a1)
    1baa:	00f70023          	sb	a5,0(a4)
    1bae:	cb81                	beqz	a5,1bbe <strncpy+0xc0>
    1bb0:	167d                	addi	a2,a2,-1
    1bb2:	0585                	addi	a1,a1,1
    1bb4:	0705                	addi	a4,a4,1
    1bb6:	fa65                	bnez	a2,1ba6 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1bb8:	853a                	mv	a0,a4
    1bba:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1bbc:	872a                	mv	a4,a0
    1bbe:	4805                	li	a6,1
    1bc0:	14061c63          	bnez	a2,1d18 <strncpy+0x21a>
    1bc4:	40e007b3          	neg	a5,a4
    1bc8:	8b9d                	andi	a5,a5,7
    1bca:	4581                	li	a1,0
    1bcc:	12061e63          	bnez	a2,1d08 <strncpy+0x20a>
    1bd0:	00778693          	addi	a3,a5,7
    1bd4:	452d                	li	a0,11
    1bd6:	12a6e763          	bltu	a3,a0,1d04 <strncpy+0x206>
    1bda:	16d5e663          	bltu	a1,a3,1d46 <strncpy+0x248>
    1bde:	14078c63          	beqz	a5,1d36 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be2:	00070023          	sb	zero,0(a4)
    1be6:	4585                	li	a1,1
    1be8:	00170693          	addi	a3,a4,1
    1bec:	14b78363          	beq	a5,a1,1d32 <strncpy+0x234>
    1bf0:	000700a3          	sb	zero,1(a4)
    1bf4:	4589                	li	a1,2
    1bf6:	00270693          	addi	a3,a4,2
    1bfa:	14b78963          	beq	a5,a1,1d4c <strncpy+0x24e>
    1bfe:	00070123          	sb	zero,2(a4)
    1c02:	458d                	li	a1,3
    1c04:	00370693          	addi	a3,a4,3
    1c08:	12b78363          	beq	a5,a1,1d2e <strncpy+0x230>
    1c0c:	000701a3          	sb	zero,3(a4)
    1c10:	4591                	li	a1,4
    1c12:	00470693          	addi	a3,a4,4
    1c16:	12b78d63          	beq	a5,a1,1d50 <strncpy+0x252>
    1c1a:	00070223          	sb	zero,4(a4)
    1c1e:	4595                	li	a1,5
    1c20:	00570693          	addi	a3,a4,5
    1c24:	12b78863          	beq	a5,a1,1d54 <strncpy+0x256>
    1c28:	000702a3          	sb	zero,5(a4)
    1c2c:	459d                	li	a1,7
    1c2e:	00670693          	addi	a3,a4,6
    1c32:	12b79363          	bne	a5,a1,1d58 <strncpy+0x25a>
    1c36:	00770693          	addi	a3,a4,7
    1c3a:	00070323          	sb	zero,6(a4)
    1c3e:	40f80833          	sub	a6,a6,a5
    1c42:	ff887513          	andi	a0,a6,-8
    1c46:	97ba                	add	a5,a5,a4
    1c48:	953e                	add	a0,a0,a5
    1c4a:	0007b023          	sd	zero,0(a5)
    1c4e:	07a1                	addi	a5,a5,8
    1c50:	fea79de3          	bne	a5,a0,1c4a <strncpy+0x14c>
    1c54:	ff887513          	andi	a0,a6,-8
    1c58:	9da9                	addw	a1,a1,a0
    1c5a:	00a687b3          	add	a5,a3,a0
    1c5e:	f4a80de3          	beq	a6,a0,1bb8 <strncpy+0xba>
    1c62:	00078023          	sb	zero,0(a5)
    1c66:	0015869b          	addiw	a3,a1,1
    1c6a:	f4c6f7e3          	bleu	a2,a3,1bb8 <strncpy+0xba>
    1c6e:	000780a3          	sb	zero,1(a5)
    1c72:	0025869b          	addiw	a3,a1,2
    1c76:	f4c6f1e3          	bleu	a2,a3,1bb8 <strncpy+0xba>
    1c7a:	00078123          	sb	zero,2(a5)
    1c7e:	0035869b          	addiw	a3,a1,3
    1c82:	f2c6fbe3          	bleu	a2,a3,1bb8 <strncpy+0xba>
    1c86:	000781a3          	sb	zero,3(a5)
    1c8a:	0045869b          	addiw	a3,a1,4
    1c8e:	f2c6f5e3          	bleu	a2,a3,1bb8 <strncpy+0xba>
    1c92:	00078223          	sb	zero,4(a5)
    1c96:	0055869b          	addiw	a3,a1,5
    1c9a:	f0c6ffe3          	bleu	a2,a3,1bb8 <strncpy+0xba>
    1c9e:	000782a3          	sb	zero,5(a5)
    1ca2:	0065869b          	addiw	a3,a1,6
    1ca6:	f0c6f9e3          	bleu	a2,a3,1bb8 <strncpy+0xba>
    1caa:	00078323          	sb	zero,6(a5)
    1cae:	0075869b          	addiw	a3,a1,7
    1cb2:	f0c6f3e3          	bleu	a2,a3,1bb8 <strncpy+0xba>
    1cb6:	000783a3          	sb	zero,7(a5)
    1cba:	0085869b          	addiw	a3,a1,8
    1cbe:	eec6fde3          	bleu	a2,a3,1bb8 <strncpy+0xba>
    1cc2:	00078423          	sb	zero,8(a5)
    1cc6:	0095869b          	addiw	a3,a1,9
    1cca:	eec6f7e3          	bleu	a2,a3,1bb8 <strncpy+0xba>
    1cce:	000784a3          	sb	zero,9(a5)
    1cd2:	00a5869b          	addiw	a3,a1,10
    1cd6:	eec6f1e3          	bleu	a2,a3,1bb8 <strncpy+0xba>
    1cda:	00078523          	sb	zero,10(a5)
    1cde:	00b5869b          	addiw	a3,a1,11
    1ce2:	ecc6fbe3          	bleu	a2,a3,1bb8 <strncpy+0xba>
    1ce6:	000785a3          	sb	zero,11(a5)
    1cea:	00c5869b          	addiw	a3,a1,12
    1cee:	ecc6f5e3          	bleu	a2,a3,1bb8 <strncpy+0xba>
    1cf2:	00078623          	sb	zero,12(a5)
    1cf6:	25b5                	addiw	a1,a1,13
    1cf8:	ecc5f0e3          	bleu	a2,a1,1bb8 <strncpy+0xba>
    1cfc:	000786a3          	sb	zero,13(a5)
}
    1d00:	853a                	mv	a0,a4
    1d02:	8082                	ret
    1d04:	46ad                	li	a3,11
    1d06:	bdd1                	j	1bda <strncpy+0xdc>
    1d08:	00778693          	addi	a3,a5,7
    1d0c:	452d                	li	a0,11
    1d0e:	fff60593          	addi	a1,a2,-1
    1d12:	eca6f4e3          	bleu	a0,a3,1bda <strncpy+0xdc>
    1d16:	b7fd                	j	1d04 <strncpy+0x206>
    1d18:	40e007b3          	neg	a5,a4
    1d1c:	8832                	mv	a6,a2
    1d1e:	8b9d                	andi	a5,a5,7
    1d20:	4581                	li	a1,0
    1d22:	ea0607e3          	beqz	a2,1bd0 <strncpy+0xd2>
    1d26:	b7cd                	j	1d08 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d28:	872a                	mv	a4,a0
}
    1d2a:	853a                	mv	a0,a4
    1d2c:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d2e:	458d                	li	a1,3
    1d30:	b739                	j	1c3e <strncpy+0x140>
    1d32:	4585                	li	a1,1
    1d34:	b729                	j	1c3e <strncpy+0x140>
    1d36:	86ba                	mv	a3,a4
    1d38:	4581                	li	a1,0
    1d3a:	b711                	j	1c3e <strncpy+0x140>
    1d3c:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d40:	872a                	mv	a4,a0
    1d42:	85b6                	mv	a1,a3
    1d44:	bda9                	j	1b9e <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d46:	87ba                	mv	a5,a4
    1d48:	4581                	li	a1,0
    1d4a:	bf21                	j	1c62 <strncpy+0x164>
    1d4c:	4589                	li	a1,2
    1d4e:	bdc5                	j	1c3e <strncpy+0x140>
    1d50:	4591                	li	a1,4
    1d52:	b5f5                	j	1c3e <strncpy+0x140>
    1d54:	4595                	li	a1,5
    1d56:	b5e5                	j	1c3e <strncpy+0x140>
    1d58:	4599                	li	a1,6
    1d5a:	b5d5                	j	1c3e <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d5c:	00d50023          	sb	a3,0(a0)
    1d60:	872a                	mv	a4,a0
    1d62:	b5b9                	j	1bb0 <strncpy+0xb2>

0000000000001d64 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d64:	87aa                	mv	a5,a0
    1d66:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d68:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d6c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d70:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d72:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d74:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d78:	2501                	sext.w	a0,a0
    1d7a:	8082                	ret

0000000000001d7c <openat>:
    register long a7 __asm__("a7") = n;
    1d7c:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d80:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d84:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <close>:
    register long a7 __asm__("a7") = n;
    1d8c:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d90:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <read>:
    register long a7 __asm__("a7") = n;
    1d98:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d9c:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1da0:	8082                	ret

0000000000001da2 <write>:
    register long a7 __asm__("a7") = n;
    1da2:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da6:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1daa:	8082                	ret

0000000000001dac <getpid>:
    register long a7 __asm__("a7") = n;
    1dac:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1db0:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <getppid>:
    register long a7 __asm__("a7") = n;
    1db8:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1dbc:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dc4:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1dc8:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <fork>:
    register long a7 __asm__("a7") = n;
    1dd0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1dd4:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1dd6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dd8:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1de0:	85b2                	mv	a1,a2
    1de2:	863a                	mv	a2,a4
    if (stack)
    1de4:	c191                	beqz	a1,1de8 <clone+0x8>
	stack += stack_size;
    1de6:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1de8:	4781                	li	a5,0
    1dea:	4701                	li	a4,0
    1dec:	4681                	li	a3,0
    1dee:	2601                	sext.w	a2,a2
    1df0:	1ec0006f          	j	1fdc <__clone>

0000000000001df4 <exit>:
    register long a7 __asm__("a7") = n;
    1df4:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1df8:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dfc:	8082                	ret

0000000000001dfe <waitpid>:
    register long a7 __asm__("a7") = n;
    1dfe:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e02:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e04:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <exec>:
    register long a7 __asm__("a7") = n;
    1e0c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e10:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <execve>:
    register long a7 __asm__("a7") = n;
    1e18:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e1c:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e20:	2501                	sext.w	a0,a0
    1e22:	8082                	ret

0000000000001e24 <times>:
    register long a7 __asm__("a7") = n;
    1e24:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e28:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <get_time>:

int64 get_time()
{
    1e30:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e32:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e36:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e38:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e3e:	2501                	sext.w	a0,a0
    1e40:	ed09                	bnez	a0,1e5a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e42:	67a2                	ld	a5,8(sp)
    1e44:	3e800713          	li	a4,1000
    1e48:	00015503          	lhu	a0,0(sp)
    1e4c:	02e7d7b3          	divu	a5,a5,a4
    1e50:	02e50533          	mul	a0,a0,a4
    1e54:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e56:	0141                	addi	sp,sp,16
    1e58:	8082                	ret
        return -1;
    1e5a:	557d                	li	a0,-1
    1e5c:	bfed                	j	1e56 <get_time+0x26>

0000000000001e5e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e5e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e62:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <time>:
    register long a7 __asm__("a7") = n;
    1e6a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e6e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <sleep>:

int sleep(unsigned long long time)
{
    1e76:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e78:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e7a:	850a                	mv	a0,sp
    1e7c:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e7e:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e82:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e84:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e88:	e501                	bnez	a0,1e90 <sleep+0x1a>
    return 0;
    1e8a:	4501                	li	a0,0
}
    1e8c:	0141                	addi	sp,sp,16
    1e8e:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e90:	4502                	lw	a0,0(sp)
}
    1e92:	0141                	addi	sp,sp,16
    1e94:	8082                	ret

0000000000001e96 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e96:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e9a:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e9e:	2501                	sext.w	a0,a0
    1ea0:	8082                	ret

0000000000001ea2 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1ea2:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1ea6:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1eaa:	8082                	ret

0000000000001eac <munmap>:
    register long a7 __asm__("a7") = n;
    1eac:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb0:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <wait>:

int wait(int *code)
{
    1eb8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1eba:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ebe:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ec0:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1ec2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ec4:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <spawn>:
    register long a7 __asm__("a7") = n;
    1ecc:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ed0:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <mailread>:
    register long a7 __asm__("a7") = n;
    1ed8:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1edc:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ee0:	2501                	sext.w	a0,a0
    1ee2:	8082                	ret

0000000000001ee4 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ee4:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee8:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1eec:	2501                	sext.w	a0,a0
    1eee:	8082                	ret

0000000000001ef0 <fstat>:
    register long a7 __asm__("a7") = n;
    1ef0:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef4:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ef8:	2501                	sext.w	a0,a0
    1efa:	8082                	ret

0000000000001efc <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1efc:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1efe:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f02:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f04:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f08:	2501                	sext.w	a0,a0
    1f0a:	8082                	ret

0000000000001f0c <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f0c:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f0e:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f12:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f14:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f18:	2501                	sext.w	a0,a0
    1f1a:	8082                	ret

0000000000001f1c <link>:

int link(char *old_path, char *new_path)
{
    1f1c:	87aa                	mv	a5,a0
    1f1e:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f20:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f24:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f28:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f2a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f2e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f30:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f34:	2501                	sext.w	a0,a0
    1f36:	8082                	ret

0000000000001f38 <unlink>:

int unlink(char *path)
{
    1f38:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f3a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f3e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f42:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f44:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f48:	2501                	sext.w	a0,a0
    1f4a:	8082                	ret

0000000000001f4c <uname>:
    register long a7 __asm__("a7") = n;
    1f4c:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f50:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f54:	2501                	sext.w	a0,a0
    1f56:	8082                	ret

0000000000001f58 <brk>:
    register long a7 __asm__("a7") = n;
    1f58:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f5c:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f60:	2501                	sext.w	a0,a0
    1f62:	8082                	ret

0000000000001f64 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f64:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f66:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f6a:	8082                	ret

0000000000001f6c <chdir>:
    register long a7 __asm__("a7") = n;
    1f6c:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f70:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f74:	2501                	sext.w	a0,a0
    1f76:	8082                	ret

0000000000001f78 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f78:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f7a:	02059613          	slli	a2,a1,0x20
    1f7e:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f80:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f84:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f88:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f8a:	00000073          	ecall
}
    1f8e:	2501                	sext.w	a0,a0
    1f90:	8082                	ret

0000000000001f92 <getdents>:
    register long a7 __asm__("a7") = n;
    1f92:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f96:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f9a:	2501                	sext.w	a0,a0
    1f9c:	8082                	ret

0000000000001f9e <pipe>:
    register long a7 __asm__("a7") = n;
    1f9e:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1fa2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fa4:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1fa8:	2501                	sext.w	a0,a0
    1faa:	8082                	ret

0000000000001fac <dup>:
    register long a7 __asm__("a7") = n;
    1fac:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1fae:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1fb2:	2501                	sext.w	a0,a0
    1fb4:	8082                	ret

0000000000001fb6 <dup2>:
    register long a7 __asm__("a7") = n;
    1fb6:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fb8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fba:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fbe:	2501                	sext.w	a0,a0
    1fc0:	8082                	ret

0000000000001fc2 <mount>:
    register long a7 __asm__("a7") = n;
    1fc2:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fc6:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fca:	2501                	sext.w	a0,a0
    1fcc:	8082                	ret

0000000000001fce <umount>:
    register long a7 __asm__("a7") = n;
    1fce:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fd2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fd4:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fd8:	2501                	sext.w	a0,a0
    1fda:	8082                	ret

0000000000001fdc <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fdc:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fde:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fe0:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fe2:	8532                	mv	a0,a2
	mv a2, a4
    1fe4:	863a                	mv	a2,a4
	mv a3, a5
    1fe6:	86be                	mv	a3,a5
	mv a4, a6
    1fe8:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fea:	0dc00893          	li	a7,220
	ecall
    1fee:	00000073          	ecall

	beqz a0, 1f
    1ff2:	c111                	beqz	a0,1ff6 <__clone+0x1a>
	# Parent
	ret
    1ff4:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ff6:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ff8:	6522                	ld	a0,8(sp)
	jalr a1
    1ffa:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ffc:	05d00893          	li	a7,93
	ecall
    2000:	00000073          	ecall
