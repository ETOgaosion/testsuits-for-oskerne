
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/sleep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0e00006f          	j	10e2 <__start_main>

0000000000001006 <test_sleep>:
 * 测试通过时的输出：
 * "sleep success."
 * 测试失败时的输出：
 * "sleep error."
 */
void test_sleep() {
    1006:	1101                	addi	sp,sp,-32
	TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	01850513          	addi	a0,a0,24 # 2020 <__clone+0x2e>
void test_sleep() {
    1010:	ec06                	sd	ra,24(sp)
    1012:	e426                	sd	s1,8(sp)
    1014:	e822                	sd	s0,16(sp)
	TEST_START(__func__);
    1016:	2cc000ef          	jal	ra,12e2 <puts>
    101a:	00001517          	auipc	a0,0x1
    101e:	09e50513          	addi	a0,a0,158 # 20b8 <__func__.1185>
    1022:	2c0000ef          	jal	ra,12e2 <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	01250513          	addi	a0,a0,18 # 2038 <__clone+0x46>
    102e:	2b4000ef          	jal	ra,12e2 <puts>

	int time1 = get_time();
    1032:	615000ef          	jal	ra,1e46 <get_time>
    1036:	0005049b          	sext.w	s1,a0
	assert(time1 >= 0);
    103a:	0804c563          	bltz	s1,10c4 <test_sleep+0xbe>
	int ret = sleep(1);
    103e:	4505                	li	a0,1
    1040:	64d000ef          	jal	ra,1e8c <sleep>
	assert(ret == 0);
    1044:	ed29                	bnez	a0,109e <test_sleep+0x98>
	int time2 = get_time();
    1046:	601000ef          	jal	ra,1e46 <get_time>
    104a:	0005041b          	sext.w	s0,a0
	assert(time2 >= 0);
    104e:	06044463          	bltz	s0,10b6 <test_sleep+0xb0>

	if(time2 - time1 >= 1){	
    1052:	9c05                	subw	s0,s0,s1
    1054:	02805e63          	blez	s0,1090 <test_sleep+0x8a>
		printf("sleep success.\n");
    1058:	00001517          	auipc	a0,0x1
    105c:	01050513          	addi	a0,a0,16 # 2068 <__clone+0x76>
    1060:	2a4000ef          	jal	ra,1304 <printf>
	}else{
		printf("sleep error.\n");
	}
	TEST_END(__func__);
    1064:	00001517          	auipc	a0,0x1
    1068:	02450513          	addi	a0,a0,36 # 2088 <__clone+0x96>
    106c:	276000ef          	jal	ra,12e2 <puts>
    1070:	00001517          	auipc	a0,0x1
    1074:	04850513          	addi	a0,a0,72 # 20b8 <__func__.1185>
    1078:	26a000ef          	jal	ra,12e2 <puts>
}
    107c:	6442                	ld	s0,16(sp)
    107e:	60e2                	ld	ra,24(sp)
    1080:	64a2                	ld	s1,8(sp)
	TEST_END(__func__);
    1082:	00001517          	auipc	a0,0x1
    1086:	fb650513          	addi	a0,a0,-74 # 2038 <__clone+0x46>
}
    108a:	6105                	addi	sp,sp,32
	TEST_END(__func__);
    108c:	2560006f          	j	12e2 <puts>
		printf("sleep error.\n");
    1090:	00001517          	auipc	a0,0x1
    1094:	fe850513          	addi	a0,a0,-24 # 2078 <__clone+0x86>
    1098:	26c000ef          	jal	ra,1304 <printf>
    109c:	b7e1                	j	1064 <test_sleep+0x5e>
	assert(ret == 0);
    109e:	00001517          	auipc	a0,0x1
    10a2:	faa50513          	addi	a0,a0,-86 # 2048 <__clone+0x56>
    10a6:	502000ef          	jal	ra,15a8 <panic>
	int time2 = get_time();
    10aa:	59d000ef          	jal	ra,1e46 <get_time>
    10ae:	0005041b          	sext.w	s0,a0
	assert(time2 >= 0);
    10b2:	fa0450e3          	bgez	s0,1052 <test_sleep+0x4c>
    10b6:	00001517          	auipc	a0,0x1
    10ba:	f9250513          	addi	a0,a0,-110 # 2048 <__clone+0x56>
    10be:	4ea000ef          	jal	ra,15a8 <panic>
    10c2:	bf41                	j	1052 <test_sleep+0x4c>
	assert(time1 >= 0);
    10c4:	00001517          	auipc	a0,0x1
    10c8:	f8450513          	addi	a0,a0,-124 # 2048 <__clone+0x56>
    10cc:	4dc000ef          	jal	ra,15a8 <panic>
    10d0:	b7bd                	j	103e <test_sleep+0x38>

00000000000010d2 <main>:

int main(void) {
    10d2:	1141                	addi	sp,sp,-16
    10d4:	e406                	sd	ra,8(sp)
	test_sleep();
    10d6:	f31ff0ef          	jal	ra,1006 <test_sleep>
	return 0;
}
    10da:	60a2                	ld	ra,8(sp)
    10dc:	4501                	li	a0,0
    10de:	0141                	addi	sp,sp,16
    10e0:	8082                	ret

00000000000010e2 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10e2:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10e4:	4108                	lw	a0,0(a0)
{
    10e6:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10e8:	05a1                	addi	a1,a1,8
{
    10ea:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ec:	fe7ff0ef          	jal	ra,10d2 <main>
    10f0:	51b000ef          	jal	ra,1e0a <exit>
	return 0;
}
    10f4:	60a2                	ld	ra,8(sp)
    10f6:	4501                	li	a0,0
    10f8:	0141                	addi	sp,sp,16
    10fa:	8082                	ret

00000000000010fc <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10fc:	7179                	addi	sp,sp,-48
    10fe:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1100:	12054e63          	bltz	a0,123c <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    1104:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    1108:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    110a:	02b7f6bb          	remuw	a3,a5,a1
    110e:	00001717          	auipc	a4,0x1
    1112:	fba70713          	addi	a4,a4,-70 # 20c8 <digits>
    buf[16] = 0;
    1116:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    111a:	1682                	slli	a3,a3,0x20
    111c:	9281                	srli	a3,a3,0x20
    111e:	96ba                	add	a3,a3,a4
    1120:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1124:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1128:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    112c:	16b7e363          	bltu	a5,a1,1292 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1130:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1134:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1138:	1602                	slli	a2,a2,0x20
    113a:	9201                	srli	a2,a2,0x20
    113c:	963a                	add	a2,a2,a4
    113e:	00064603          	lbu	a2,0(a2)
    1142:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1146:	0007861b          	sext.w	a2,a5
    114a:	12b6e863          	bltu	a3,a1,127a <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    114e:	02b7f6bb          	remuw	a3,a5,a1
    1152:	1682                	slli	a3,a3,0x20
    1154:	9281                	srli	a3,a3,0x20
    1156:	96ba                	add	a3,a3,a4
    1158:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    115c:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1160:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1164:	10b66e63          	bltu	a2,a1,1280 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1168:	02b876bb          	remuw	a3,a6,a1
    116c:	1682                	slli	a3,a3,0x20
    116e:	9281                	srli	a3,a3,0x20
    1170:	96ba                	add	a3,a3,a4
    1172:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1176:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    117a:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    117e:	10b86463          	bltu	a6,a1,1286 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1182:	02b676bb          	remuw	a3,a2,a1
    1186:	1682                	slli	a3,a3,0x20
    1188:	9281                	srli	a3,a3,0x20
    118a:	96ba                	add	a3,a3,a4
    118c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1190:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1194:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1198:	0eb66a63          	bltu	a2,a1,128c <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    119c:	02b876bb          	remuw	a3,a6,a1
    11a0:	1682                	slli	a3,a3,0x20
    11a2:	9281                	srli	a3,a3,0x20
    11a4:	96ba                	add	a3,a3,a4
    11a6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11aa:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11ae:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11b2:	0cb86163          	bltu	a6,a1,1274 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    11b6:	02b676bb          	remuw	a3,a2,a1
    11ba:	1682                	slli	a3,a3,0x20
    11bc:	9281                	srli	a3,a3,0x20
    11be:	96ba                	add	a3,a3,a4
    11c0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c4:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11c8:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11cc:	0cb66563          	bltu	a2,a1,1296 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11d0:	02b876bb          	remuw	a3,a6,a1
    11d4:	1682                	slli	a3,a3,0x20
    11d6:	9281                	srli	a3,a3,0x20
    11d8:	96ba                	add	a3,a3,a4
    11da:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11de:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11e2:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11e6:	0ab86b63          	bltu	a6,a1,129c <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11ea:	02b676bb          	remuw	a3,a2,a1
    11ee:	1682                	slli	a3,a3,0x20
    11f0:	9281                	srli	a3,a3,0x20
    11f2:	96ba                	add	a3,a3,a4
    11f4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11f8:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11fc:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1200:	0ab66163          	bltu	a2,a1,12a2 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    1204:	1782                	slli	a5,a5,0x20
    1206:	9381                	srli	a5,a5,0x20
    1208:	97ba                	add	a5,a5,a4
    120a:	0007c703          	lbu	a4,0(a5)
    120e:	4599                	li	a1,6
    1210:	4795                	li	a5,5
    1212:	00e10723          	sb	a4,14(sp)

    if (sign)
    1216:	00055963          	bgez	a0,1228 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    121a:	1018                	addi	a4,sp,32
    121c:	973e                	add	a4,a4,a5
    121e:	02d00693          	li	a3,45
    1222:	fed70423          	sb	a3,-24(a4)
    1226:	85be                	mv	a1,a5
    write(f, s, l);
    1228:	003c                	addi	a5,sp,8
    122a:	4641                	li	a2,16
    122c:	9e0d                	subw	a2,a2,a1
    122e:	4505                	li	a0,1
    1230:	95be                	add	a1,a1,a5
    1232:	387000ef          	jal	ra,1db8 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1236:	70a2                	ld	ra,40(sp)
    1238:	6145                	addi	sp,sp,48
    123a:	8082                	ret
        x = -xx;
    123c:	40a0063b          	negw	a2,a0
    1240:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1242:	02b677bb          	remuw	a5,a2,a1
    1246:	00001717          	auipc	a4,0x1
    124a:	e8270713          	addi	a4,a4,-382 # 20c8 <digits>
    buf[16] = 0;
    124e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1252:	1782                	slli	a5,a5,0x20
    1254:	9381                	srli	a5,a5,0x20
    1256:	97ba                	add	a5,a5,a4
    1258:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    125c:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1260:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1264:	ecb676e3          	bleu	a1,a2,1130 <printint.constprop.0+0x34>
        buf[i--] = '-';
    1268:	02d00793          	li	a5,45
    126c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1270:	45b9                	li	a1,14
    1272:	bf5d                	j	1228 <printint.constprop.0+0x12c>
    1274:	47a5                	li	a5,9
    1276:	45a9                	li	a1,10
    1278:	bf79                	j	1216 <printint.constprop.0+0x11a>
    127a:	47b5                	li	a5,13
    127c:	45b9                	li	a1,14
    127e:	bf61                	j	1216 <printint.constprop.0+0x11a>
    1280:	47b1                	li	a5,12
    1282:	45b5                	li	a1,13
    1284:	bf49                	j	1216 <printint.constprop.0+0x11a>
    1286:	47ad                	li	a5,11
    1288:	45b1                	li	a1,12
    128a:	b771                	j	1216 <printint.constprop.0+0x11a>
    128c:	47a9                	li	a5,10
    128e:	45ad                	li	a1,11
    1290:	b759                	j	1216 <printint.constprop.0+0x11a>
    i = 15;
    1292:	45bd                	li	a1,15
    1294:	bf51                	j	1228 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1296:	47a1                	li	a5,8
    1298:	45a5                	li	a1,9
    129a:	bfb5                	j	1216 <printint.constprop.0+0x11a>
    129c:	479d                	li	a5,7
    129e:	45a1                	li	a1,8
    12a0:	bf9d                	j	1216 <printint.constprop.0+0x11a>
    12a2:	4799                	li	a5,6
    12a4:	459d                	li	a1,7
    12a6:	bf85                	j	1216 <printint.constprop.0+0x11a>

00000000000012a8 <getchar>:
{
    12a8:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12aa:	00f10593          	addi	a1,sp,15
    12ae:	4605                	li	a2,1
    12b0:	4501                	li	a0,0
{
    12b2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12b4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12b8:	2f7000ef          	jal	ra,1dae <read>
}
    12bc:	60e2                	ld	ra,24(sp)
    12be:	00f14503          	lbu	a0,15(sp)
    12c2:	6105                	addi	sp,sp,32
    12c4:	8082                	ret

00000000000012c6 <putchar>:
{
    12c6:	1101                	addi	sp,sp,-32
    char byte = c;
    12c8:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12cc:	00f10593          	addi	a1,sp,15
    12d0:	4605                	li	a2,1
    12d2:	4505                	li	a0,1
{
    12d4:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12d6:	2e3000ef          	jal	ra,1db8 <write>
}
    12da:	60e2                	ld	ra,24(sp)
    12dc:	2501                	sext.w	a0,a0
    12de:	6105                	addi	sp,sp,32
    12e0:	8082                	ret

00000000000012e2 <puts>:
{
    12e2:	1141                	addi	sp,sp,-16
    12e4:	e406                	sd	ra,8(sp)
    12e6:	e022                	sd	s0,0(sp)
    12e8:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12ea:	5b2000ef          	jal	ra,189c <strlen>
    12ee:	862a                	mv	a2,a0
    12f0:	85a2                	mv	a1,s0
    12f2:	4505                	li	a0,1
    12f4:	2c5000ef          	jal	ra,1db8 <write>
}
    12f8:	60a2                	ld	ra,8(sp)
    12fa:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12fc:	957d                	srai	a0,a0,0x3f
    return r;
    12fe:	2501                	sext.w	a0,a0
}
    1300:	0141                	addi	sp,sp,16
    1302:	8082                	ret

0000000000001304 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1304:	7131                	addi	sp,sp,-192
    1306:	e0da                	sd	s6,64(sp)
    1308:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    130a:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    130c:	013c                	addi	a5,sp,136
{
    130e:	f0ca                	sd	s2,96(sp)
    1310:	ecce                	sd	s3,88(sp)
    1312:	e8d2                	sd	s4,80(sp)
    1314:	e4d6                	sd	s5,72(sp)
    1316:	fc5e                	sd	s7,56(sp)
    1318:	fc86                	sd	ra,120(sp)
    131a:	f8a2                	sd	s0,112(sp)
    131c:	f4a6                	sd	s1,104(sp)
    131e:	89aa                	mv	s3,a0
    1320:	e52e                	sd	a1,136(sp)
    1322:	e932                	sd	a2,144(sp)
    1324:	ed36                	sd	a3,152(sp)
    1326:	f13a                	sd	a4,160(sp)
    1328:	f942                	sd	a6,176(sp)
    132a:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    132c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    132e:	02500913          	li	s2,37
    1332:	07000a93          	li	s5,112
    buf[i++] = '0';
    1336:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    133a:	00001a17          	auipc	s4,0x1
    133e:	d8ea0a13          	addi	s4,s4,-626 # 20c8 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1342:	00001b97          	auipc	s7,0x1
    1346:	d56b8b93          	addi	s7,s7,-682 # 2098 <__clone+0xa6>
        if (!*s)
    134a:	0009c783          	lbu	a5,0(s3)
    134e:	cfb9                	beqz	a5,13ac <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1350:	23278d63          	beq	a5,s2,158a <printf+0x286>
    1354:	864e                	mv	a2,s3
    1356:	a019                	j	135c <printf+0x58>
    1358:	07278563          	beq	a5,s2,13c2 <printf+0xbe>
    135c:	0605                	addi	a2,a2,1
    135e:	00064783          	lbu	a5,0(a2)
    1362:	fbfd                	bnez	a5,1358 <printf+0x54>
    1364:	84b2                	mv	s1,a2
        l = z - a;
    1366:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    136a:	8622                	mv	a2,s0
    136c:	85ce                	mv	a1,s3
    136e:	4505                	li	a0,1
    1370:	249000ef          	jal	ra,1db8 <write>
        if (l)
    1374:	ec3d                	bnez	s0,13f2 <printf+0xee>
        if (s[1] == 0)
    1376:	0014c783          	lbu	a5,1(s1)
    137a:	cb8d                	beqz	a5,13ac <printf+0xa8>
        switch (s[1])
    137c:	09578b63          	beq	a5,s5,1412 <printf+0x10e>
    1380:	06fafb63          	bleu	a5,s5,13f6 <printf+0xf2>
    1384:	07300713          	li	a4,115
    1388:	1ce78e63          	beq	a5,a4,1564 <printf+0x260>
    138c:	07800713          	li	a4,120
    1390:	1ae79563          	bne	a5,a4,153a <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1394:	6782                	ld	a5,0(sp)
    1396:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1398:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    139c:	4388                	lw	a0,0(a5)
    139e:	07a1                	addi	a5,a5,8
    13a0:	e03e                	sd	a5,0(sp)
    13a2:	d5bff0ef          	jal	ra,10fc <printint.constprop.0>
        if (!*s)
    13a6:	0009c783          	lbu	a5,0(s3)
    13aa:	f3dd                	bnez	a5,1350 <printf+0x4c>
    }
    va_end(ap);
}
    13ac:	70e6                	ld	ra,120(sp)
    13ae:	7446                	ld	s0,112(sp)
    13b0:	74a6                	ld	s1,104(sp)
    13b2:	7906                	ld	s2,96(sp)
    13b4:	69e6                	ld	s3,88(sp)
    13b6:	6a46                	ld	s4,80(sp)
    13b8:	6aa6                	ld	s5,72(sp)
    13ba:	6b06                	ld	s6,64(sp)
    13bc:	7be2                	ld	s7,56(sp)
    13be:	6129                	addi	sp,sp,192
    13c0:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13c2:	00164783          	lbu	a5,1(a2)
    13c6:	84b2                	mv	s1,a2
    13c8:	01278763          	beq	a5,s2,13d6 <printf+0xd2>
    13cc:	bf69                	j	1366 <printf+0x62>
    13ce:	0014c783          	lbu	a5,1(s1)
    13d2:	f9279ae3          	bne	a5,s2,1366 <printf+0x62>
    13d6:	0489                	addi	s1,s1,2
    13d8:	0004c783          	lbu	a5,0(s1)
    13dc:	0605                	addi	a2,a2,1
    13de:	ff2788e3          	beq	a5,s2,13ce <printf+0xca>
        l = z - a;
    13e2:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13e6:	8622                	mv	a2,s0
    13e8:	85ce                	mv	a1,s3
    13ea:	4505                	li	a0,1
    13ec:	1cd000ef          	jal	ra,1db8 <write>
        if (l)
    13f0:	d059                	beqz	s0,1376 <printf+0x72>
    13f2:	89a6                	mv	s3,s1
    13f4:	bf99                	j	134a <printf+0x46>
    13f6:	06400713          	li	a4,100
    13fa:	14e79063          	bne	a5,a4,153a <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13fe:	6782                	ld	a5,0(sp)
    1400:	45a9                	li	a1,10
        s += 2;
    1402:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    1406:	4388                	lw	a0,0(a5)
    1408:	07a1                	addi	a5,a5,8
    140a:	e03e                	sd	a5,0(sp)
    140c:	cf1ff0ef          	jal	ra,10fc <printint.constprop.0>
        s += 2;
    1410:	bf59                	j	13a6 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    1412:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1414:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1418:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    141a:	631c                	ld	a5,0(a4)
    141c:	0721                	addi	a4,a4,8
    141e:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1420:	00479293          	slli	t0,a5,0x4
    1424:	00879f93          	slli	t6,a5,0x8
    1428:	00c79f13          	slli	t5,a5,0xc
    142c:	01079e93          	slli	t4,a5,0x10
    1430:	01479e13          	slli	t3,a5,0x14
    1434:	01879313          	slli	t1,a5,0x18
    1438:	01c79893          	slli	a7,a5,0x1c
    143c:	02479813          	slli	a6,a5,0x24
    1440:	02879513          	slli	a0,a5,0x28
    1444:	02c79593          	slli	a1,a5,0x2c
    1448:	03079693          	slli	a3,a5,0x30
    144c:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1450:	03c7d413          	srli	s0,a5,0x3c
    1454:	01c7d39b          	srliw	t2,a5,0x1c
    1458:	03c2d293          	srli	t0,t0,0x3c
    145c:	03cfdf93          	srli	t6,t6,0x3c
    1460:	03cf5f13          	srli	t5,t5,0x3c
    1464:	03cede93          	srli	t4,t4,0x3c
    1468:	03ce5e13          	srli	t3,t3,0x3c
    146c:	03c35313          	srli	t1,t1,0x3c
    1470:	03c8d893          	srli	a7,a7,0x3c
    1474:	03c85813          	srli	a6,a6,0x3c
    1478:	9171                	srli	a0,a0,0x3c
    147a:	91f1                	srli	a1,a1,0x3c
    147c:	92f1                	srli	a3,a3,0x3c
    147e:	9371                	srli	a4,a4,0x3c
    1480:	96d2                	add	a3,a3,s4
    1482:	9752                	add	a4,a4,s4
    1484:	9452                	add	s0,s0,s4
    1486:	92d2                	add	t0,t0,s4
    1488:	9fd2                	add	t6,t6,s4
    148a:	9f52                	add	t5,t5,s4
    148c:	9ed2                	add	t4,t4,s4
    148e:	9e52                	add	t3,t3,s4
    1490:	9352                	add	t1,t1,s4
    1492:	98d2                	add	a7,a7,s4
    1494:	93d2                	add	t2,t2,s4
    1496:	9852                	add	a6,a6,s4
    1498:	9552                	add	a0,a0,s4
    149a:	95d2                	add	a1,a1,s4
    149c:	0006c983          	lbu	s3,0(a3)
    14a0:	0002c283          	lbu	t0,0(t0)
    14a4:	00074683          	lbu	a3,0(a4)
    14a8:	000fcf83          	lbu	t6,0(t6)
    14ac:	000f4f03          	lbu	t5,0(t5)
    14b0:	000ece83          	lbu	t4,0(t4)
    14b4:	000e4e03          	lbu	t3,0(t3)
    14b8:	00034303          	lbu	t1,0(t1)
    14bc:	0008c883          	lbu	a7,0(a7)
    14c0:	0003c383          	lbu	t2,0(t2)
    14c4:	00084803          	lbu	a6,0(a6)
    14c8:	00054503          	lbu	a0,0(a0)
    14cc:	0005c583          	lbu	a1,0(a1)
    14d0:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14d4:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14d8:	9371                	srli	a4,a4,0x3c
    14da:	8bbd                	andi	a5,a5,15
    14dc:	9752                	add	a4,a4,s4
    14de:	97d2                	add	a5,a5,s4
    14e0:	005105a3          	sb	t0,11(sp)
    14e4:	01f10623          	sb	t6,12(sp)
    14e8:	01e106a3          	sb	t5,13(sp)
    14ec:	01d10723          	sb	t4,14(sp)
    14f0:	01c107a3          	sb	t3,15(sp)
    14f4:	00610823          	sb	t1,16(sp)
    14f8:	011108a3          	sb	a7,17(sp)
    14fc:	00710923          	sb	t2,18(sp)
    1500:	010109a3          	sb	a6,19(sp)
    1504:	00a10a23          	sb	a0,20(sp)
    1508:	00b10aa3          	sb	a1,21(sp)
    150c:	01310b23          	sb	s3,22(sp)
    1510:	00d10ba3          	sb	a3,23(sp)
    1514:	00810523          	sb	s0,10(sp)
    1518:	00074703          	lbu	a4,0(a4)
    151c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1520:	002c                	addi	a1,sp,8
    1522:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1524:	00e10c23          	sb	a4,24(sp)
    1528:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    152c:	00010d23          	sb	zero,26(sp)
        s += 2;
    1530:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1534:	085000ef          	jal	ra,1db8 <write>
        s += 2;
    1538:	b5bd                	j	13a6 <printf+0xa2>
    char byte = c;
    153a:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    153e:	4605                	li	a2,1
    1540:	002c                	addi	a1,sp,8
    1542:	4505                	li	a0,1
    char byte = c;
    1544:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1548:	071000ef          	jal	ra,1db8 <write>
    char byte = c;
    154c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1550:	4605                	li	a2,1
    1552:	002c                	addi	a1,sp,8
    1554:	4505                	li	a0,1
    char byte = c;
    1556:	00f10423          	sb	a5,8(sp)
        s += 2;
    155a:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    155e:	05b000ef          	jal	ra,1db8 <write>
        s += 2;
    1562:	b591                	j	13a6 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1564:	6782                	ld	a5,0(sp)
    1566:	6380                	ld	s0,0(a5)
    1568:	07a1                	addi	a5,a5,8
    156a:	e03e                	sd	a5,0(sp)
    156c:	cc05                	beqz	s0,15a4 <printf+0x2a0>
            l = strnlen(a, 200);
    156e:	0c800593          	li	a1,200
    1572:	8522                	mv	a0,s0
    1574:	45a000ef          	jal	ra,19ce <strnlen>
    write(f, s, l);
    1578:	0005061b          	sext.w	a2,a0
    157c:	85a2                	mv	a1,s0
    157e:	4505                	li	a0,1
    1580:	039000ef          	jal	ra,1db8 <write>
        s += 2;
    1584:	00248993          	addi	s3,s1,2
    1588:	bd39                	j	13a6 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    158a:	0019c783          	lbu	a5,1(s3)
    158e:	84ce                	mv	s1,s3
    1590:	864e                	mv	a2,s3
    1592:	e52782e3          	beq	a5,s2,13d6 <printf+0xd2>
    write(f, s, l);
    1596:	4601                	li	a2,0
    1598:	85ce                	mv	a1,s3
    159a:	4505                	li	a0,1
    159c:	01d000ef          	jal	ra,1db8 <write>
    15a0:	84ce                	mv	s1,s3
    15a2:	bbd1                	j	1376 <printf+0x72>
                a = "(null)";
    15a4:	845e                	mv	s0,s7
    15a6:	b7e1                	j	156e <printf+0x26a>

00000000000015a8 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15a8:	1141                	addi	sp,sp,-16
    15aa:	e406                	sd	ra,8(sp)
    puts(m);
    15ac:	d37ff0ef          	jal	ra,12e2 <puts>
    exit(-100);
}
    15b0:	60a2                	ld	ra,8(sp)
    exit(-100);
    15b2:	f9c00513          	li	a0,-100
}
    15b6:	0141                	addi	sp,sp,16
    exit(-100);
    15b8:	0530006f          	j	1e0a <exit>

00000000000015bc <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15bc:	02000793          	li	a5,32
    15c0:	00f50663          	beq	a0,a5,15cc <isspace+0x10>
    15c4:	355d                	addiw	a0,a0,-9
    15c6:	00553513          	sltiu	a0,a0,5
    15ca:	8082                	ret
    15cc:	4505                	li	a0,1
}
    15ce:	8082                	ret

00000000000015d0 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15d0:	fd05051b          	addiw	a0,a0,-48
}
    15d4:	00a53513          	sltiu	a0,a0,10
    15d8:	8082                	ret

00000000000015da <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15da:	02000613          	li	a2,32
    15de:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15e0:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e4:	0007079b          	sext.w	a5,a4
    15e8:	ff77869b          	addiw	a3,a5,-9
    15ec:	04c70b63          	beq	a4,a2,1642 <atoi+0x68>
    15f0:	04d5f963          	bleu	a3,a1,1642 <atoi+0x68>
        s++;
    switch (*s)
    15f4:	02b00693          	li	a3,43
    15f8:	04d70a63          	beq	a4,a3,164c <atoi+0x72>
    15fc:	02d00693          	li	a3,45
    1600:	06d70463          	beq	a4,a3,1668 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1604:	fd07859b          	addiw	a1,a5,-48
    1608:	4625                	li	a2,9
    160a:	873e                	mv	a4,a5
    160c:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    160e:	4e01                	li	t3,0
    while (isdigit(*s))
    1610:	04b66a63          	bltu	a2,a1,1664 <atoi+0x8a>
    int n = 0, neg = 0;
    1614:	4501                	li	a0,0
    while (isdigit(*s))
    1616:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    1618:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    161a:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    161e:	0025179b          	slliw	a5,a0,0x2
    1622:	9d3d                	addw	a0,a0,a5
    1624:	fd07031b          	addiw	t1,a4,-48
    1628:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    162c:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1630:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1634:	0006071b          	sext.w	a4,a2
    1638:	feb870e3          	bleu	a1,a6,1618 <atoi+0x3e>
    return neg ? n : -n;
    163c:	000e0563          	beqz	t3,1646 <atoi+0x6c>
}
    1640:	8082                	ret
        s++;
    1642:	0505                	addi	a0,a0,1
    1644:	bf71                	j	15e0 <atoi+0x6>
    1646:	4113053b          	subw	a0,t1,a7
    164a:	8082                	ret
    while (isdigit(*s))
    164c:	00154783          	lbu	a5,1(a0)
    1650:	4625                	li	a2,9
        s++;
    1652:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1656:	fd07859b          	addiw	a1,a5,-48
    165a:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    165e:	4e01                	li	t3,0
    while (isdigit(*s))
    1660:	fab67ae3          	bleu	a1,a2,1614 <atoi+0x3a>
    1664:	4501                	li	a0,0
}
    1666:	8082                	ret
    while (isdigit(*s))
    1668:	00154783          	lbu	a5,1(a0)
    166c:	4625                	li	a2,9
        s++;
    166e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1672:	fd07859b          	addiw	a1,a5,-48
    1676:	0007871b          	sext.w	a4,a5
    167a:	feb665e3          	bltu	a2,a1,1664 <atoi+0x8a>
        neg = 1;
    167e:	4e05                	li	t3,1
    1680:	bf51                	j	1614 <atoi+0x3a>

0000000000001682 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1682:	16060d63          	beqz	a2,17fc <memset+0x17a>
    1686:	40a007b3          	neg	a5,a0
    168a:	8b9d                	andi	a5,a5,7
    168c:	00778713          	addi	a4,a5,7
    1690:	482d                	li	a6,11
    1692:	0ff5f593          	andi	a1,a1,255
    1696:	fff60693          	addi	a3,a2,-1
    169a:	17076263          	bltu	a4,a6,17fe <memset+0x17c>
    169e:	16e6ea63          	bltu	a3,a4,1812 <memset+0x190>
    16a2:	16078563          	beqz	a5,180c <memset+0x18a>
    16a6:	00b50023          	sb	a1,0(a0)
    16aa:	4705                	li	a4,1
    16ac:	00150e93          	addi	t4,a0,1
    16b0:	14e78c63          	beq	a5,a4,1808 <memset+0x186>
    16b4:	00b500a3          	sb	a1,1(a0)
    16b8:	4709                	li	a4,2
    16ba:	00250e93          	addi	t4,a0,2
    16be:	14e78d63          	beq	a5,a4,1818 <memset+0x196>
    16c2:	00b50123          	sb	a1,2(a0)
    16c6:	470d                	li	a4,3
    16c8:	00350e93          	addi	t4,a0,3
    16cc:	12e78b63          	beq	a5,a4,1802 <memset+0x180>
    16d0:	00b501a3          	sb	a1,3(a0)
    16d4:	4711                	li	a4,4
    16d6:	00450e93          	addi	t4,a0,4
    16da:	14e78163          	beq	a5,a4,181c <memset+0x19a>
    16de:	00b50223          	sb	a1,4(a0)
    16e2:	4715                	li	a4,5
    16e4:	00550e93          	addi	t4,a0,5
    16e8:	12e78c63          	beq	a5,a4,1820 <memset+0x19e>
    16ec:	00b502a3          	sb	a1,5(a0)
    16f0:	471d                	li	a4,7
    16f2:	00650e93          	addi	t4,a0,6
    16f6:	12e79763          	bne	a5,a4,1824 <memset+0x1a2>
    16fa:	00750e93          	addi	t4,a0,7
    16fe:	00b50323          	sb	a1,6(a0)
    1702:	4f1d                	li	t5,7
    1704:	00859713          	slli	a4,a1,0x8
    1708:	8f4d                	or	a4,a4,a1
    170a:	01059e13          	slli	t3,a1,0x10
    170e:	01c76e33          	or	t3,a4,t3
    1712:	01859313          	slli	t1,a1,0x18
    1716:	006e6333          	or	t1,t3,t1
    171a:	02059893          	slli	a7,a1,0x20
    171e:	011368b3          	or	a7,t1,a7
    1722:	02859813          	slli	a6,a1,0x28
    1726:	40f60333          	sub	t1,a2,a5
    172a:	0108e833          	or	a6,a7,a6
    172e:	03059693          	slli	a3,a1,0x30
    1732:	00d866b3          	or	a3,a6,a3
    1736:	03859713          	slli	a4,a1,0x38
    173a:	97aa                	add	a5,a5,a0
    173c:	ff837813          	andi	a6,t1,-8
    1740:	8f55                	or	a4,a4,a3
    1742:	00f806b3          	add	a3,a6,a5
    1746:	e398                	sd	a4,0(a5)
    1748:	07a1                	addi	a5,a5,8
    174a:	fed79ee3          	bne	a5,a3,1746 <memset+0xc4>
    174e:	ff837693          	andi	a3,t1,-8
    1752:	00de87b3          	add	a5,t4,a3
    1756:	01e6873b          	addw	a4,a3,t5
    175a:	0ad30663          	beq	t1,a3,1806 <memset+0x184>
    175e:	00b78023          	sb	a1,0(a5)
    1762:	0017069b          	addiw	a3,a4,1
    1766:	08c6fb63          	bleu	a2,a3,17fc <memset+0x17a>
    176a:	00b780a3          	sb	a1,1(a5)
    176e:	0027069b          	addiw	a3,a4,2
    1772:	08c6f563          	bleu	a2,a3,17fc <memset+0x17a>
    1776:	00b78123          	sb	a1,2(a5)
    177a:	0037069b          	addiw	a3,a4,3
    177e:	06c6ff63          	bleu	a2,a3,17fc <memset+0x17a>
    1782:	00b781a3          	sb	a1,3(a5)
    1786:	0047069b          	addiw	a3,a4,4
    178a:	06c6f963          	bleu	a2,a3,17fc <memset+0x17a>
    178e:	00b78223          	sb	a1,4(a5)
    1792:	0057069b          	addiw	a3,a4,5
    1796:	06c6f363          	bleu	a2,a3,17fc <memset+0x17a>
    179a:	00b782a3          	sb	a1,5(a5)
    179e:	0067069b          	addiw	a3,a4,6
    17a2:	04c6fd63          	bleu	a2,a3,17fc <memset+0x17a>
    17a6:	00b78323          	sb	a1,6(a5)
    17aa:	0077069b          	addiw	a3,a4,7
    17ae:	04c6f763          	bleu	a2,a3,17fc <memset+0x17a>
    17b2:	00b783a3          	sb	a1,7(a5)
    17b6:	0087069b          	addiw	a3,a4,8
    17ba:	04c6f163          	bleu	a2,a3,17fc <memset+0x17a>
    17be:	00b78423          	sb	a1,8(a5)
    17c2:	0097069b          	addiw	a3,a4,9
    17c6:	02c6fb63          	bleu	a2,a3,17fc <memset+0x17a>
    17ca:	00b784a3          	sb	a1,9(a5)
    17ce:	00a7069b          	addiw	a3,a4,10
    17d2:	02c6f563          	bleu	a2,a3,17fc <memset+0x17a>
    17d6:	00b78523          	sb	a1,10(a5)
    17da:	00b7069b          	addiw	a3,a4,11
    17de:	00c6ff63          	bleu	a2,a3,17fc <memset+0x17a>
    17e2:	00b785a3          	sb	a1,11(a5)
    17e6:	00c7069b          	addiw	a3,a4,12
    17ea:	00c6f963          	bleu	a2,a3,17fc <memset+0x17a>
    17ee:	00b78623          	sb	a1,12(a5)
    17f2:	2735                	addiw	a4,a4,13
    17f4:	00c77463          	bleu	a2,a4,17fc <memset+0x17a>
    17f8:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17fc:	8082                	ret
    17fe:	472d                	li	a4,11
    1800:	bd79                	j	169e <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1802:	4f0d                	li	t5,3
    1804:	b701                	j	1704 <memset+0x82>
    1806:	8082                	ret
    1808:	4f05                	li	t5,1
    180a:	bded                	j	1704 <memset+0x82>
    180c:	8eaa                	mv	t4,a0
    180e:	4f01                	li	t5,0
    1810:	bdd5                	j	1704 <memset+0x82>
    1812:	87aa                	mv	a5,a0
    1814:	4701                	li	a4,0
    1816:	b7a1                	j	175e <memset+0xdc>
    1818:	4f09                	li	t5,2
    181a:	b5ed                	j	1704 <memset+0x82>
    181c:	4f11                	li	t5,4
    181e:	b5dd                	j	1704 <memset+0x82>
    1820:	4f15                	li	t5,5
    1822:	b5cd                	j	1704 <memset+0x82>
    1824:	4f19                	li	t5,6
    1826:	bdf9                	j	1704 <memset+0x82>

0000000000001828 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1828:	00054703          	lbu	a4,0(a0)
    182c:	0005c783          	lbu	a5,0(a1)
    1830:	00e79b63          	bne	a5,a4,1846 <strcmp+0x1e>
    1834:	cf89                	beqz	a5,184e <strcmp+0x26>
    1836:	0505                	addi	a0,a0,1
    1838:	0585                	addi	a1,a1,1
    183a:	0005c783          	lbu	a5,0(a1)
    183e:	00054703          	lbu	a4,0(a0)
    1842:	fef709e3          	beq	a4,a5,1834 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1846:	0007051b          	sext.w	a0,a4
}
    184a:	9d1d                	subw	a0,a0,a5
    184c:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    184e:	4501                	li	a0,0
}
    1850:	9d1d                	subw	a0,a0,a5
    1852:	8082                	ret

0000000000001854 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1854:	c231                	beqz	a2,1898 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1856:	00054783          	lbu	a5,0(a0)
    185a:	0005c683          	lbu	a3,0(a1)
    185e:	c795                	beqz	a5,188a <strncmp+0x36>
    1860:	ca85                	beqz	a3,1890 <strncmp+0x3c>
    if (!n--)
    1862:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1864:	c615                	beqz	a2,1890 <strncmp+0x3c>
    1866:	00150713          	addi	a4,a0,1
    186a:	9532                	add	a0,a0,a2
    186c:	00d78963          	beq	a5,a3,187e <strncmp+0x2a>
    1870:	a005                	j	1890 <strncmp+0x3c>
    1872:	ce99                	beqz	a3,1890 <strncmp+0x3c>
    1874:	00e50e63          	beq	a0,a4,1890 <strncmp+0x3c>
    1878:	0705                	addi	a4,a4,1
    187a:	00d79b63          	bne	a5,a3,1890 <strncmp+0x3c>
    187e:	00074783          	lbu	a5,0(a4)
    1882:	0585                	addi	a1,a1,1
    1884:	0005c683          	lbu	a3,0(a1)
    1888:	f7ed                	bnez	a5,1872 <strncmp+0x1e>
    188a:	4501                	li	a0,0
        ;
    return *l - *r;
    188c:	9d15                	subw	a0,a0,a3
    188e:	8082                	ret
    1890:	0007851b          	sext.w	a0,a5
    1894:	9d15                	subw	a0,a0,a3
    1896:	8082                	ret
        return 0;
    1898:	4501                	li	a0,0
}
    189a:	8082                	ret

000000000000189c <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    189c:	00757793          	andi	a5,a0,7
    18a0:	cfa1                	beqz	a5,18f8 <strlen+0x5c>
        if (!*s)
    18a2:	00054783          	lbu	a5,0(a0)
    18a6:	cbb9                	beqz	a5,18fc <strlen+0x60>
    18a8:	87aa                	mv	a5,a0
    18aa:	a021                	j	18b2 <strlen+0x16>
    18ac:	0007c703          	lbu	a4,0(a5)
    18b0:	c329                	beqz	a4,18f2 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    18b2:	0785                	addi	a5,a5,1
    18b4:	0077f713          	andi	a4,a5,7
    18b8:	fb75                	bnez	a4,18ac <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18ba:	00000717          	auipc	a4,0x0
    18be:	7e670713          	addi	a4,a4,2022 # 20a0 <__clone+0xae>
    18c2:	630c                	ld	a1,0(a4)
    18c4:	00000717          	auipc	a4,0x0
    18c8:	7e470713          	addi	a4,a4,2020 # 20a8 <__clone+0xb6>
    18cc:	6394                	ld	a3,0(a5)
    18ce:	6310                	ld	a2,0(a4)
    18d0:	a019                	j	18d6 <strlen+0x3a>
    18d2:	07a1                	addi	a5,a5,8
    18d4:	6394                	ld	a3,0(a5)
    18d6:	00b68733          	add	a4,a3,a1
    18da:	fff6c693          	not	a3,a3
    18de:	8f75                	and	a4,a4,a3
    18e0:	8f71                	and	a4,a4,a2
    18e2:	db65                	beqz	a4,18d2 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18e4:	0007c703          	lbu	a4,0(a5)
    18e8:	c709                	beqz	a4,18f2 <strlen+0x56>
    18ea:	0785                	addi	a5,a5,1
    18ec:	0007c703          	lbu	a4,0(a5)
    18f0:	ff6d                	bnez	a4,18ea <strlen+0x4e>
        ;
    return s - a;
    18f2:	40a78533          	sub	a0,a5,a0
}
    18f6:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18f8:	87aa                	mv	a5,a0
    18fa:	b7c1                	j	18ba <strlen+0x1e>
        if (!*s)
    18fc:	4501                	li	a0,0
            return s - a;
    18fe:	8082                	ret

0000000000001900 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1900:	00757793          	andi	a5,a0,7
    1904:	0ff5f593          	andi	a1,a1,255
    1908:	cb99                	beqz	a5,191e <memchr+0x1e>
    190a:	c655                	beqz	a2,19b6 <memchr+0xb6>
    190c:	00054783          	lbu	a5,0(a0)
    1910:	0ab78663          	beq	a5,a1,19bc <memchr+0xbc>
    1914:	0505                	addi	a0,a0,1
    1916:	00757793          	andi	a5,a0,7
    191a:	167d                	addi	a2,a2,-1
    191c:	f7fd                	bnez	a5,190a <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    191e:	4701                	li	a4,0
    if (n && *s != c)
    1920:	ca49                	beqz	a2,19b2 <memchr+0xb2>
    1922:	00054783          	lbu	a5,0(a0)
    1926:	08b78b63          	beq	a5,a1,19bc <memchr+0xbc>
        size_t k = ONES * c;
    192a:	00000797          	auipc	a5,0x0
    192e:	78678793          	addi	a5,a5,1926 # 20b0 <__clone+0xbe>
    1932:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1934:	479d                	li	a5,7
        size_t k = ONES * c;
    1936:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    193a:	08c7f863          	bleu	a2,a5,19ca <memchr+0xca>
    193e:	611c                	ld	a5,0(a0)
    1940:	00000317          	auipc	t1,0x0
    1944:	76830313          	addi	t1,t1,1896 # 20a8 <__clone+0xb6>
    1948:	00033803          	ld	a6,0(t1)
    194c:	00f8c7b3          	xor	a5,a7,a5
    1950:	fff7c713          	not	a4,a5
    1954:	8f95                	sub	a5,a5,a3
    1956:	8ff9                	and	a5,a5,a4
    1958:	0107f7b3          	and	a5,a5,a6
    195c:	e7bd                	bnez	a5,19ca <memchr+0xca>
    195e:	4e1d                	li	t3,7
    1960:	00000e97          	auipc	t4,0x0
    1964:	740e8e93          	addi	t4,t4,1856 # 20a0 <__clone+0xae>
    1968:	a005                	j	1988 <memchr+0x88>
    196a:	6514                	ld	a3,8(a0)
    196c:	000eb783          	ld	a5,0(t4)
    1970:	00033803          	ld	a6,0(t1)
    1974:	00d8c6b3          	xor	a3,a7,a3
    1978:	97b6                	add	a5,a5,a3
    197a:	fff6c693          	not	a3,a3
    197e:	8ff5                	and	a5,a5,a3
    1980:	0107f7b3          	and	a5,a5,a6
    1984:	e3a1                	bnez	a5,19c4 <memchr+0xc4>
    1986:	853a                	mv	a0,a4
    1988:	1661                	addi	a2,a2,-8
    198a:	00850713          	addi	a4,a0,8
    198e:	fcce6ee3          	bltu	t3,a2,196a <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1992:	c215                	beqz	a2,19b6 <memchr+0xb6>
    1994:	00074783          	lbu	a5,0(a4)
    1998:	00f58d63          	beq	a1,a5,19b2 <memchr+0xb2>
    199c:	00170793          	addi	a5,a4,1
    19a0:	963a                	add	a2,a2,a4
    19a2:	873e                	mv	a4,a5
    19a4:	00f60963          	beq	a2,a5,19b6 <memchr+0xb6>
    19a8:	0007c683          	lbu	a3,0(a5)
    19ac:	0785                	addi	a5,a5,1
    19ae:	feb69ae3          	bne	a3,a1,19a2 <memchr+0xa2>
}
    19b2:	853a                	mv	a0,a4
    19b4:	8082                	ret
    return n ? (void *)s : 0;
    19b6:	4701                	li	a4,0
}
    19b8:	853a                	mv	a0,a4
    19ba:	8082                	ret
    19bc:	872a                	mv	a4,a0
    19be:	00074783          	lbu	a5,0(a4)
    19c2:	bfd9                	j	1998 <memchr+0x98>
    19c4:	00854783          	lbu	a5,8(a0)
    19c8:	bfc1                	j	1998 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19ca:	872a                	mv	a4,a0
    19cc:	bfc1                	j	199c <memchr+0x9c>

00000000000019ce <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19ce:	00757793          	andi	a5,a0,7
    19d2:	cfc5                	beqz	a5,1a8a <strnlen+0xbc>
    19d4:	c1c5                	beqz	a1,1a74 <strnlen+0xa6>
    19d6:	00054783          	lbu	a5,0(a0)
    19da:	cfd9                	beqz	a5,1a78 <strnlen+0xaa>
    19dc:	87ae                	mv	a5,a1
    19de:	86aa                	mv	a3,a0
    19e0:	a029                	j	19ea <strnlen+0x1c>
    19e2:	cbc9                	beqz	a5,1a74 <strnlen+0xa6>
    19e4:	0006c703          	lbu	a4,0(a3)
    19e8:	cb51                	beqz	a4,1a7c <strnlen+0xae>
    19ea:	0685                	addi	a3,a3,1
    19ec:	0076f713          	andi	a4,a3,7
    19f0:	17fd                	addi	a5,a5,-1
    19f2:	fb65                	bnez	a4,19e2 <strnlen+0x14>
    if (n && *s != c)
    19f4:	c3c1                	beqz	a5,1a74 <strnlen+0xa6>
    19f6:	0006c703          	lbu	a4,0(a3)
    19fa:	c349                	beqz	a4,1a7c <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19fc:	471d                	li	a4,7
    19fe:	08f77a63          	bleu	a5,a4,1a92 <strnlen+0xc4>
    1a02:	00000e17          	auipc	t3,0x0
    1a06:	69ee0e13          	addi	t3,t3,1694 # 20a0 <__clone+0xae>
    1a0a:	6290                	ld	a2,0(a3)
    1a0c:	000e3703          	ld	a4,0(t3)
    1a10:	00000e97          	auipc	t4,0x0
    1a14:	698e8e93          	addi	t4,t4,1688 # 20a8 <__clone+0xb6>
    1a18:	000eb803          	ld	a6,0(t4)
    1a1c:	9732                	add	a4,a4,a2
    1a1e:	fff64613          	not	a2,a2
    1a22:	8f71                	and	a4,a4,a2
    1a24:	01077733          	and	a4,a4,a6
    1a28:	e72d                	bnez	a4,1a92 <strnlen+0xc4>
    1a2a:	4f1d                	li	t5,7
    1a2c:	a839                	j	1a4a <strnlen+0x7c>
    1a2e:	6698                	ld	a4,8(a3)
    1a30:	000e3303          	ld	t1,0(t3)
    1a34:	000eb803          	ld	a6,0(t4)
    1a38:	fff74893          	not	a7,a4
    1a3c:	971a                	add	a4,a4,t1
    1a3e:	01177733          	and	a4,a4,a7
    1a42:	01077733          	and	a4,a4,a6
    1a46:	ef1d                	bnez	a4,1a84 <strnlen+0xb6>
    1a48:	86b2                	mv	a3,a2
    1a4a:	17e1                	addi	a5,a5,-8
    1a4c:	00868613          	addi	a2,a3,8
    1a50:	fcff6fe3          	bltu	t5,a5,1a2e <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a54:	c385                	beqz	a5,1a74 <strnlen+0xa6>
    1a56:	00064703          	lbu	a4,0(a2)
    1a5a:	cb19                	beqz	a4,1a70 <strnlen+0xa2>
    1a5c:	00160713          	addi	a4,a2,1
    1a60:	97b2                	add	a5,a5,a2
    1a62:	863a                	mv	a2,a4
    1a64:	00e78863          	beq	a5,a4,1a74 <strnlen+0xa6>
    1a68:	0705                	addi	a4,a4,1
    1a6a:	fff74683          	lbu	a3,-1(a4)
    1a6e:	faf5                	bnez	a3,1a62 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a70:	40a605b3          	sub	a1,a2,a0
}
    1a74:	852e                	mv	a0,a1
    1a76:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a78:	87ae                	mv	a5,a1
    1a7a:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a7c:	8636                	mv	a2,a3
    1a7e:	00064703          	lbu	a4,0(a2)
    1a82:	bfe1                	j	1a5a <strnlen+0x8c>
    1a84:	0086c703          	lbu	a4,8(a3)
    1a88:	bfc9                	j	1a5a <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a8a:	87ae                	mv	a5,a1
    1a8c:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a8e:	f7a5                	bnez	a5,19f6 <strnlen+0x28>
    1a90:	b7d5                	j	1a74 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a92:	8636                	mv	a2,a3
    1a94:	b7e1                	j	1a5c <strnlen+0x8e>

0000000000001a96 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a96:	00b547b3          	xor	a5,a0,a1
    1a9a:	8b9d                	andi	a5,a5,7
    1a9c:	efa9                	bnez	a5,1af6 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a9e:	0075f793          	andi	a5,a1,7
    1aa2:	c38d                	beqz	a5,1ac4 <strcpy+0x2e>
            if (!(*d = *s))
    1aa4:	0005c783          	lbu	a5,0(a1)
    1aa8:	00f50023          	sb	a5,0(a0)
    1aac:	e799                	bnez	a5,1aba <strcpy+0x24>
    1aae:	a095                	j	1b12 <strcpy+0x7c>
    1ab0:	0005c783          	lbu	a5,0(a1)
    1ab4:	00f50023          	sb	a5,0(a0)
    1ab8:	cbb9                	beqz	a5,1b0e <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1aba:	0585                	addi	a1,a1,1
    1abc:	0075f793          	andi	a5,a1,7
    1ac0:	0505                	addi	a0,a0,1
    1ac2:	f7fd                	bnez	a5,1ab0 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1ac4:	00000797          	auipc	a5,0x0
    1ac8:	5dc78793          	addi	a5,a5,1500 # 20a0 <__clone+0xae>
    1acc:	0007b803          	ld	a6,0(a5)
    1ad0:	00000797          	auipc	a5,0x0
    1ad4:	5d878793          	addi	a5,a5,1496 # 20a8 <__clone+0xb6>
    1ad8:	6198                	ld	a4,0(a1)
    1ada:	6390                	ld	a2,0(a5)
    1adc:	a031                	j	1ae8 <strcpy+0x52>
    1ade:	0521                	addi	a0,a0,8
    1ae0:	05a1                	addi	a1,a1,8
    1ae2:	fee53c23          	sd	a4,-8(a0)
    1ae6:	6198                	ld	a4,0(a1)
    1ae8:	010707b3          	add	a5,a4,a6
    1aec:	fff74693          	not	a3,a4
    1af0:	8ff5                	and	a5,a5,a3
    1af2:	8ff1                	and	a5,a5,a2
    1af4:	d7ed                	beqz	a5,1ade <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1af6:	0005c783          	lbu	a5,0(a1)
    1afa:	00f50023          	sb	a5,0(a0)
    1afe:	cb89                	beqz	a5,1b10 <strcpy+0x7a>
    1b00:	0585                	addi	a1,a1,1
    1b02:	0005c783          	lbu	a5,0(a1)
    1b06:	0505                	addi	a0,a0,1
    1b08:	00f50023          	sb	a5,0(a0)
    1b0c:	fbf5                	bnez	a5,1b00 <strcpy+0x6a>
        ;
    return d;
}
    1b0e:	8082                	ret
    1b10:	8082                	ret
    1b12:	8082                	ret

0000000000001b14 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b14:	00b547b3          	xor	a5,a0,a1
    1b18:	8b9d                	andi	a5,a5,7
    1b1a:	ebc1                	bnez	a5,1baa <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b1c:	0075f793          	andi	a5,a1,7
    1b20:	cf91                	beqz	a5,1b3c <strncpy+0x28>
    1b22:	20060e63          	beqz	a2,1d3e <strncpy+0x22a>
    1b26:	0005c783          	lbu	a5,0(a1)
    1b2a:	00f50023          	sb	a5,0(a0)
    1b2e:	c3d5                	beqz	a5,1bd2 <strncpy+0xbe>
    1b30:	0585                	addi	a1,a1,1
    1b32:	0075f793          	andi	a5,a1,7
    1b36:	167d                	addi	a2,a2,-1
    1b38:	0505                	addi	a0,a0,1
    1b3a:	f7e5                	bnez	a5,1b22 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b3c:	20060163          	beqz	a2,1d3e <strncpy+0x22a>
    1b40:	0005c683          	lbu	a3,0(a1)
    1b44:	c6d9                	beqz	a3,1bd2 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b46:	479d                	li	a5,7
    1b48:	22c7f563          	bleu	a2,a5,1d72 <strncpy+0x25e>
    1b4c:	00000317          	auipc	t1,0x0
    1b50:	55430313          	addi	t1,t1,1364 # 20a0 <__clone+0xae>
    1b54:	6198                	ld	a4,0(a1)
    1b56:	00033783          	ld	a5,0(t1)
    1b5a:	00000e17          	auipc	t3,0x0
    1b5e:	54ee0e13          	addi	t3,t3,1358 # 20a8 <__clone+0xb6>
    1b62:	000e3803          	ld	a6,0(t3)
    1b66:	97ba                	add	a5,a5,a4
    1b68:	fff74893          	not	a7,a4
    1b6c:	0117f7b3          	and	a5,a5,a7
    1b70:	0107f7b3          	and	a5,a5,a6
    1b74:	1e079f63          	bnez	a5,1d72 <strncpy+0x25e>
    1b78:	4e9d                	li	t4,7
    1b7a:	a005                	j	1b9a <strncpy+0x86>
    1b7c:	6598                	ld	a4,8(a1)
    1b7e:	00033783          	ld	a5,0(t1)
    1b82:	000e3803          	ld	a6,0(t3)
    1b86:	fff74893          	not	a7,a4
    1b8a:	97ba                	add	a5,a5,a4
    1b8c:	0117f7b3          	and	a5,a5,a7
    1b90:	0107f7b3          	and	a5,a5,a6
    1b94:	1a079f63          	bnez	a5,1d52 <strncpy+0x23e>
    1b98:	85b6                	mv	a1,a3
            *wd = *ws;
    1b9a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b9c:	1661                	addi	a2,a2,-8
    1b9e:	00858693          	addi	a3,a1,8
    1ba2:	0521                	addi	a0,a0,8
    1ba4:	fcceece3          	bltu	t4,a2,1b7c <strncpy+0x68>
    1ba8:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1baa:	18060a63          	beqz	a2,1d3e <strncpy+0x22a>
    1bae:	0005c783          	lbu	a5,0(a1)
    1bb2:	872a                	mv	a4,a0
    1bb4:	00f50023          	sb	a5,0(a0)
    1bb8:	e799                	bnez	a5,1bc6 <strncpy+0xb2>
    1bba:	a829                	j	1bd4 <strncpy+0xc0>
    1bbc:	0005c783          	lbu	a5,0(a1)
    1bc0:	00f70023          	sb	a5,0(a4)
    1bc4:	cb81                	beqz	a5,1bd4 <strncpy+0xc0>
    1bc6:	167d                	addi	a2,a2,-1
    1bc8:	0585                	addi	a1,a1,1
    1bca:	0705                	addi	a4,a4,1
    1bcc:	fa65                	bnez	a2,1bbc <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1bce:	853a                	mv	a0,a4
    1bd0:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1bd2:	872a                	mv	a4,a0
    1bd4:	4805                	li	a6,1
    1bd6:	14061c63          	bnez	a2,1d2e <strncpy+0x21a>
    1bda:	40e007b3          	neg	a5,a4
    1bde:	8b9d                	andi	a5,a5,7
    1be0:	4581                	li	a1,0
    1be2:	12061e63          	bnez	a2,1d1e <strncpy+0x20a>
    1be6:	00778693          	addi	a3,a5,7
    1bea:	452d                	li	a0,11
    1bec:	12a6e763          	bltu	a3,a0,1d1a <strncpy+0x206>
    1bf0:	16d5e663          	bltu	a1,a3,1d5c <strncpy+0x248>
    1bf4:	14078c63          	beqz	a5,1d4c <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bf8:	00070023          	sb	zero,0(a4)
    1bfc:	4585                	li	a1,1
    1bfe:	00170693          	addi	a3,a4,1
    1c02:	14b78363          	beq	a5,a1,1d48 <strncpy+0x234>
    1c06:	000700a3          	sb	zero,1(a4)
    1c0a:	4589                	li	a1,2
    1c0c:	00270693          	addi	a3,a4,2
    1c10:	14b78963          	beq	a5,a1,1d62 <strncpy+0x24e>
    1c14:	00070123          	sb	zero,2(a4)
    1c18:	458d                	li	a1,3
    1c1a:	00370693          	addi	a3,a4,3
    1c1e:	12b78363          	beq	a5,a1,1d44 <strncpy+0x230>
    1c22:	000701a3          	sb	zero,3(a4)
    1c26:	4591                	li	a1,4
    1c28:	00470693          	addi	a3,a4,4
    1c2c:	12b78d63          	beq	a5,a1,1d66 <strncpy+0x252>
    1c30:	00070223          	sb	zero,4(a4)
    1c34:	4595                	li	a1,5
    1c36:	00570693          	addi	a3,a4,5
    1c3a:	12b78863          	beq	a5,a1,1d6a <strncpy+0x256>
    1c3e:	000702a3          	sb	zero,5(a4)
    1c42:	459d                	li	a1,7
    1c44:	00670693          	addi	a3,a4,6
    1c48:	12b79363          	bne	a5,a1,1d6e <strncpy+0x25a>
    1c4c:	00770693          	addi	a3,a4,7
    1c50:	00070323          	sb	zero,6(a4)
    1c54:	40f80833          	sub	a6,a6,a5
    1c58:	ff887513          	andi	a0,a6,-8
    1c5c:	97ba                	add	a5,a5,a4
    1c5e:	953e                	add	a0,a0,a5
    1c60:	0007b023          	sd	zero,0(a5)
    1c64:	07a1                	addi	a5,a5,8
    1c66:	fea79de3          	bne	a5,a0,1c60 <strncpy+0x14c>
    1c6a:	ff887513          	andi	a0,a6,-8
    1c6e:	9da9                	addw	a1,a1,a0
    1c70:	00a687b3          	add	a5,a3,a0
    1c74:	f4a80de3          	beq	a6,a0,1bce <strncpy+0xba>
    1c78:	00078023          	sb	zero,0(a5)
    1c7c:	0015869b          	addiw	a3,a1,1
    1c80:	f4c6f7e3          	bleu	a2,a3,1bce <strncpy+0xba>
    1c84:	000780a3          	sb	zero,1(a5)
    1c88:	0025869b          	addiw	a3,a1,2
    1c8c:	f4c6f1e3          	bleu	a2,a3,1bce <strncpy+0xba>
    1c90:	00078123          	sb	zero,2(a5)
    1c94:	0035869b          	addiw	a3,a1,3
    1c98:	f2c6fbe3          	bleu	a2,a3,1bce <strncpy+0xba>
    1c9c:	000781a3          	sb	zero,3(a5)
    1ca0:	0045869b          	addiw	a3,a1,4
    1ca4:	f2c6f5e3          	bleu	a2,a3,1bce <strncpy+0xba>
    1ca8:	00078223          	sb	zero,4(a5)
    1cac:	0055869b          	addiw	a3,a1,5
    1cb0:	f0c6ffe3          	bleu	a2,a3,1bce <strncpy+0xba>
    1cb4:	000782a3          	sb	zero,5(a5)
    1cb8:	0065869b          	addiw	a3,a1,6
    1cbc:	f0c6f9e3          	bleu	a2,a3,1bce <strncpy+0xba>
    1cc0:	00078323          	sb	zero,6(a5)
    1cc4:	0075869b          	addiw	a3,a1,7
    1cc8:	f0c6f3e3          	bleu	a2,a3,1bce <strncpy+0xba>
    1ccc:	000783a3          	sb	zero,7(a5)
    1cd0:	0085869b          	addiw	a3,a1,8
    1cd4:	eec6fde3          	bleu	a2,a3,1bce <strncpy+0xba>
    1cd8:	00078423          	sb	zero,8(a5)
    1cdc:	0095869b          	addiw	a3,a1,9
    1ce0:	eec6f7e3          	bleu	a2,a3,1bce <strncpy+0xba>
    1ce4:	000784a3          	sb	zero,9(a5)
    1ce8:	00a5869b          	addiw	a3,a1,10
    1cec:	eec6f1e3          	bleu	a2,a3,1bce <strncpy+0xba>
    1cf0:	00078523          	sb	zero,10(a5)
    1cf4:	00b5869b          	addiw	a3,a1,11
    1cf8:	ecc6fbe3          	bleu	a2,a3,1bce <strncpy+0xba>
    1cfc:	000785a3          	sb	zero,11(a5)
    1d00:	00c5869b          	addiw	a3,a1,12
    1d04:	ecc6f5e3          	bleu	a2,a3,1bce <strncpy+0xba>
    1d08:	00078623          	sb	zero,12(a5)
    1d0c:	25b5                	addiw	a1,a1,13
    1d0e:	ecc5f0e3          	bleu	a2,a1,1bce <strncpy+0xba>
    1d12:	000786a3          	sb	zero,13(a5)
}
    1d16:	853a                	mv	a0,a4
    1d18:	8082                	ret
    1d1a:	46ad                	li	a3,11
    1d1c:	bdd1                	j	1bf0 <strncpy+0xdc>
    1d1e:	00778693          	addi	a3,a5,7
    1d22:	452d                	li	a0,11
    1d24:	fff60593          	addi	a1,a2,-1
    1d28:	eca6f4e3          	bleu	a0,a3,1bf0 <strncpy+0xdc>
    1d2c:	b7fd                	j	1d1a <strncpy+0x206>
    1d2e:	40e007b3          	neg	a5,a4
    1d32:	8832                	mv	a6,a2
    1d34:	8b9d                	andi	a5,a5,7
    1d36:	4581                	li	a1,0
    1d38:	ea0607e3          	beqz	a2,1be6 <strncpy+0xd2>
    1d3c:	b7cd                	j	1d1e <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d3e:	872a                	mv	a4,a0
}
    1d40:	853a                	mv	a0,a4
    1d42:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d44:	458d                	li	a1,3
    1d46:	b739                	j	1c54 <strncpy+0x140>
    1d48:	4585                	li	a1,1
    1d4a:	b729                	j	1c54 <strncpy+0x140>
    1d4c:	86ba                	mv	a3,a4
    1d4e:	4581                	li	a1,0
    1d50:	b711                	j	1c54 <strncpy+0x140>
    1d52:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d56:	872a                	mv	a4,a0
    1d58:	85b6                	mv	a1,a3
    1d5a:	bda9                	j	1bb4 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d5c:	87ba                	mv	a5,a4
    1d5e:	4581                	li	a1,0
    1d60:	bf21                	j	1c78 <strncpy+0x164>
    1d62:	4589                	li	a1,2
    1d64:	bdc5                	j	1c54 <strncpy+0x140>
    1d66:	4591                	li	a1,4
    1d68:	b5f5                	j	1c54 <strncpy+0x140>
    1d6a:	4595                	li	a1,5
    1d6c:	b5e5                	j	1c54 <strncpy+0x140>
    1d6e:	4599                	li	a1,6
    1d70:	b5d5                	j	1c54 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d72:	00d50023          	sb	a3,0(a0)
    1d76:	872a                	mv	a4,a0
    1d78:	b5b9                	j	1bc6 <strncpy+0xb2>

0000000000001d7a <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d7a:	87aa                	mv	a5,a0
    1d7c:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d7e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d82:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d86:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d88:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d8a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <openat>:
    register long a7 __asm__("a7") = n;
    1d92:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d96:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d9a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <close>:
    register long a7 __asm__("a7") = n;
    1da2:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1da6:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1daa:	2501                	sext.w	a0,a0
    1dac:	8082                	ret

0000000000001dae <read>:
    register long a7 __asm__("a7") = n;
    1dae:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db2:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1db6:	8082                	ret

0000000000001db8 <write>:
    register long a7 __asm__("a7") = n;
    1db8:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dbc:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1dc0:	8082                	ret

0000000000001dc2 <getpid>:
    register long a7 __asm__("a7") = n;
    1dc2:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1dc6:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <getppid>:
    register long a7 __asm__("a7") = n;
    1dce:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1dd2:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dda:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1dde:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <fork>:
    register long a7 __asm__("a7") = n;
    1de6:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1dea:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1dec:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dee:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1df6:	85b2                	mv	a1,a2
    1df8:	863a                	mv	a2,a4
    if (stack)
    1dfa:	c191                	beqz	a1,1dfe <clone+0x8>
	stack += stack_size;
    1dfc:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dfe:	4781                	li	a5,0
    1e00:	4701                	li	a4,0
    1e02:	4681                	li	a3,0
    1e04:	2601                	sext.w	a2,a2
    1e06:	1ec0006f          	j	1ff2 <__clone>

0000000000001e0a <exit>:
    register long a7 __asm__("a7") = n;
    1e0a:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e0e:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e12:	8082                	ret

0000000000001e14 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e14:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e18:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e1a:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <exec>:
    register long a7 __asm__("a7") = n;
    1e22:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e26:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <execve>:
    register long a7 __asm__("a7") = n;
    1e2e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e32:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e36:	2501                	sext.w	a0,a0
    1e38:	8082                	ret

0000000000001e3a <times>:
    register long a7 __asm__("a7") = n;
    1e3a:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e3e:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <get_time>:

int64 get_time()
{
    1e46:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e48:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e4c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e4e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e50:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e54:	2501                	sext.w	a0,a0
    1e56:	ed09                	bnez	a0,1e70 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e58:	67a2                	ld	a5,8(sp)
    1e5a:	3e800713          	li	a4,1000
    1e5e:	00015503          	lhu	a0,0(sp)
    1e62:	02e7d7b3          	divu	a5,a5,a4
    1e66:	02e50533          	mul	a0,a0,a4
    1e6a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e6c:	0141                	addi	sp,sp,16
    1e6e:	8082                	ret
        return -1;
    1e70:	557d                	li	a0,-1
    1e72:	bfed                	j	1e6c <get_time+0x26>

0000000000001e74 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e74:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e78:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e7c:	2501                	sext.w	a0,a0
    1e7e:	8082                	ret

0000000000001e80 <time>:
    register long a7 __asm__("a7") = n;
    1e80:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e84:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e88:	2501                	sext.w	a0,a0
    1e8a:	8082                	ret

0000000000001e8c <sleep>:

int sleep(unsigned long long time)
{
    1e8c:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e8e:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e90:	850a                	mv	a0,sp
    1e92:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e94:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e98:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9a:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e9e:	e501                	bnez	a0,1ea6 <sleep+0x1a>
    return 0;
    1ea0:	4501                	li	a0,0
}
    1ea2:	0141                	addi	sp,sp,16
    1ea4:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ea6:	4502                	lw	a0,0(sp)
}
    1ea8:	0141                	addi	sp,sp,16
    1eaa:	8082                	ret

0000000000001eac <set_priority>:
    register long a7 __asm__("a7") = n;
    1eac:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1eb0:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1eb8:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1ebc:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1ec0:	8082                	ret

0000000000001ec2 <munmap>:
    register long a7 __asm__("a7") = n;
    1ec2:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec6:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <wait>:

int wait(int *code)
{
    1ece:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ed0:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ed4:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ed6:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1ed8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1eda:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <spawn>:
    register long a7 __asm__("a7") = n;
    1ee2:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ee6:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1eea:	2501                	sext.w	a0,a0
    1eec:	8082                	ret

0000000000001eee <mailread>:
    register long a7 __asm__("a7") = n;
    1eee:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef2:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ef6:	2501                	sext.w	a0,a0
    1ef8:	8082                	ret

0000000000001efa <mailwrite>:
    register long a7 __asm__("a7") = n;
    1efa:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1efe:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f02:	2501                	sext.w	a0,a0
    1f04:	8082                	ret

0000000000001f06 <fstat>:
    register long a7 __asm__("a7") = n;
    1f06:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f0a:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f0e:	2501                	sext.w	a0,a0
    1f10:	8082                	ret

0000000000001f12 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1f12:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f14:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f18:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f1a:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f1e:	2501                	sext.w	a0,a0
    1f20:	8082                	ret

0000000000001f22 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f22:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f24:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f28:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f2a:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f2e:	2501                	sext.w	a0,a0
    1f30:	8082                	ret

0000000000001f32 <link>:

int link(char *old_path, char *new_path)
{
    1f32:	87aa                	mv	a5,a0
    1f34:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f36:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f3a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f3e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f40:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f44:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f46:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f4a:	2501                	sext.w	a0,a0
    1f4c:	8082                	ret

0000000000001f4e <unlink>:

int unlink(char *path)
{
    1f4e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f50:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f54:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f58:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f5a:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f5e:	2501                	sext.w	a0,a0
    1f60:	8082                	ret

0000000000001f62 <uname>:
    register long a7 __asm__("a7") = n;
    1f62:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f66:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f6a:	2501                	sext.w	a0,a0
    1f6c:	8082                	ret

0000000000001f6e <brk>:
    register long a7 __asm__("a7") = n;
    1f6e:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f72:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f76:	2501                	sext.w	a0,a0
    1f78:	8082                	ret

0000000000001f7a <getcwd>:
    register long a7 __asm__("a7") = n;
    1f7a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f7c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f80:	8082                	ret

0000000000001f82 <chdir>:
    register long a7 __asm__("a7") = n;
    1f82:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f86:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f8a:	2501                	sext.w	a0,a0
    1f8c:	8082                	ret

0000000000001f8e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f8e:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f90:	02059613          	slli	a2,a1,0x20
    1f94:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f96:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f9a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f9e:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fa0:	00000073          	ecall
}
    1fa4:	2501                	sext.w	a0,a0
    1fa6:	8082                	ret

0000000000001fa8 <getdents>:
    register long a7 __asm__("a7") = n;
    1fa8:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fac:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1fb0:	2501                	sext.w	a0,a0
    1fb2:	8082                	ret

0000000000001fb4 <pipe>:
    register long a7 __asm__("a7") = n;
    1fb4:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1fb8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fba:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1fbe:	2501                	sext.w	a0,a0
    1fc0:	8082                	ret

0000000000001fc2 <dup>:
    register long a7 __asm__("a7") = n;
    1fc2:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1fc4:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1fc8:	2501                	sext.w	a0,a0
    1fca:	8082                	ret

0000000000001fcc <dup2>:
    register long a7 __asm__("a7") = n;
    1fcc:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fce:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fd0:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fd4:	2501                	sext.w	a0,a0
    1fd6:	8082                	ret

0000000000001fd8 <mount>:
    register long a7 __asm__("a7") = n;
    1fd8:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fdc:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fe0:	2501                	sext.w	a0,a0
    1fe2:	8082                	ret

0000000000001fe4 <umount>:
    register long a7 __asm__("a7") = n;
    1fe4:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fe8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fea:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fee:	2501                	sext.w	a0,a0
    1ff0:	8082                	ret

0000000000001ff2 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ff2:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1ff4:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ff6:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ff8:	8532                	mv	a0,a2
	mv a2, a4
    1ffa:	863a                	mv	a2,a4
	mv a3, a5
    1ffc:	86be                	mv	a3,a5
	mv a4, a6
    1ffe:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    2000:	0dc00893          	li	a7,220
	ecall
    2004:	00000073          	ecall

	beqz a0, 1f
    2008:	c111                	beqz	a0,200c <__clone+0x1a>
	# Parent
	ret
    200a:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    200c:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    200e:	6522                	ld	a0,8(sp)
	jalr a1
    2010:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    2012:	05d00893          	li	a7,93
	ecall
    2016:	00000073          	ecall
