
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/fstat:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0d00006f          	j	10d2 <__start_main>

0000000000001006 <test_fstat>:

#define AT_FDCWD (-100) //相对路径

//Stat *kst;
static struct kstat kst;
void test_fstat() {
    1006:	1101                	addi	sp,sp,-32
	TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	00850513          	addi	a0,a0,8 # 2010 <__clone+0x2e>
void test_fstat() {
    1010:	ec06                	sd	ra,24(sp)
    1012:	e822                	sd	s0,16(sp)
	TEST_START(__func__);
    1014:	2be000ef          	jal	ra,12d2 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	17050513          	addi	a0,a0,368 # 2188 <__func__.1186>
    1020:	2b2000ef          	jal	ra,12d2 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	00450513          	addi	a0,a0,4 # 2028 <__clone+0x46>
    102c:	2a6000ef          	jal	ra,12d2 <puts>
	int fd = open("./text.txt", 0);
    1030:	4581                	li	a1,0
    1032:	00001517          	auipc	a0,0x1
    1036:	00650513          	addi	a0,a0,6 # 2038 <__clone+0x56>
    103a:	531000ef          	jal	ra,1d6a <open>
	int ret = fstat(fd, &kst);
    103e:	00001597          	auipc	a1,0x1
    1042:	0ca58593          	addi	a1,a1,202 # 2108 <kst>
    1046:	6b1000ef          	jal	ra,1ef6 <fstat>
    104a:	842a                	mv	s0,a0
	printf("fstat ret: %d\n", ret);
    104c:	85aa                	mv	a1,a0
    104e:	00001517          	auipc	a0,0x1
    1052:	ffa50513          	addi	a0,a0,-6 # 2048 <__clone+0x66>
    1056:	29e000ef          	jal	ra,12f4 <printf>
	assert(ret >= 0);
    105a:	04044d63          	bltz	s0,10b4 <test_fstat+0xae>

	printf("fstat: dev: %d, inode: %d, mode: %d, nlink: %d, size: %d, atime: %d, mtime: %d, ctime: %d\n",
    105e:	00001597          	auipc	a1,0x1
    1062:	0aa58593          	addi	a1,a1,170 # 2108 <kst>
    1066:	0685b303          	ld	t1,104(a1)
    106a:	0585b883          	ld	a7,88(a1)
    106e:	0485b803          	ld	a6,72(a1)
    1072:	799c                	ld	a5,48(a1)
    1074:	49d8                	lw	a4,20(a1)
    1076:	4994                	lw	a3,16(a1)
    1078:	6590                	ld	a2,8(a1)
    107a:	618c                	ld	a1,0(a1)
    107c:	00001517          	auipc	a0,0x1
    1080:	ffc50513          	addi	a0,a0,-4 # 2078 <__clone+0x96>
    1084:	e01a                	sd	t1,0(sp)
    1086:	26e000ef          	jal	ra,12f4 <printf>
	      kst.st_dev, kst.st_ino, kst.st_mode, kst.st_nlink, kst.st_size, kst.st_atime_sec, kst.st_mtime_sec, kst.st_ctime_sec);

	TEST_END(__func__);
    108a:	00001517          	auipc	a0,0x1
    108e:	04e50513          	addi	a0,a0,78 # 20d8 <__clone+0xf6>
    1092:	240000ef          	jal	ra,12d2 <puts>
    1096:	00001517          	auipc	a0,0x1
    109a:	0f250513          	addi	a0,a0,242 # 2188 <__func__.1186>
    109e:	234000ef          	jal	ra,12d2 <puts>
}
    10a2:	6442                	ld	s0,16(sp)
    10a4:	60e2                	ld	ra,24(sp)
	TEST_END(__func__);
    10a6:	00001517          	auipc	a0,0x1
    10aa:	f8250513          	addi	a0,a0,-126 # 2028 <__clone+0x46>
}
    10ae:	6105                	addi	sp,sp,32
	TEST_END(__func__);
    10b0:	2220006f          	j	12d2 <puts>
	assert(ret >= 0);
    10b4:	00001517          	auipc	a0,0x1
    10b8:	fa450513          	addi	a0,a0,-92 # 2058 <__clone+0x76>
    10bc:	4dc000ef          	jal	ra,1598 <panic>
    10c0:	bf79                	j	105e <test_fstat+0x58>

00000000000010c2 <main>:

int main(void) {
    10c2:	1141                	addi	sp,sp,-16
    10c4:	e406                	sd	ra,8(sp)
	test_fstat();
    10c6:	f41ff0ef          	jal	ra,1006 <test_fstat>
	return 0;
}
    10ca:	60a2                	ld	ra,8(sp)
    10cc:	4501                	li	a0,0
    10ce:	0141                	addi	sp,sp,16
    10d0:	8082                	ret

00000000000010d2 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10d2:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10d4:	4108                	lw	a0,0(a0)
{
    10d6:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10d8:	05a1                	addi	a1,a1,8
{
    10da:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10dc:	fe7ff0ef          	jal	ra,10c2 <main>
    10e0:	51b000ef          	jal	ra,1dfa <exit>
	return 0;
}
    10e4:	60a2                	ld	ra,8(sp)
    10e6:	4501                	li	a0,0
    10e8:	0141                	addi	sp,sp,16
    10ea:	8082                	ret

00000000000010ec <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ec:	7179                	addi	sp,sp,-48
    10ee:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10f0:	12054e63          	bltz	a0,122c <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10f4:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10f8:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10fa:	02b7f6bb          	remuw	a3,a5,a1
    10fe:	00001717          	auipc	a4,0x1
    1102:	09a70713          	addi	a4,a4,154 # 2198 <digits>
    buf[16] = 0;
    1106:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    110a:	1682                	slli	a3,a3,0x20
    110c:	9281                	srli	a3,a3,0x20
    110e:	96ba                	add	a3,a3,a4
    1110:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1114:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1118:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    111c:	16b7e363          	bltu	a5,a1,1282 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1120:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1124:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1128:	1602                	slli	a2,a2,0x20
    112a:	9201                	srli	a2,a2,0x20
    112c:	963a                	add	a2,a2,a4
    112e:	00064603          	lbu	a2,0(a2)
    1132:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1136:	0007861b          	sext.w	a2,a5
    113a:	12b6e863          	bltu	a3,a1,126a <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    113e:	02b7f6bb          	remuw	a3,a5,a1
    1142:	1682                	slli	a3,a3,0x20
    1144:	9281                	srli	a3,a3,0x20
    1146:	96ba                	add	a3,a3,a4
    1148:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    114c:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1150:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1154:	10b66e63          	bltu	a2,a1,1270 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1158:	02b876bb          	remuw	a3,a6,a1
    115c:	1682                	slli	a3,a3,0x20
    115e:	9281                	srli	a3,a3,0x20
    1160:	96ba                	add	a3,a3,a4
    1162:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1166:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    116a:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    116e:	10b86463          	bltu	a6,a1,1276 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1172:	02b676bb          	remuw	a3,a2,a1
    1176:	1682                	slli	a3,a3,0x20
    1178:	9281                	srli	a3,a3,0x20
    117a:	96ba                	add	a3,a3,a4
    117c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1180:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1184:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1188:	0eb66a63          	bltu	a2,a1,127c <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    118c:	02b876bb          	remuw	a3,a6,a1
    1190:	1682                	slli	a3,a3,0x20
    1192:	9281                	srli	a3,a3,0x20
    1194:	96ba                	add	a3,a3,a4
    1196:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    119a:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    119e:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11a2:	0cb86163          	bltu	a6,a1,1264 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    11a6:	02b676bb          	remuw	a3,a2,a1
    11aa:	1682                	slli	a3,a3,0x20
    11ac:	9281                	srli	a3,a3,0x20
    11ae:	96ba                	add	a3,a3,a4
    11b0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b4:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11b8:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11bc:	0cb66563          	bltu	a2,a1,1286 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11c0:	02b876bb          	remuw	a3,a6,a1
    11c4:	1682                	slli	a3,a3,0x20
    11c6:	9281                	srli	a3,a3,0x20
    11c8:	96ba                	add	a3,a3,a4
    11ca:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ce:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11d2:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11d6:	0ab86b63          	bltu	a6,a1,128c <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11da:	02b676bb          	remuw	a3,a2,a1
    11de:	1682                	slli	a3,a3,0x20
    11e0:	9281                	srli	a3,a3,0x20
    11e2:	96ba                	add	a3,a3,a4
    11e4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11e8:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11ec:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11f0:	0ab66163          	bltu	a2,a1,1292 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11f4:	1782                	slli	a5,a5,0x20
    11f6:	9381                	srli	a5,a5,0x20
    11f8:	97ba                	add	a5,a5,a4
    11fa:	0007c703          	lbu	a4,0(a5)
    11fe:	4599                	li	a1,6
    1200:	4795                	li	a5,5
    1202:	00e10723          	sb	a4,14(sp)

    if (sign)
    1206:	00055963          	bgez	a0,1218 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    120a:	1018                	addi	a4,sp,32
    120c:	973e                	add	a4,a4,a5
    120e:	02d00693          	li	a3,45
    1212:	fed70423          	sb	a3,-24(a4)
    1216:	85be                	mv	a1,a5
    write(f, s, l);
    1218:	003c                	addi	a5,sp,8
    121a:	4641                	li	a2,16
    121c:	9e0d                	subw	a2,a2,a1
    121e:	4505                	li	a0,1
    1220:	95be                	add	a1,a1,a5
    1222:	387000ef          	jal	ra,1da8 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1226:	70a2                	ld	ra,40(sp)
    1228:	6145                	addi	sp,sp,48
    122a:	8082                	ret
        x = -xx;
    122c:	40a0063b          	negw	a2,a0
    1230:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1232:	02b677bb          	remuw	a5,a2,a1
    1236:	00001717          	auipc	a4,0x1
    123a:	f6270713          	addi	a4,a4,-158 # 2198 <digits>
    buf[16] = 0;
    123e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1242:	1782                	slli	a5,a5,0x20
    1244:	9381                	srli	a5,a5,0x20
    1246:	97ba                	add	a5,a5,a4
    1248:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    124c:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1250:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1254:	ecb676e3          	bleu	a1,a2,1120 <printint.constprop.0+0x34>
        buf[i--] = '-';
    1258:	02d00793          	li	a5,45
    125c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1260:	45b9                	li	a1,14
    1262:	bf5d                	j	1218 <printint.constprop.0+0x12c>
    1264:	47a5                	li	a5,9
    1266:	45a9                	li	a1,10
    1268:	bf79                	j	1206 <printint.constprop.0+0x11a>
    126a:	47b5                	li	a5,13
    126c:	45b9                	li	a1,14
    126e:	bf61                	j	1206 <printint.constprop.0+0x11a>
    1270:	47b1                	li	a5,12
    1272:	45b5                	li	a1,13
    1274:	bf49                	j	1206 <printint.constprop.0+0x11a>
    1276:	47ad                	li	a5,11
    1278:	45b1                	li	a1,12
    127a:	b771                	j	1206 <printint.constprop.0+0x11a>
    127c:	47a9                	li	a5,10
    127e:	45ad                	li	a1,11
    1280:	b759                	j	1206 <printint.constprop.0+0x11a>
    i = 15;
    1282:	45bd                	li	a1,15
    1284:	bf51                	j	1218 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1286:	47a1                	li	a5,8
    1288:	45a5                	li	a1,9
    128a:	bfb5                	j	1206 <printint.constprop.0+0x11a>
    128c:	479d                	li	a5,7
    128e:	45a1                	li	a1,8
    1290:	bf9d                	j	1206 <printint.constprop.0+0x11a>
    1292:	4799                	li	a5,6
    1294:	459d                	li	a1,7
    1296:	bf85                	j	1206 <printint.constprop.0+0x11a>

0000000000001298 <getchar>:
{
    1298:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    129a:	00f10593          	addi	a1,sp,15
    129e:	4605                	li	a2,1
    12a0:	4501                	li	a0,0
{
    12a2:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12a4:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12a8:	2f7000ef          	jal	ra,1d9e <read>
}
    12ac:	60e2                	ld	ra,24(sp)
    12ae:	00f14503          	lbu	a0,15(sp)
    12b2:	6105                	addi	sp,sp,32
    12b4:	8082                	ret

00000000000012b6 <putchar>:
{
    12b6:	1101                	addi	sp,sp,-32
    char byte = c;
    12b8:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12bc:	00f10593          	addi	a1,sp,15
    12c0:	4605                	li	a2,1
    12c2:	4505                	li	a0,1
{
    12c4:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12c6:	2e3000ef          	jal	ra,1da8 <write>
}
    12ca:	60e2                	ld	ra,24(sp)
    12cc:	2501                	sext.w	a0,a0
    12ce:	6105                	addi	sp,sp,32
    12d0:	8082                	ret

00000000000012d2 <puts>:
{
    12d2:	1141                	addi	sp,sp,-16
    12d4:	e406                	sd	ra,8(sp)
    12d6:	e022                	sd	s0,0(sp)
    12d8:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12da:	5b2000ef          	jal	ra,188c <strlen>
    12de:	862a                	mv	a2,a0
    12e0:	85a2                	mv	a1,s0
    12e2:	4505                	li	a0,1
    12e4:	2c5000ef          	jal	ra,1da8 <write>
}
    12e8:	60a2                	ld	ra,8(sp)
    12ea:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12ec:	957d                	srai	a0,a0,0x3f
    return r;
    12ee:	2501                	sext.w	a0,a0
}
    12f0:	0141                	addi	sp,sp,16
    12f2:	8082                	ret

00000000000012f4 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12f4:	7131                	addi	sp,sp,-192
    12f6:	e0da                	sd	s6,64(sp)
    12f8:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12fa:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12fc:	013c                	addi	a5,sp,136
{
    12fe:	f0ca                	sd	s2,96(sp)
    1300:	ecce                	sd	s3,88(sp)
    1302:	e8d2                	sd	s4,80(sp)
    1304:	e4d6                	sd	s5,72(sp)
    1306:	fc5e                	sd	s7,56(sp)
    1308:	fc86                	sd	ra,120(sp)
    130a:	f8a2                	sd	s0,112(sp)
    130c:	f4a6                	sd	s1,104(sp)
    130e:	89aa                	mv	s3,a0
    1310:	e52e                	sd	a1,136(sp)
    1312:	e932                	sd	a2,144(sp)
    1314:	ed36                	sd	a3,152(sp)
    1316:	f13a                	sd	a4,160(sp)
    1318:	f942                	sd	a6,176(sp)
    131a:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    131c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    131e:	02500913          	li	s2,37
    1322:	07000a93          	li	s5,112
    buf[i++] = '0';
    1326:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    132a:	00001a17          	auipc	s4,0x1
    132e:	e6ea0a13          	addi	s4,s4,-402 # 2198 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1332:	00001b97          	auipc	s7,0x1
    1336:	db6b8b93          	addi	s7,s7,-586 # 20e8 <__clone+0x106>
        if (!*s)
    133a:	0009c783          	lbu	a5,0(s3)
    133e:	cfb9                	beqz	a5,139c <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1340:	23278d63          	beq	a5,s2,157a <printf+0x286>
    1344:	864e                	mv	a2,s3
    1346:	a019                	j	134c <printf+0x58>
    1348:	07278563          	beq	a5,s2,13b2 <printf+0xbe>
    134c:	0605                	addi	a2,a2,1
    134e:	00064783          	lbu	a5,0(a2)
    1352:	fbfd                	bnez	a5,1348 <printf+0x54>
    1354:	84b2                	mv	s1,a2
        l = z - a;
    1356:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    135a:	8622                	mv	a2,s0
    135c:	85ce                	mv	a1,s3
    135e:	4505                	li	a0,1
    1360:	249000ef          	jal	ra,1da8 <write>
        if (l)
    1364:	ec3d                	bnez	s0,13e2 <printf+0xee>
        if (s[1] == 0)
    1366:	0014c783          	lbu	a5,1(s1)
    136a:	cb8d                	beqz	a5,139c <printf+0xa8>
        switch (s[1])
    136c:	09578b63          	beq	a5,s5,1402 <printf+0x10e>
    1370:	06fafb63          	bleu	a5,s5,13e6 <printf+0xf2>
    1374:	07300713          	li	a4,115
    1378:	1ce78e63          	beq	a5,a4,1554 <printf+0x260>
    137c:	07800713          	li	a4,120
    1380:	1ae79563          	bne	a5,a4,152a <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1384:	6782                	ld	a5,0(sp)
    1386:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1388:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    138c:	4388                	lw	a0,0(a5)
    138e:	07a1                	addi	a5,a5,8
    1390:	e03e                	sd	a5,0(sp)
    1392:	d5bff0ef          	jal	ra,10ec <printint.constprop.0>
        if (!*s)
    1396:	0009c783          	lbu	a5,0(s3)
    139a:	f3dd                	bnez	a5,1340 <printf+0x4c>
    }
    va_end(ap);
}
    139c:	70e6                	ld	ra,120(sp)
    139e:	7446                	ld	s0,112(sp)
    13a0:	74a6                	ld	s1,104(sp)
    13a2:	7906                	ld	s2,96(sp)
    13a4:	69e6                	ld	s3,88(sp)
    13a6:	6a46                	ld	s4,80(sp)
    13a8:	6aa6                	ld	s5,72(sp)
    13aa:	6b06                	ld	s6,64(sp)
    13ac:	7be2                	ld	s7,56(sp)
    13ae:	6129                	addi	sp,sp,192
    13b0:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13b2:	00164783          	lbu	a5,1(a2)
    13b6:	84b2                	mv	s1,a2
    13b8:	01278763          	beq	a5,s2,13c6 <printf+0xd2>
    13bc:	bf69                	j	1356 <printf+0x62>
    13be:	0014c783          	lbu	a5,1(s1)
    13c2:	f9279ae3          	bne	a5,s2,1356 <printf+0x62>
    13c6:	0489                	addi	s1,s1,2
    13c8:	0004c783          	lbu	a5,0(s1)
    13cc:	0605                	addi	a2,a2,1
    13ce:	ff2788e3          	beq	a5,s2,13be <printf+0xca>
        l = z - a;
    13d2:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13d6:	8622                	mv	a2,s0
    13d8:	85ce                	mv	a1,s3
    13da:	4505                	li	a0,1
    13dc:	1cd000ef          	jal	ra,1da8 <write>
        if (l)
    13e0:	d059                	beqz	s0,1366 <printf+0x72>
    13e2:	89a6                	mv	s3,s1
    13e4:	bf99                	j	133a <printf+0x46>
    13e6:	06400713          	li	a4,100
    13ea:	14e79063          	bne	a5,a4,152a <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13ee:	6782                	ld	a5,0(sp)
    13f0:	45a9                	li	a1,10
        s += 2;
    13f2:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13f6:	4388                	lw	a0,0(a5)
    13f8:	07a1                	addi	a5,a5,8
    13fa:	e03e                	sd	a5,0(sp)
    13fc:	cf1ff0ef          	jal	ra,10ec <printint.constprop.0>
        s += 2;
    1400:	bf59                	j	1396 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    1402:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1404:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1408:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    140a:	631c                	ld	a5,0(a4)
    140c:	0721                	addi	a4,a4,8
    140e:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1410:	00479293          	slli	t0,a5,0x4
    1414:	00879f93          	slli	t6,a5,0x8
    1418:	00c79f13          	slli	t5,a5,0xc
    141c:	01079e93          	slli	t4,a5,0x10
    1420:	01479e13          	slli	t3,a5,0x14
    1424:	01879313          	slli	t1,a5,0x18
    1428:	01c79893          	slli	a7,a5,0x1c
    142c:	02479813          	slli	a6,a5,0x24
    1430:	02879513          	slli	a0,a5,0x28
    1434:	02c79593          	slli	a1,a5,0x2c
    1438:	03079693          	slli	a3,a5,0x30
    143c:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1440:	03c7d413          	srli	s0,a5,0x3c
    1444:	01c7d39b          	srliw	t2,a5,0x1c
    1448:	03c2d293          	srli	t0,t0,0x3c
    144c:	03cfdf93          	srli	t6,t6,0x3c
    1450:	03cf5f13          	srli	t5,t5,0x3c
    1454:	03cede93          	srli	t4,t4,0x3c
    1458:	03ce5e13          	srli	t3,t3,0x3c
    145c:	03c35313          	srli	t1,t1,0x3c
    1460:	03c8d893          	srli	a7,a7,0x3c
    1464:	03c85813          	srli	a6,a6,0x3c
    1468:	9171                	srli	a0,a0,0x3c
    146a:	91f1                	srli	a1,a1,0x3c
    146c:	92f1                	srli	a3,a3,0x3c
    146e:	9371                	srli	a4,a4,0x3c
    1470:	96d2                	add	a3,a3,s4
    1472:	9752                	add	a4,a4,s4
    1474:	9452                	add	s0,s0,s4
    1476:	92d2                	add	t0,t0,s4
    1478:	9fd2                	add	t6,t6,s4
    147a:	9f52                	add	t5,t5,s4
    147c:	9ed2                	add	t4,t4,s4
    147e:	9e52                	add	t3,t3,s4
    1480:	9352                	add	t1,t1,s4
    1482:	98d2                	add	a7,a7,s4
    1484:	93d2                	add	t2,t2,s4
    1486:	9852                	add	a6,a6,s4
    1488:	9552                	add	a0,a0,s4
    148a:	95d2                	add	a1,a1,s4
    148c:	0006c983          	lbu	s3,0(a3)
    1490:	0002c283          	lbu	t0,0(t0)
    1494:	00074683          	lbu	a3,0(a4)
    1498:	000fcf83          	lbu	t6,0(t6)
    149c:	000f4f03          	lbu	t5,0(t5)
    14a0:	000ece83          	lbu	t4,0(t4)
    14a4:	000e4e03          	lbu	t3,0(t3)
    14a8:	00034303          	lbu	t1,0(t1)
    14ac:	0008c883          	lbu	a7,0(a7)
    14b0:	0003c383          	lbu	t2,0(t2)
    14b4:	00084803          	lbu	a6,0(a6)
    14b8:	00054503          	lbu	a0,0(a0)
    14bc:	0005c583          	lbu	a1,0(a1)
    14c0:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14c4:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14c8:	9371                	srli	a4,a4,0x3c
    14ca:	8bbd                	andi	a5,a5,15
    14cc:	9752                	add	a4,a4,s4
    14ce:	97d2                	add	a5,a5,s4
    14d0:	005105a3          	sb	t0,11(sp)
    14d4:	01f10623          	sb	t6,12(sp)
    14d8:	01e106a3          	sb	t5,13(sp)
    14dc:	01d10723          	sb	t4,14(sp)
    14e0:	01c107a3          	sb	t3,15(sp)
    14e4:	00610823          	sb	t1,16(sp)
    14e8:	011108a3          	sb	a7,17(sp)
    14ec:	00710923          	sb	t2,18(sp)
    14f0:	010109a3          	sb	a6,19(sp)
    14f4:	00a10a23          	sb	a0,20(sp)
    14f8:	00b10aa3          	sb	a1,21(sp)
    14fc:	01310b23          	sb	s3,22(sp)
    1500:	00d10ba3          	sb	a3,23(sp)
    1504:	00810523          	sb	s0,10(sp)
    1508:	00074703          	lbu	a4,0(a4)
    150c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1510:	002c                	addi	a1,sp,8
    1512:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1514:	00e10c23          	sb	a4,24(sp)
    1518:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    151c:	00010d23          	sb	zero,26(sp)
        s += 2;
    1520:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1524:	085000ef          	jal	ra,1da8 <write>
        s += 2;
    1528:	b5bd                	j	1396 <printf+0xa2>
    char byte = c;
    152a:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    152e:	4605                	li	a2,1
    1530:	002c                	addi	a1,sp,8
    1532:	4505                	li	a0,1
    char byte = c;
    1534:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1538:	071000ef          	jal	ra,1da8 <write>
    char byte = c;
    153c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1540:	4605                	li	a2,1
    1542:	002c                	addi	a1,sp,8
    1544:	4505                	li	a0,1
    char byte = c;
    1546:	00f10423          	sb	a5,8(sp)
        s += 2;
    154a:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    154e:	05b000ef          	jal	ra,1da8 <write>
        s += 2;
    1552:	b591                	j	1396 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1554:	6782                	ld	a5,0(sp)
    1556:	6380                	ld	s0,0(a5)
    1558:	07a1                	addi	a5,a5,8
    155a:	e03e                	sd	a5,0(sp)
    155c:	cc05                	beqz	s0,1594 <printf+0x2a0>
            l = strnlen(a, 200);
    155e:	0c800593          	li	a1,200
    1562:	8522                	mv	a0,s0
    1564:	45a000ef          	jal	ra,19be <strnlen>
    write(f, s, l);
    1568:	0005061b          	sext.w	a2,a0
    156c:	85a2                	mv	a1,s0
    156e:	4505                	li	a0,1
    1570:	039000ef          	jal	ra,1da8 <write>
        s += 2;
    1574:	00248993          	addi	s3,s1,2
    1578:	bd39                	j	1396 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    157a:	0019c783          	lbu	a5,1(s3)
    157e:	84ce                	mv	s1,s3
    1580:	864e                	mv	a2,s3
    1582:	e52782e3          	beq	a5,s2,13c6 <printf+0xd2>
    write(f, s, l);
    1586:	4601                	li	a2,0
    1588:	85ce                	mv	a1,s3
    158a:	4505                	li	a0,1
    158c:	01d000ef          	jal	ra,1da8 <write>
    1590:	84ce                	mv	s1,s3
    1592:	bbd1                	j	1366 <printf+0x72>
                a = "(null)";
    1594:	845e                	mv	s0,s7
    1596:	b7e1                	j	155e <printf+0x26a>

0000000000001598 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1598:	1141                	addi	sp,sp,-16
    159a:	e406                	sd	ra,8(sp)
    puts(m);
    159c:	d37ff0ef          	jal	ra,12d2 <puts>
    exit(-100);
}
    15a0:	60a2                	ld	ra,8(sp)
    exit(-100);
    15a2:	f9c00513          	li	a0,-100
}
    15a6:	0141                	addi	sp,sp,16
    exit(-100);
    15a8:	0530006f          	j	1dfa <exit>

00000000000015ac <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ac:	02000793          	li	a5,32
    15b0:	00f50663          	beq	a0,a5,15bc <isspace+0x10>
    15b4:	355d                	addiw	a0,a0,-9
    15b6:	00553513          	sltiu	a0,a0,5
    15ba:	8082                	ret
    15bc:	4505                	li	a0,1
}
    15be:	8082                	ret

00000000000015c0 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15c0:	fd05051b          	addiw	a0,a0,-48
}
    15c4:	00a53513          	sltiu	a0,a0,10
    15c8:	8082                	ret

00000000000015ca <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ca:	02000613          	li	a2,32
    15ce:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15d0:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15d4:	0007079b          	sext.w	a5,a4
    15d8:	ff77869b          	addiw	a3,a5,-9
    15dc:	04c70b63          	beq	a4,a2,1632 <atoi+0x68>
    15e0:	04d5f963          	bleu	a3,a1,1632 <atoi+0x68>
        s++;
    switch (*s)
    15e4:	02b00693          	li	a3,43
    15e8:	04d70a63          	beq	a4,a3,163c <atoi+0x72>
    15ec:	02d00693          	li	a3,45
    15f0:	06d70463          	beq	a4,a3,1658 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15f4:	fd07859b          	addiw	a1,a5,-48
    15f8:	4625                	li	a2,9
    15fa:	873e                	mv	a4,a5
    15fc:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15fe:	4e01                	li	t3,0
    while (isdigit(*s))
    1600:	04b66a63          	bltu	a2,a1,1654 <atoi+0x8a>
    int n = 0, neg = 0;
    1604:	4501                	li	a0,0
    while (isdigit(*s))
    1606:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    1608:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    160a:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    160e:	0025179b          	slliw	a5,a0,0x2
    1612:	9d3d                	addw	a0,a0,a5
    1614:	fd07031b          	addiw	t1,a4,-48
    1618:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    161c:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1620:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1624:	0006071b          	sext.w	a4,a2
    1628:	feb870e3          	bleu	a1,a6,1608 <atoi+0x3e>
    return neg ? n : -n;
    162c:	000e0563          	beqz	t3,1636 <atoi+0x6c>
}
    1630:	8082                	ret
        s++;
    1632:	0505                	addi	a0,a0,1
    1634:	bf71                	j	15d0 <atoi+0x6>
    1636:	4113053b          	subw	a0,t1,a7
    163a:	8082                	ret
    while (isdigit(*s))
    163c:	00154783          	lbu	a5,1(a0)
    1640:	4625                	li	a2,9
        s++;
    1642:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1646:	fd07859b          	addiw	a1,a5,-48
    164a:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    164e:	4e01                	li	t3,0
    while (isdigit(*s))
    1650:	fab67ae3          	bleu	a1,a2,1604 <atoi+0x3a>
    1654:	4501                	li	a0,0
}
    1656:	8082                	ret
    while (isdigit(*s))
    1658:	00154783          	lbu	a5,1(a0)
    165c:	4625                	li	a2,9
        s++;
    165e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1662:	fd07859b          	addiw	a1,a5,-48
    1666:	0007871b          	sext.w	a4,a5
    166a:	feb665e3          	bltu	a2,a1,1654 <atoi+0x8a>
        neg = 1;
    166e:	4e05                	li	t3,1
    1670:	bf51                	j	1604 <atoi+0x3a>

0000000000001672 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1672:	16060d63          	beqz	a2,17ec <memset+0x17a>
    1676:	40a007b3          	neg	a5,a0
    167a:	8b9d                	andi	a5,a5,7
    167c:	00778713          	addi	a4,a5,7
    1680:	482d                	li	a6,11
    1682:	0ff5f593          	andi	a1,a1,255
    1686:	fff60693          	addi	a3,a2,-1
    168a:	17076263          	bltu	a4,a6,17ee <memset+0x17c>
    168e:	16e6ea63          	bltu	a3,a4,1802 <memset+0x190>
    1692:	16078563          	beqz	a5,17fc <memset+0x18a>
    1696:	00b50023          	sb	a1,0(a0)
    169a:	4705                	li	a4,1
    169c:	00150e93          	addi	t4,a0,1
    16a0:	14e78c63          	beq	a5,a4,17f8 <memset+0x186>
    16a4:	00b500a3          	sb	a1,1(a0)
    16a8:	4709                	li	a4,2
    16aa:	00250e93          	addi	t4,a0,2
    16ae:	14e78d63          	beq	a5,a4,1808 <memset+0x196>
    16b2:	00b50123          	sb	a1,2(a0)
    16b6:	470d                	li	a4,3
    16b8:	00350e93          	addi	t4,a0,3
    16bc:	12e78b63          	beq	a5,a4,17f2 <memset+0x180>
    16c0:	00b501a3          	sb	a1,3(a0)
    16c4:	4711                	li	a4,4
    16c6:	00450e93          	addi	t4,a0,4
    16ca:	14e78163          	beq	a5,a4,180c <memset+0x19a>
    16ce:	00b50223          	sb	a1,4(a0)
    16d2:	4715                	li	a4,5
    16d4:	00550e93          	addi	t4,a0,5
    16d8:	12e78c63          	beq	a5,a4,1810 <memset+0x19e>
    16dc:	00b502a3          	sb	a1,5(a0)
    16e0:	471d                	li	a4,7
    16e2:	00650e93          	addi	t4,a0,6
    16e6:	12e79763          	bne	a5,a4,1814 <memset+0x1a2>
    16ea:	00750e93          	addi	t4,a0,7
    16ee:	00b50323          	sb	a1,6(a0)
    16f2:	4f1d                	li	t5,7
    16f4:	00859713          	slli	a4,a1,0x8
    16f8:	8f4d                	or	a4,a4,a1
    16fa:	01059e13          	slli	t3,a1,0x10
    16fe:	01c76e33          	or	t3,a4,t3
    1702:	01859313          	slli	t1,a1,0x18
    1706:	006e6333          	or	t1,t3,t1
    170a:	02059893          	slli	a7,a1,0x20
    170e:	011368b3          	or	a7,t1,a7
    1712:	02859813          	slli	a6,a1,0x28
    1716:	40f60333          	sub	t1,a2,a5
    171a:	0108e833          	or	a6,a7,a6
    171e:	03059693          	slli	a3,a1,0x30
    1722:	00d866b3          	or	a3,a6,a3
    1726:	03859713          	slli	a4,a1,0x38
    172a:	97aa                	add	a5,a5,a0
    172c:	ff837813          	andi	a6,t1,-8
    1730:	8f55                	or	a4,a4,a3
    1732:	00f806b3          	add	a3,a6,a5
    1736:	e398                	sd	a4,0(a5)
    1738:	07a1                	addi	a5,a5,8
    173a:	fed79ee3          	bne	a5,a3,1736 <memset+0xc4>
    173e:	ff837693          	andi	a3,t1,-8
    1742:	00de87b3          	add	a5,t4,a3
    1746:	01e6873b          	addw	a4,a3,t5
    174a:	0ad30663          	beq	t1,a3,17f6 <memset+0x184>
    174e:	00b78023          	sb	a1,0(a5)
    1752:	0017069b          	addiw	a3,a4,1
    1756:	08c6fb63          	bleu	a2,a3,17ec <memset+0x17a>
    175a:	00b780a3          	sb	a1,1(a5)
    175e:	0027069b          	addiw	a3,a4,2
    1762:	08c6f563          	bleu	a2,a3,17ec <memset+0x17a>
    1766:	00b78123          	sb	a1,2(a5)
    176a:	0037069b          	addiw	a3,a4,3
    176e:	06c6ff63          	bleu	a2,a3,17ec <memset+0x17a>
    1772:	00b781a3          	sb	a1,3(a5)
    1776:	0047069b          	addiw	a3,a4,4
    177a:	06c6f963          	bleu	a2,a3,17ec <memset+0x17a>
    177e:	00b78223          	sb	a1,4(a5)
    1782:	0057069b          	addiw	a3,a4,5
    1786:	06c6f363          	bleu	a2,a3,17ec <memset+0x17a>
    178a:	00b782a3          	sb	a1,5(a5)
    178e:	0067069b          	addiw	a3,a4,6
    1792:	04c6fd63          	bleu	a2,a3,17ec <memset+0x17a>
    1796:	00b78323          	sb	a1,6(a5)
    179a:	0077069b          	addiw	a3,a4,7
    179e:	04c6f763          	bleu	a2,a3,17ec <memset+0x17a>
    17a2:	00b783a3          	sb	a1,7(a5)
    17a6:	0087069b          	addiw	a3,a4,8
    17aa:	04c6f163          	bleu	a2,a3,17ec <memset+0x17a>
    17ae:	00b78423          	sb	a1,8(a5)
    17b2:	0097069b          	addiw	a3,a4,9
    17b6:	02c6fb63          	bleu	a2,a3,17ec <memset+0x17a>
    17ba:	00b784a3          	sb	a1,9(a5)
    17be:	00a7069b          	addiw	a3,a4,10
    17c2:	02c6f563          	bleu	a2,a3,17ec <memset+0x17a>
    17c6:	00b78523          	sb	a1,10(a5)
    17ca:	00b7069b          	addiw	a3,a4,11
    17ce:	00c6ff63          	bleu	a2,a3,17ec <memset+0x17a>
    17d2:	00b785a3          	sb	a1,11(a5)
    17d6:	00c7069b          	addiw	a3,a4,12
    17da:	00c6f963          	bleu	a2,a3,17ec <memset+0x17a>
    17de:	00b78623          	sb	a1,12(a5)
    17e2:	2735                	addiw	a4,a4,13
    17e4:	00c77463          	bleu	a2,a4,17ec <memset+0x17a>
    17e8:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17ec:	8082                	ret
    17ee:	472d                	li	a4,11
    17f0:	bd79                	j	168e <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17f2:	4f0d                	li	t5,3
    17f4:	b701                	j	16f4 <memset+0x82>
    17f6:	8082                	ret
    17f8:	4f05                	li	t5,1
    17fa:	bded                	j	16f4 <memset+0x82>
    17fc:	8eaa                	mv	t4,a0
    17fe:	4f01                	li	t5,0
    1800:	bdd5                	j	16f4 <memset+0x82>
    1802:	87aa                	mv	a5,a0
    1804:	4701                	li	a4,0
    1806:	b7a1                	j	174e <memset+0xdc>
    1808:	4f09                	li	t5,2
    180a:	b5ed                	j	16f4 <memset+0x82>
    180c:	4f11                	li	t5,4
    180e:	b5dd                	j	16f4 <memset+0x82>
    1810:	4f15                	li	t5,5
    1812:	b5cd                	j	16f4 <memset+0x82>
    1814:	4f19                	li	t5,6
    1816:	bdf9                	j	16f4 <memset+0x82>

0000000000001818 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1818:	00054703          	lbu	a4,0(a0)
    181c:	0005c783          	lbu	a5,0(a1)
    1820:	00e79b63          	bne	a5,a4,1836 <strcmp+0x1e>
    1824:	cf89                	beqz	a5,183e <strcmp+0x26>
    1826:	0505                	addi	a0,a0,1
    1828:	0585                	addi	a1,a1,1
    182a:	0005c783          	lbu	a5,0(a1)
    182e:	00054703          	lbu	a4,0(a0)
    1832:	fef709e3          	beq	a4,a5,1824 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1836:	0007051b          	sext.w	a0,a4
}
    183a:	9d1d                	subw	a0,a0,a5
    183c:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    183e:	4501                	li	a0,0
}
    1840:	9d1d                	subw	a0,a0,a5
    1842:	8082                	ret

0000000000001844 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1844:	c231                	beqz	a2,1888 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1846:	00054783          	lbu	a5,0(a0)
    184a:	0005c683          	lbu	a3,0(a1)
    184e:	c795                	beqz	a5,187a <strncmp+0x36>
    1850:	ca85                	beqz	a3,1880 <strncmp+0x3c>
    if (!n--)
    1852:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1854:	c615                	beqz	a2,1880 <strncmp+0x3c>
    1856:	00150713          	addi	a4,a0,1
    185a:	9532                	add	a0,a0,a2
    185c:	00d78963          	beq	a5,a3,186e <strncmp+0x2a>
    1860:	a005                	j	1880 <strncmp+0x3c>
    1862:	ce99                	beqz	a3,1880 <strncmp+0x3c>
    1864:	00e50e63          	beq	a0,a4,1880 <strncmp+0x3c>
    1868:	0705                	addi	a4,a4,1
    186a:	00d79b63          	bne	a5,a3,1880 <strncmp+0x3c>
    186e:	00074783          	lbu	a5,0(a4)
    1872:	0585                	addi	a1,a1,1
    1874:	0005c683          	lbu	a3,0(a1)
    1878:	f7ed                	bnez	a5,1862 <strncmp+0x1e>
    187a:	4501                	li	a0,0
        ;
    return *l - *r;
    187c:	9d15                	subw	a0,a0,a3
    187e:	8082                	ret
    1880:	0007851b          	sext.w	a0,a5
    1884:	9d15                	subw	a0,a0,a3
    1886:	8082                	ret
        return 0;
    1888:	4501                	li	a0,0
}
    188a:	8082                	ret

000000000000188c <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    188c:	00757793          	andi	a5,a0,7
    1890:	cfa1                	beqz	a5,18e8 <strlen+0x5c>
        if (!*s)
    1892:	00054783          	lbu	a5,0(a0)
    1896:	cbb9                	beqz	a5,18ec <strlen+0x60>
    1898:	87aa                	mv	a5,a0
    189a:	a021                	j	18a2 <strlen+0x16>
    189c:	0007c703          	lbu	a4,0(a5)
    18a0:	c329                	beqz	a4,18e2 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    18a2:	0785                	addi	a5,a5,1
    18a4:	0077f713          	andi	a4,a5,7
    18a8:	fb75                	bnez	a4,189c <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18aa:	00001717          	auipc	a4,0x1
    18ae:	84670713          	addi	a4,a4,-1978 # 20f0 <__clone+0x10e>
    18b2:	630c                	ld	a1,0(a4)
    18b4:	00001717          	auipc	a4,0x1
    18b8:	84470713          	addi	a4,a4,-1980 # 20f8 <__clone+0x116>
    18bc:	6394                	ld	a3,0(a5)
    18be:	6310                	ld	a2,0(a4)
    18c0:	a019                	j	18c6 <strlen+0x3a>
    18c2:	07a1                	addi	a5,a5,8
    18c4:	6394                	ld	a3,0(a5)
    18c6:	00b68733          	add	a4,a3,a1
    18ca:	fff6c693          	not	a3,a3
    18ce:	8f75                	and	a4,a4,a3
    18d0:	8f71                	and	a4,a4,a2
    18d2:	db65                	beqz	a4,18c2 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18d4:	0007c703          	lbu	a4,0(a5)
    18d8:	c709                	beqz	a4,18e2 <strlen+0x56>
    18da:	0785                	addi	a5,a5,1
    18dc:	0007c703          	lbu	a4,0(a5)
    18e0:	ff6d                	bnez	a4,18da <strlen+0x4e>
        ;
    return s - a;
    18e2:	40a78533          	sub	a0,a5,a0
}
    18e6:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18e8:	87aa                	mv	a5,a0
    18ea:	b7c1                	j	18aa <strlen+0x1e>
        if (!*s)
    18ec:	4501                	li	a0,0
            return s - a;
    18ee:	8082                	ret

00000000000018f0 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18f0:	00757793          	andi	a5,a0,7
    18f4:	0ff5f593          	andi	a1,a1,255
    18f8:	cb99                	beqz	a5,190e <memchr+0x1e>
    18fa:	c655                	beqz	a2,19a6 <memchr+0xb6>
    18fc:	00054783          	lbu	a5,0(a0)
    1900:	0ab78663          	beq	a5,a1,19ac <memchr+0xbc>
    1904:	0505                	addi	a0,a0,1
    1906:	00757793          	andi	a5,a0,7
    190a:	167d                	addi	a2,a2,-1
    190c:	f7fd                	bnez	a5,18fa <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    190e:	4701                	li	a4,0
    if (n && *s != c)
    1910:	ca49                	beqz	a2,19a2 <memchr+0xb2>
    1912:	00054783          	lbu	a5,0(a0)
    1916:	08b78b63          	beq	a5,a1,19ac <memchr+0xbc>
        size_t k = ONES * c;
    191a:	00000797          	auipc	a5,0x0
    191e:	7e678793          	addi	a5,a5,2022 # 2100 <__clone+0x11e>
    1922:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1924:	479d                	li	a5,7
        size_t k = ONES * c;
    1926:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    192a:	08c7f863          	bleu	a2,a5,19ba <memchr+0xca>
    192e:	611c                	ld	a5,0(a0)
    1930:	00000317          	auipc	t1,0x0
    1934:	7c830313          	addi	t1,t1,1992 # 20f8 <__clone+0x116>
    1938:	00033803          	ld	a6,0(t1)
    193c:	00f8c7b3          	xor	a5,a7,a5
    1940:	fff7c713          	not	a4,a5
    1944:	8f95                	sub	a5,a5,a3
    1946:	8ff9                	and	a5,a5,a4
    1948:	0107f7b3          	and	a5,a5,a6
    194c:	e7bd                	bnez	a5,19ba <memchr+0xca>
    194e:	4e1d                	li	t3,7
    1950:	00000e97          	auipc	t4,0x0
    1954:	7a0e8e93          	addi	t4,t4,1952 # 20f0 <__clone+0x10e>
    1958:	a005                	j	1978 <memchr+0x88>
    195a:	6514                	ld	a3,8(a0)
    195c:	000eb783          	ld	a5,0(t4)
    1960:	00033803          	ld	a6,0(t1)
    1964:	00d8c6b3          	xor	a3,a7,a3
    1968:	97b6                	add	a5,a5,a3
    196a:	fff6c693          	not	a3,a3
    196e:	8ff5                	and	a5,a5,a3
    1970:	0107f7b3          	and	a5,a5,a6
    1974:	e3a1                	bnez	a5,19b4 <memchr+0xc4>
    1976:	853a                	mv	a0,a4
    1978:	1661                	addi	a2,a2,-8
    197a:	00850713          	addi	a4,a0,8
    197e:	fcce6ee3          	bltu	t3,a2,195a <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1982:	c215                	beqz	a2,19a6 <memchr+0xb6>
    1984:	00074783          	lbu	a5,0(a4)
    1988:	00f58d63          	beq	a1,a5,19a2 <memchr+0xb2>
    198c:	00170793          	addi	a5,a4,1
    1990:	963a                	add	a2,a2,a4
    1992:	873e                	mv	a4,a5
    1994:	00f60963          	beq	a2,a5,19a6 <memchr+0xb6>
    1998:	0007c683          	lbu	a3,0(a5)
    199c:	0785                	addi	a5,a5,1
    199e:	feb69ae3          	bne	a3,a1,1992 <memchr+0xa2>
}
    19a2:	853a                	mv	a0,a4
    19a4:	8082                	ret
    return n ? (void *)s : 0;
    19a6:	4701                	li	a4,0
}
    19a8:	853a                	mv	a0,a4
    19aa:	8082                	ret
    19ac:	872a                	mv	a4,a0
    19ae:	00074783          	lbu	a5,0(a4)
    19b2:	bfd9                	j	1988 <memchr+0x98>
    19b4:	00854783          	lbu	a5,8(a0)
    19b8:	bfc1                	j	1988 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19ba:	872a                	mv	a4,a0
    19bc:	bfc1                	j	198c <memchr+0x9c>

00000000000019be <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19be:	00757793          	andi	a5,a0,7
    19c2:	cfc5                	beqz	a5,1a7a <strnlen+0xbc>
    19c4:	c1c5                	beqz	a1,1a64 <strnlen+0xa6>
    19c6:	00054783          	lbu	a5,0(a0)
    19ca:	cfd9                	beqz	a5,1a68 <strnlen+0xaa>
    19cc:	87ae                	mv	a5,a1
    19ce:	86aa                	mv	a3,a0
    19d0:	a029                	j	19da <strnlen+0x1c>
    19d2:	cbc9                	beqz	a5,1a64 <strnlen+0xa6>
    19d4:	0006c703          	lbu	a4,0(a3)
    19d8:	cb51                	beqz	a4,1a6c <strnlen+0xae>
    19da:	0685                	addi	a3,a3,1
    19dc:	0076f713          	andi	a4,a3,7
    19e0:	17fd                	addi	a5,a5,-1
    19e2:	fb65                	bnez	a4,19d2 <strnlen+0x14>
    if (n && *s != c)
    19e4:	c3c1                	beqz	a5,1a64 <strnlen+0xa6>
    19e6:	0006c703          	lbu	a4,0(a3)
    19ea:	c349                	beqz	a4,1a6c <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19ec:	471d                	li	a4,7
    19ee:	08f77a63          	bleu	a5,a4,1a82 <strnlen+0xc4>
    19f2:	00000e17          	auipc	t3,0x0
    19f6:	6fee0e13          	addi	t3,t3,1790 # 20f0 <__clone+0x10e>
    19fa:	6290                	ld	a2,0(a3)
    19fc:	000e3703          	ld	a4,0(t3)
    1a00:	00000e97          	auipc	t4,0x0
    1a04:	6f8e8e93          	addi	t4,t4,1784 # 20f8 <__clone+0x116>
    1a08:	000eb803          	ld	a6,0(t4)
    1a0c:	9732                	add	a4,a4,a2
    1a0e:	fff64613          	not	a2,a2
    1a12:	8f71                	and	a4,a4,a2
    1a14:	01077733          	and	a4,a4,a6
    1a18:	e72d                	bnez	a4,1a82 <strnlen+0xc4>
    1a1a:	4f1d                	li	t5,7
    1a1c:	a839                	j	1a3a <strnlen+0x7c>
    1a1e:	6698                	ld	a4,8(a3)
    1a20:	000e3303          	ld	t1,0(t3)
    1a24:	000eb803          	ld	a6,0(t4)
    1a28:	fff74893          	not	a7,a4
    1a2c:	971a                	add	a4,a4,t1
    1a2e:	01177733          	and	a4,a4,a7
    1a32:	01077733          	and	a4,a4,a6
    1a36:	ef1d                	bnez	a4,1a74 <strnlen+0xb6>
    1a38:	86b2                	mv	a3,a2
    1a3a:	17e1                	addi	a5,a5,-8
    1a3c:	00868613          	addi	a2,a3,8
    1a40:	fcff6fe3          	bltu	t5,a5,1a1e <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a44:	c385                	beqz	a5,1a64 <strnlen+0xa6>
    1a46:	00064703          	lbu	a4,0(a2)
    1a4a:	cb19                	beqz	a4,1a60 <strnlen+0xa2>
    1a4c:	00160713          	addi	a4,a2,1
    1a50:	97b2                	add	a5,a5,a2
    1a52:	863a                	mv	a2,a4
    1a54:	00e78863          	beq	a5,a4,1a64 <strnlen+0xa6>
    1a58:	0705                	addi	a4,a4,1
    1a5a:	fff74683          	lbu	a3,-1(a4)
    1a5e:	faf5                	bnez	a3,1a52 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a60:	40a605b3          	sub	a1,a2,a0
}
    1a64:	852e                	mv	a0,a1
    1a66:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a68:	87ae                	mv	a5,a1
    1a6a:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a6c:	8636                	mv	a2,a3
    1a6e:	00064703          	lbu	a4,0(a2)
    1a72:	bfe1                	j	1a4a <strnlen+0x8c>
    1a74:	0086c703          	lbu	a4,8(a3)
    1a78:	bfc9                	j	1a4a <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a7a:	87ae                	mv	a5,a1
    1a7c:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a7e:	f7a5                	bnez	a5,19e6 <strnlen+0x28>
    1a80:	b7d5                	j	1a64 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a82:	8636                	mv	a2,a3
    1a84:	b7e1                	j	1a4c <strnlen+0x8e>

0000000000001a86 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a86:	00b547b3          	xor	a5,a0,a1
    1a8a:	8b9d                	andi	a5,a5,7
    1a8c:	efa9                	bnez	a5,1ae6 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a8e:	0075f793          	andi	a5,a1,7
    1a92:	c38d                	beqz	a5,1ab4 <strcpy+0x2e>
            if (!(*d = *s))
    1a94:	0005c783          	lbu	a5,0(a1)
    1a98:	00f50023          	sb	a5,0(a0)
    1a9c:	e799                	bnez	a5,1aaa <strcpy+0x24>
    1a9e:	a095                	j	1b02 <strcpy+0x7c>
    1aa0:	0005c783          	lbu	a5,0(a1)
    1aa4:	00f50023          	sb	a5,0(a0)
    1aa8:	cbb9                	beqz	a5,1afe <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1aaa:	0585                	addi	a1,a1,1
    1aac:	0075f793          	andi	a5,a1,7
    1ab0:	0505                	addi	a0,a0,1
    1ab2:	f7fd                	bnez	a5,1aa0 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1ab4:	00000797          	auipc	a5,0x0
    1ab8:	63c78793          	addi	a5,a5,1596 # 20f0 <__clone+0x10e>
    1abc:	0007b803          	ld	a6,0(a5)
    1ac0:	00000797          	auipc	a5,0x0
    1ac4:	63878793          	addi	a5,a5,1592 # 20f8 <__clone+0x116>
    1ac8:	6198                	ld	a4,0(a1)
    1aca:	6390                	ld	a2,0(a5)
    1acc:	a031                	j	1ad8 <strcpy+0x52>
    1ace:	0521                	addi	a0,a0,8
    1ad0:	05a1                	addi	a1,a1,8
    1ad2:	fee53c23          	sd	a4,-8(a0)
    1ad6:	6198                	ld	a4,0(a1)
    1ad8:	010707b3          	add	a5,a4,a6
    1adc:	fff74693          	not	a3,a4
    1ae0:	8ff5                	and	a5,a5,a3
    1ae2:	8ff1                	and	a5,a5,a2
    1ae4:	d7ed                	beqz	a5,1ace <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ae6:	0005c783          	lbu	a5,0(a1)
    1aea:	00f50023          	sb	a5,0(a0)
    1aee:	cb89                	beqz	a5,1b00 <strcpy+0x7a>
    1af0:	0585                	addi	a1,a1,1
    1af2:	0005c783          	lbu	a5,0(a1)
    1af6:	0505                	addi	a0,a0,1
    1af8:	00f50023          	sb	a5,0(a0)
    1afc:	fbf5                	bnez	a5,1af0 <strcpy+0x6a>
        ;
    return d;
}
    1afe:	8082                	ret
    1b00:	8082                	ret
    1b02:	8082                	ret

0000000000001b04 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b04:	00b547b3          	xor	a5,a0,a1
    1b08:	8b9d                	andi	a5,a5,7
    1b0a:	ebc1                	bnez	a5,1b9a <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b0c:	0075f793          	andi	a5,a1,7
    1b10:	cf91                	beqz	a5,1b2c <strncpy+0x28>
    1b12:	20060e63          	beqz	a2,1d2e <strncpy+0x22a>
    1b16:	0005c783          	lbu	a5,0(a1)
    1b1a:	00f50023          	sb	a5,0(a0)
    1b1e:	c3d5                	beqz	a5,1bc2 <strncpy+0xbe>
    1b20:	0585                	addi	a1,a1,1
    1b22:	0075f793          	andi	a5,a1,7
    1b26:	167d                	addi	a2,a2,-1
    1b28:	0505                	addi	a0,a0,1
    1b2a:	f7e5                	bnez	a5,1b12 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b2c:	20060163          	beqz	a2,1d2e <strncpy+0x22a>
    1b30:	0005c683          	lbu	a3,0(a1)
    1b34:	c6d9                	beqz	a3,1bc2 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b36:	479d                	li	a5,7
    1b38:	22c7f563          	bleu	a2,a5,1d62 <strncpy+0x25e>
    1b3c:	00000317          	auipc	t1,0x0
    1b40:	5b430313          	addi	t1,t1,1460 # 20f0 <__clone+0x10e>
    1b44:	6198                	ld	a4,0(a1)
    1b46:	00033783          	ld	a5,0(t1)
    1b4a:	00000e17          	auipc	t3,0x0
    1b4e:	5aee0e13          	addi	t3,t3,1454 # 20f8 <__clone+0x116>
    1b52:	000e3803          	ld	a6,0(t3)
    1b56:	97ba                	add	a5,a5,a4
    1b58:	fff74893          	not	a7,a4
    1b5c:	0117f7b3          	and	a5,a5,a7
    1b60:	0107f7b3          	and	a5,a5,a6
    1b64:	1e079f63          	bnez	a5,1d62 <strncpy+0x25e>
    1b68:	4e9d                	li	t4,7
    1b6a:	a005                	j	1b8a <strncpy+0x86>
    1b6c:	6598                	ld	a4,8(a1)
    1b6e:	00033783          	ld	a5,0(t1)
    1b72:	000e3803          	ld	a6,0(t3)
    1b76:	fff74893          	not	a7,a4
    1b7a:	97ba                	add	a5,a5,a4
    1b7c:	0117f7b3          	and	a5,a5,a7
    1b80:	0107f7b3          	and	a5,a5,a6
    1b84:	1a079f63          	bnez	a5,1d42 <strncpy+0x23e>
    1b88:	85b6                	mv	a1,a3
            *wd = *ws;
    1b8a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b8c:	1661                	addi	a2,a2,-8
    1b8e:	00858693          	addi	a3,a1,8
    1b92:	0521                	addi	a0,a0,8
    1b94:	fcceece3          	bltu	t4,a2,1b6c <strncpy+0x68>
    1b98:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b9a:	18060a63          	beqz	a2,1d2e <strncpy+0x22a>
    1b9e:	0005c783          	lbu	a5,0(a1)
    1ba2:	872a                	mv	a4,a0
    1ba4:	00f50023          	sb	a5,0(a0)
    1ba8:	e799                	bnez	a5,1bb6 <strncpy+0xb2>
    1baa:	a829                	j	1bc4 <strncpy+0xc0>
    1bac:	0005c783          	lbu	a5,0(a1)
    1bb0:	00f70023          	sb	a5,0(a4)
    1bb4:	cb81                	beqz	a5,1bc4 <strncpy+0xc0>
    1bb6:	167d                	addi	a2,a2,-1
    1bb8:	0585                	addi	a1,a1,1
    1bba:	0705                	addi	a4,a4,1
    1bbc:	fa65                	bnez	a2,1bac <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1bbe:	853a                	mv	a0,a4
    1bc0:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1bc2:	872a                	mv	a4,a0
    1bc4:	4805                	li	a6,1
    1bc6:	14061c63          	bnez	a2,1d1e <strncpy+0x21a>
    1bca:	40e007b3          	neg	a5,a4
    1bce:	8b9d                	andi	a5,a5,7
    1bd0:	4581                	li	a1,0
    1bd2:	12061e63          	bnez	a2,1d0e <strncpy+0x20a>
    1bd6:	00778693          	addi	a3,a5,7
    1bda:	452d                	li	a0,11
    1bdc:	12a6e763          	bltu	a3,a0,1d0a <strncpy+0x206>
    1be0:	16d5e663          	bltu	a1,a3,1d4c <strncpy+0x248>
    1be4:	14078c63          	beqz	a5,1d3c <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1be8:	00070023          	sb	zero,0(a4)
    1bec:	4585                	li	a1,1
    1bee:	00170693          	addi	a3,a4,1
    1bf2:	14b78363          	beq	a5,a1,1d38 <strncpy+0x234>
    1bf6:	000700a3          	sb	zero,1(a4)
    1bfa:	4589                	li	a1,2
    1bfc:	00270693          	addi	a3,a4,2
    1c00:	14b78963          	beq	a5,a1,1d52 <strncpy+0x24e>
    1c04:	00070123          	sb	zero,2(a4)
    1c08:	458d                	li	a1,3
    1c0a:	00370693          	addi	a3,a4,3
    1c0e:	12b78363          	beq	a5,a1,1d34 <strncpy+0x230>
    1c12:	000701a3          	sb	zero,3(a4)
    1c16:	4591                	li	a1,4
    1c18:	00470693          	addi	a3,a4,4
    1c1c:	12b78d63          	beq	a5,a1,1d56 <strncpy+0x252>
    1c20:	00070223          	sb	zero,4(a4)
    1c24:	4595                	li	a1,5
    1c26:	00570693          	addi	a3,a4,5
    1c2a:	12b78863          	beq	a5,a1,1d5a <strncpy+0x256>
    1c2e:	000702a3          	sb	zero,5(a4)
    1c32:	459d                	li	a1,7
    1c34:	00670693          	addi	a3,a4,6
    1c38:	12b79363          	bne	a5,a1,1d5e <strncpy+0x25a>
    1c3c:	00770693          	addi	a3,a4,7
    1c40:	00070323          	sb	zero,6(a4)
    1c44:	40f80833          	sub	a6,a6,a5
    1c48:	ff887513          	andi	a0,a6,-8
    1c4c:	97ba                	add	a5,a5,a4
    1c4e:	953e                	add	a0,a0,a5
    1c50:	0007b023          	sd	zero,0(a5)
    1c54:	07a1                	addi	a5,a5,8
    1c56:	fea79de3          	bne	a5,a0,1c50 <strncpy+0x14c>
    1c5a:	ff887513          	andi	a0,a6,-8
    1c5e:	9da9                	addw	a1,a1,a0
    1c60:	00a687b3          	add	a5,a3,a0
    1c64:	f4a80de3          	beq	a6,a0,1bbe <strncpy+0xba>
    1c68:	00078023          	sb	zero,0(a5)
    1c6c:	0015869b          	addiw	a3,a1,1
    1c70:	f4c6f7e3          	bleu	a2,a3,1bbe <strncpy+0xba>
    1c74:	000780a3          	sb	zero,1(a5)
    1c78:	0025869b          	addiw	a3,a1,2
    1c7c:	f4c6f1e3          	bleu	a2,a3,1bbe <strncpy+0xba>
    1c80:	00078123          	sb	zero,2(a5)
    1c84:	0035869b          	addiw	a3,a1,3
    1c88:	f2c6fbe3          	bleu	a2,a3,1bbe <strncpy+0xba>
    1c8c:	000781a3          	sb	zero,3(a5)
    1c90:	0045869b          	addiw	a3,a1,4
    1c94:	f2c6f5e3          	bleu	a2,a3,1bbe <strncpy+0xba>
    1c98:	00078223          	sb	zero,4(a5)
    1c9c:	0055869b          	addiw	a3,a1,5
    1ca0:	f0c6ffe3          	bleu	a2,a3,1bbe <strncpy+0xba>
    1ca4:	000782a3          	sb	zero,5(a5)
    1ca8:	0065869b          	addiw	a3,a1,6
    1cac:	f0c6f9e3          	bleu	a2,a3,1bbe <strncpy+0xba>
    1cb0:	00078323          	sb	zero,6(a5)
    1cb4:	0075869b          	addiw	a3,a1,7
    1cb8:	f0c6f3e3          	bleu	a2,a3,1bbe <strncpy+0xba>
    1cbc:	000783a3          	sb	zero,7(a5)
    1cc0:	0085869b          	addiw	a3,a1,8
    1cc4:	eec6fde3          	bleu	a2,a3,1bbe <strncpy+0xba>
    1cc8:	00078423          	sb	zero,8(a5)
    1ccc:	0095869b          	addiw	a3,a1,9
    1cd0:	eec6f7e3          	bleu	a2,a3,1bbe <strncpy+0xba>
    1cd4:	000784a3          	sb	zero,9(a5)
    1cd8:	00a5869b          	addiw	a3,a1,10
    1cdc:	eec6f1e3          	bleu	a2,a3,1bbe <strncpy+0xba>
    1ce0:	00078523          	sb	zero,10(a5)
    1ce4:	00b5869b          	addiw	a3,a1,11
    1ce8:	ecc6fbe3          	bleu	a2,a3,1bbe <strncpy+0xba>
    1cec:	000785a3          	sb	zero,11(a5)
    1cf0:	00c5869b          	addiw	a3,a1,12
    1cf4:	ecc6f5e3          	bleu	a2,a3,1bbe <strncpy+0xba>
    1cf8:	00078623          	sb	zero,12(a5)
    1cfc:	25b5                	addiw	a1,a1,13
    1cfe:	ecc5f0e3          	bleu	a2,a1,1bbe <strncpy+0xba>
    1d02:	000786a3          	sb	zero,13(a5)
}
    1d06:	853a                	mv	a0,a4
    1d08:	8082                	ret
    1d0a:	46ad                	li	a3,11
    1d0c:	bdd1                	j	1be0 <strncpy+0xdc>
    1d0e:	00778693          	addi	a3,a5,7
    1d12:	452d                	li	a0,11
    1d14:	fff60593          	addi	a1,a2,-1
    1d18:	eca6f4e3          	bleu	a0,a3,1be0 <strncpy+0xdc>
    1d1c:	b7fd                	j	1d0a <strncpy+0x206>
    1d1e:	40e007b3          	neg	a5,a4
    1d22:	8832                	mv	a6,a2
    1d24:	8b9d                	andi	a5,a5,7
    1d26:	4581                	li	a1,0
    1d28:	ea0607e3          	beqz	a2,1bd6 <strncpy+0xd2>
    1d2c:	b7cd                	j	1d0e <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d2e:	872a                	mv	a4,a0
}
    1d30:	853a                	mv	a0,a4
    1d32:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d34:	458d                	li	a1,3
    1d36:	b739                	j	1c44 <strncpy+0x140>
    1d38:	4585                	li	a1,1
    1d3a:	b729                	j	1c44 <strncpy+0x140>
    1d3c:	86ba                	mv	a3,a4
    1d3e:	4581                	li	a1,0
    1d40:	b711                	j	1c44 <strncpy+0x140>
    1d42:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d46:	872a                	mv	a4,a0
    1d48:	85b6                	mv	a1,a3
    1d4a:	bda9                	j	1ba4 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d4c:	87ba                	mv	a5,a4
    1d4e:	4581                	li	a1,0
    1d50:	bf21                	j	1c68 <strncpy+0x164>
    1d52:	4589                	li	a1,2
    1d54:	bdc5                	j	1c44 <strncpy+0x140>
    1d56:	4591                	li	a1,4
    1d58:	b5f5                	j	1c44 <strncpy+0x140>
    1d5a:	4595                	li	a1,5
    1d5c:	b5e5                	j	1c44 <strncpy+0x140>
    1d5e:	4599                	li	a1,6
    1d60:	b5d5                	j	1c44 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d62:	00d50023          	sb	a3,0(a0)
    1d66:	872a                	mv	a4,a0
    1d68:	b5b9                	j	1bb6 <strncpy+0xb2>

0000000000001d6a <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d6a:	87aa                	mv	a5,a0
    1d6c:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d6e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d72:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d76:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d78:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d7a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d7e:	2501                	sext.w	a0,a0
    1d80:	8082                	ret

0000000000001d82 <openat>:
    register long a7 __asm__("a7") = n;
    1d82:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d86:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d8a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <close>:
    register long a7 __asm__("a7") = n;
    1d92:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d96:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <read>:
    register long a7 __asm__("a7") = n;
    1d9e:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1da2:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1da6:	8082                	ret

0000000000001da8 <write>:
    register long a7 __asm__("a7") = n;
    1da8:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dac:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1db0:	8082                	ret

0000000000001db2 <getpid>:
    register long a7 __asm__("a7") = n;
    1db2:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1db6:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <getppid>:
    register long a7 __asm__("a7") = n;
    1dbe:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1dc2:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1dc6:	2501                	sext.w	a0,a0
    1dc8:	8082                	ret

0000000000001dca <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dca:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1dce:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dd2:	2501                	sext.w	a0,a0
    1dd4:	8082                	ret

0000000000001dd6 <fork>:
    register long a7 __asm__("a7") = n;
    1dd6:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1dda:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1ddc:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dde:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1de6:	85b2                	mv	a1,a2
    1de8:	863a                	mv	a2,a4
    if (stack)
    1dea:	c191                	beqz	a1,1dee <clone+0x8>
	stack += stack_size;
    1dec:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dee:	4781                	li	a5,0
    1df0:	4701                	li	a4,0
    1df2:	4681                	li	a3,0
    1df4:	2601                	sext.w	a2,a2
    1df6:	1ec0006f          	j	1fe2 <__clone>

0000000000001dfa <exit>:
    register long a7 __asm__("a7") = n;
    1dfa:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dfe:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e02:	8082                	ret

0000000000001e04 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e04:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e08:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e0a:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e0e:	2501                	sext.w	a0,a0
    1e10:	8082                	ret

0000000000001e12 <exec>:
    register long a7 __asm__("a7") = n;
    1e12:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e16:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e1a:	2501                	sext.w	a0,a0
    1e1c:	8082                	ret

0000000000001e1e <execve>:
    register long a7 __asm__("a7") = n;
    1e1e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e22:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e26:	2501                	sext.w	a0,a0
    1e28:	8082                	ret

0000000000001e2a <times>:
    register long a7 __asm__("a7") = n;
    1e2a:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e2e:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e32:	2501                	sext.w	a0,a0
    1e34:	8082                	ret

0000000000001e36 <get_time>:

int64 get_time()
{
    1e36:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e38:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e3c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e3e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e40:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e44:	2501                	sext.w	a0,a0
    1e46:	ed09                	bnez	a0,1e60 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e48:	67a2                	ld	a5,8(sp)
    1e4a:	3e800713          	li	a4,1000
    1e4e:	00015503          	lhu	a0,0(sp)
    1e52:	02e7d7b3          	divu	a5,a5,a4
    1e56:	02e50533          	mul	a0,a0,a4
    1e5a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e5c:	0141                	addi	sp,sp,16
    1e5e:	8082                	ret
        return -1;
    1e60:	557d                	li	a0,-1
    1e62:	bfed                	j	1e5c <get_time+0x26>

0000000000001e64 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e64:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e68:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <time>:
    register long a7 __asm__("a7") = n;
    1e70:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e74:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <sleep>:

int sleep(unsigned long long time)
{
    1e7c:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e7e:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e80:	850a                	mv	a0,sp
    1e82:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e84:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e88:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8a:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e8e:	e501                	bnez	a0,1e96 <sleep+0x1a>
    return 0;
    1e90:	4501                	li	a0,0
}
    1e92:	0141                	addi	sp,sp,16
    1e94:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e96:	4502                	lw	a0,0(sp)
}
    1e98:	0141                	addi	sp,sp,16
    1e9a:	8082                	ret

0000000000001e9c <set_priority>:
    register long a7 __asm__("a7") = n;
    1e9c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1ea0:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ea4:	2501                	sext.w	a0,a0
    1ea6:	8082                	ret

0000000000001ea8 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1ea8:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1eac:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1eb0:	8082                	ret

0000000000001eb2 <munmap>:
    register long a7 __asm__("a7") = n;
    1eb2:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb6:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <wait>:

int wait(int *code)
{
    1ebe:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ec0:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ec4:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ec6:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1ec8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1eca:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ece:	2501                	sext.w	a0,a0
    1ed0:	8082                	ret

0000000000001ed2 <spawn>:
    register long a7 __asm__("a7") = n;
    1ed2:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ed6:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1eda:	2501                	sext.w	a0,a0
    1edc:	8082                	ret

0000000000001ede <mailread>:
    register long a7 __asm__("a7") = n;
    1ede:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee2:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ee6:	2501                	sext.w	a0,a0
    1ee8:	8082                	ret

0000000000001eea <mailwrite>:
    register long a7 __asm__("a7") = n;
    1eea:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eee:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ef2:	2501                	sext.w	a0,a0
    1ef4:	8082                	ret

0000000000001ef6 <fstat>:
    register long a7 __asm__("a7") = n;
    1ef6:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1efa:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1efe:	2501                	sext.w	a0,a0
    1f00:	8082                	ret

0000000000001f02 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1f02:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f04:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f08:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f0a:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f0e:	2501                	sext.w	a0,a0
    1f10:	8082                	ret

0000000000001f12 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f12:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f14:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f18:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f1a:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f1e:	2501                	sext.w	a0,a0
    1f20:	8082                	ret

0000000000001f22 <link>:

int link(char *old_path, char *new_path)
{
    1f22:	87aa                	mv	a5,a0
    1f24:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f26:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f2a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f2e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f30:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f34:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f36:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f3a:	2501                	sext.w	a0,a0
    1f3c:	8082                	ret

0000000000001f3e <unlink>:

int unlink(char *path)
{
    1f3e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f40:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f44:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f48:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f4a:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f4e:	2501                	sext.w	a0,a0
    1f50:	8082                	ret

0000000000001f52 <uname>:
    register long a7 __asm__("a7") = n;
    1f52:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f56:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f5a:	2501                	sext.w	a0,a0
    1f5c:	8082                	ret

0000000000001f5e <brk>:
    register long a7 __asm__("a7") = n;
    1f5e:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f62:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f66:	2501                	sext.w	a0,a0
    1f68:	8082                	ret

0000000000001f6a <getcwd>:
    register long a7 __asm__("a7") = n;
    1f6a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f6c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f70:	8082                	ret

0000000000001f72 <chdir>:
    register long a7 __asm__("a7") = n;
    1f72:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f76:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f7a:	2501                	sext.w	a0,a0
    1f7c:	8082                	ret

0000000000001f7e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f7e:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f80:	02059613          	slli	a2,a1,0x20
    1f84:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f86:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f8a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f8e:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f90:	00000073          	ecall
}
    1f94:	2501                	sext.w	a0,a0
    1f96:	8082                	ret

0000000000001f98 <getdents>:
    register long a7 __asm__("a7") = n;
    1f98:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f9c:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1fa0:	2501                	sext.w	a0,a0
    1fa2:	8082                	ret

0000000000001fa4 <pipe>:
    register long a7 __asm__("a7") = n;
    1fa4:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1fa8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1faa:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1fae:	2501                	sext.w	a0,a0
    1fb0:	8082                	ret

0000000000001fb2 <dup>:
    register long a7 __asm__("a7") = n;
    1fb2:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1fb4:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1fb8:	2501                	sext.w	a0,a0
    1fba:	8082                	ret

0000000000001fbc <dup2>:
    register long a7 __asm__("a7") = n;
    1fbc:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fbe:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fc0:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fc4:	2501                	sext.w	a0,a0
    1fc6:	8082                	ret

0000000000001fc8 <mount>:
    register long a7 __asm__("a7") = n;
    1fc8:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fcc:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fd0:	2501                	sext.w	a0,a0
    1fd2:	8082                	ret

0000000000001fd4 <umount>:
    register long a7 __asm__("a7") = n;
    1fd4:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fd8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fda:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fde:	2501                	sext.w	a0,a0
    1fe0:	8082                	ret

0000000000001fe2 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fe2:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fe4:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fe6:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fe8:	8532                	mv	a0,a2
	mv a2, a4
    1fea:	863a                	mv	a2,a4
	mv a3, a5
    1fec:	86be                	mv	a3,a5
	mv a4, a6
    1fee:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1ff0:	0dc00893          	li	a7,220
	ecall
    1ff4:	00000073          	ecall

	beqz a0, 1f
    1ff8:	c111                	beqz	a0,1ffc <__clone+0x1a>
	# Parent
	ret
    1ffa:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1ffc:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1ffe:	6522                	ld	a0,8(sp)
	jalr a1
    2000:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    2002:	05d00893          	li	a7,93
	ecall
    2006:	00000073          	ecall
