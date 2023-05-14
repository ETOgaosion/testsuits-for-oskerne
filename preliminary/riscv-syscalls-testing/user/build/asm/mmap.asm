
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/mmap:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0fe0006f          	j	1100 <__start_main>

0000000000001006 <test_mmap>:
 * "  Hello, mmap success"
 * 测试失败时输出：
 * "mmap error."
 */
static struct kstat kst;
void test_mmap(void){
    1006:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	02050513          	addi	a0,a0,32 # 2028 <__clone+0x2c>
void test_mmap(void){
    1010:	ec06                	sd	ra,24(sp)
    1012:	e822                	sd	s0,16(sp)
    1014:	e426                	sd	s1,8(sp)
    1016:	e04a                	sd	s2,0(sp)
    TEST_START(__func__);
    1018:	2e8000ef          	jal	ra,1300 <puts>
    101c:	00001517          	auipc	a0,0x1
    1020:	14c50513          	addi	a0,a0,332 # 2168 <__func__.1213>
    1024:	2dc000ef          	jal	ra,1300 <puts>
    1028:	00001517          	auipc	a0,0x1
    102c:	01850513          	addi	a0,a0,24 # 2040 <__clone+0x44>
    1030:	2d0000ef          	jal	ra,1300 <puts>
    char *array;
    const char *str = "  Hello, mmap successfully!";
    int fd;

    fd = open("test_mmap.txt", O_RDWR | O_CREATE);
    1034:	04200593          	li	a1,66
    1038:	00001517          	auipc	a0,0x1
    103c:	01850513          	addi	a0,a0,24 # 2050 <__clone+0x54>
    1040:	545000ef          	jal	ra,1d84 <open>
    1044:	842a                	mv	s0,a0
    write(fd, str, strlen(str));
    1046:	00001517          	auipc	a0,0x1
    104a:	01a50513          	addi	a0,a0,26 # 2060 <__clone+0x64>
    104e:	059000ef          	jal	ra,18a6 <strlen>
    1052:	862a                	mv	a2,a0
    1054:	00001597          	auipc	a1,0x1
    1058:	00c58593          	addi	a1,a1,12 # 2060 <__clone+0x64>
    105c:	8522                	mv	a0,s0
    105e:	565000ef          	jal	ra,1dc2 <write>
    fstat(fd, &kst);
    1062:	00001497          	auipc	s1,0x1
    1066:	08648493          	addi	s1,s1,134 # 20e8 <kst>
    106a:	85a6                	mv	a1,s1
    106c:	8522                	mv	a0,s0
    106e:	6a3000ef          	jal	ra,1f10 <fstat>
    printf("file len: %d\n", kst.st_size);
    1072:	788c                	ld	a1,48(s1)
    1074:	00001517          	auipc	a0,0x1
    1078:	00c50513          	addi	a0,a0,12 # 2080 <__clone+0x84>
    107c:	2a6000ef          	jal	ra,1322 <printf>
    array = mmap(NULL, kst.st_size, PROT_WRITE | PROT_READ, MAP_FILE | MAP_SHARED, fd, 0);
    1080:	788c                	ld	a1,48(s1)
    1082:	4781                	li	a5,0
    1084:	8722                	mv	a4,s0
    1086:	4685                	li	a3,1
    1088:	460d                	li	a2,3
    108a:	4501                	li	a0,0
    108c:	637000ef          	jal	ra,1ec2 <mmap>
    //printf("return array: %x\n", array);

    if (array == MAP_FAILED) {
    1090:	57fd                	li	a5,-1
    1092:	04f50863          	beq	a0,a5,10e2 <test_mmap+0xdc>
	printf("mmap error.\n");
    }else{
	printf("mmap content: %s\n", array);
    1096:	85aa                	mv	a1,a0
    1098:	892a                	mv	s2,a0
    109a:	00001517          	auipc	a0,0x1
    109e:	00650513          	addi	a0,a0,6 # 20a0 <__clone+0xa4>
    10a2:	280000ef          	jal	ra,1322 <printf>
	//printf("%s\n", str);

	munmap(array, kst.st_size);
    10a6:	788c                	ld	a1,48(s1)
    10a8:	854a                	mv	a0,s2
    10aa:	623000ef          	jal	ra,1ecc <munmap>
    }

    close(fd);
    10ae:	8522                	mv	a0,s0
    10b0:	4fd000ef          	jal	ra,1dac <close>

    TEST_END(__func__);
    10b4:	00001517          	auipc	a0,0x1
    10b8:	00450513          	addi	a0,a0,4 # 20b8 <__clone+0xbc>
    10bc:	244000ef          	jal	ra,1300 <puts>
    10c0:	00001517          	auipc	a0,0x1
    10c4:	0a850513          	addi	a0,a0,168 # 2168 <__func__.1213>
    10c8:	238000ef          	jal	ra,1300 <puts>
}
    10cc:	6442                	ld	s0,16(sp)
    10ce:	60e2                	ld	ra,24(sp)
    10d0:	64a2                	ld	s1,8(sp)
    10d2:	6902                	ld	s2,0(sp)
    TEST_END(__func__);
    10d4:	00001517          	auipc	a0,0x1
    10d8:	f6c50513          	addi	a0,a0,-148 # 2040 <__clone+0x44>
}
    10dc:	6105                	addi	sp,sp,32
    TEST_END(__func__);
    10de:	2220006f          	j	1300 <puts>
	printf("mmap error.\n");
    10e2:	00001517          	auipc	a0,0x1
    10e6:	fae50513          	addi	a0,a0,-82 # 2090 <__clone+0x94>
    10ea:	238000ef          	jal	ra,1322 <printf>
    10ee:	b7c1                	j	10ae <test_mmap+0xa8>

00000000000010f0 <main>:

int main(void){
    10f0:	1141                	addi	sp,sp,-16
    10f2:	e406                	sd	ra,8(sp)
    test_mmap();
    10f4:	f13ff0ef          	jal	ra,1006 <test_mmap>
    return 0;
}
    10f8:	60a2                	ld	ra,8(sp)
    10fa:	4501                	li	a0,0
    10fc:	0141                	addi	sp,sp,16
    10fe:	8082                	ret

0000000000001100 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1100:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1102:	4108                	lw	a0,0(a0)
{
    1104:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1106:	05a1                	addi	a1,a1,8
{
    1108:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    110a:	fe7ff0ef          	jal	ra,10f0 <main>
    110e:	507000ef          	jal	ra,1e14 <exit>
	return 0;
}
    1112:	60a2                	ld	ra,8(sp)
    1114:	4501                	li	a0,0
    1116:	0141                	addi	sp,sp,16
    1118:	8082                	ret

000000000000111a <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    111a:	7179                	addi	sp,sp,-48
    111c:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    111e:	12054e63          	bltz	a0,125a <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    1122:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    1126:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1128:	02b7f6bb          	remuw	a3,a5,a1
    112c:	00001717          	auipc	a4,0x1
    1130:	04c70713          	addi	a4,a4,76 # 2178 <digits>
    buf[16] = 0;
    1134:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1138:	1682                	slli	a3,a3,0x20
    113a:	9281                	srli	a3,a3,0x20
    113c:	96ba                	add	a3,a3,a4
    113e:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1142:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1146:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    114a:	16b7e363          	bltu	a5,a1,12b0 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    114e:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1152:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1156:	1602                	slli	a2,a2,0x20
    1158:	9201                	srli	a2,a2,0x20
    115a:	963a                	add	a2,a2,a4
    115c:	00064603          	lbu	a2,0(a2)
    1160:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1164:	0007861b          	sext.w	a2,a5
    1168:	12b6e863          	bltu	a3,a1,1298 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    116c:	02b7f6bb          	remuw	a3,a5,a1
    1170:	1682                	slli	a3,a3,0x20
    1172:	9281                	srli	a3,a3,0x20
    1174:	96ba                	add	a3,a3,a4
    1176:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    117a:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    117e:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1182:	10b66e63          	bltu	a2,a1,129e <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1186:	02b876bb          	remuw	a3,a6,a1
    118a:	1682                	slli	a3,a3,0x20
    118c:	9281                	srli	a3,a3,0x20
    118e:	96ba                	add	a3,a3,a4
    1190:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1194:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1198:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    119c:	10b86463          	bltu	a6,a1,12a4 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    11a0:	02b676bb          	remuw	a3,a2,a1
    11a4:	1682                	slli	a3,a3,0x20
    11a6:	9281                	srli	a3,a3,0x20
    11a8:	96ba                	add	a3,a3,a4
    11aa:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ae:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11b2:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    11b6:	0eb66a63          	bltu	a2,a1,12aa <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    11ba:	02b876bb          	remuw	a3,a6,a1
    11be:	1682                	slli	a3,a3,0x20
    11c0:	9281                	srli	a3,a3,0x20
    11c2:	96ba                	add	a3,a3,a4
    11c4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c8:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11cc:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11d0:	0cb86163          	bltu	a6,a1,1292 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    11d4:	02b676bb          	remuw	a3,a2,a1
    11d8:	1682                	slli	a3,a3,0x20
    11da:	9281                	srli	a3,a3,0x20
    11dc:	96ba                	add	a3,a3,a4
    11de:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11e2:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11e6:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11ea:	0cb66563          	bltu	a2,a1,12b4 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11ee:	02b876bb          	remuw	a3,a6,a1
    11f2:	1682                	slli	a3,a3,0x20
    11f4:	9281                	srli	a3,a3,0x20
    11f6:	96ba                	add	a3,a3,a4
    11f8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11fc:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1200:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1204:	0ab86b63          	bltu	a6,a1,12ba <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1208:	02b676bb          	remuw	a3,a2,a1
    120c:	1682                	slli	a3,a3,0x20
    120e:	9281                	srli	a3,a3,0x20
    1210:	96ba                	add	a3,a3,a4
    1212:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1216:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    121a:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    121e:	0ab66163          	bltu	a2,a1,12c0 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    1222:	1782                	slli	a5,a5,0x20
    1224:	9381                	srli	a5,a5,0x20
    1226:	97ba                	add	a5,a5,a4
    1228:	0007c703          	lbu	a4,0(a5)
    122c:	4599                	li	a1,6
    122e:	4795                	li	a5,5
    1230:	00e10723          	sb	a4,14(sp)

    if (sign)
    1234:	00055963          	bgez	a0,1246 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1238:	1018                	addi	a4,sp,32
    123a:	973e                	add	a4,a4,a5
    123c:	02d00693          	li	a3,45
    1240:	fed70423          	sb	a3,-24(a4)
    1244:	85be                	mv	a1,a5
    write(f, s, l);
    1246:	003c                	addi	a5,sp,8
    1248:	4641                	li	a2,16
    124a:	9e0d                	subw	a2,a2,a1
    124c:	4505                	li	a0,1
    124e:	95be                	add	a1,a1,a5
    1250:	373000ef          	jal	ra,1dc2 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1254:	70a2                	ld	ra,40(sp)
    1256:	6145                	addi	sp,sp,48
    1258:	8082                	ret
        x = -xx;
    125a:	40a0063b          	negw	a2,a0
    125e:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1260:	02b677bb          	remuw	a5,a2,a1
    1264:	00001717          	auipc	a4,0x1
    1268:	f1470713          	addi	a4,a4,-236 # 2178 <digits>
    buf[16] = 0;
    126c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1270:	1782                	slli	a5,a5,0x20
    1272:	9381                	srli	a5,a5,0x20
    1274:	97ba                	add	a5,a5,a4
    1276:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    127a:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    127e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1282:	ecb676e3          	bleu	a1,a2,114e <printint.constprop.0+0x34>
        buf[i--] = '-';
    1286:	02d00793          	li	a5,45
    128a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    128e:	45b9                	li	a1,14
    1290:	bf5d                	j	1246 <printint.constprop.0+0x12c>
    1292:	47a5                	li	a5,9
    1294:	45a9                	li	a1,10
    1296:	bf79                	j	1234 <printint.constprop.0+0x11a>
    1298:	47b5                	li	a5,13
    129a:	45b9                	li	a1,14
    129c:	bf61                	j	1234 <printint.constprop.0+0x11a>
    129e:	47b1                	li	a5,12
    12a0:	45b5                	li	a1,13
    12a2:	bf49                	j	1234 <printint.constprop.0+0x11a>
    12a4:	47ad                	li	a5,11
    12a6:	45b1                	li	a1,12
    12a8:	b771                	j	1234 <printint.constprop.0+0x11a>
    12aa:	47a9                	li	a5,10
    12ac:	45ad                	li	a1,11
    12ae:	b759                	j	1234 <printint.constprop.0+0x11a>
    i = 15;
    12b0:	45bd                	li	a1,15
    12b2:	bf51                	j	1246 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    12b4:	47a1                	li	a5,8
    12b6:	45a5                	li	a1,9
    12b8:	bfb5                	j	1234 <printint.constprop.0+0x11a>
    12ba:	479d                	li	a5,7
    12bc:	45a1                	li	a1,8
    12be:	bf9d                	j	1234 <printint.constprop.0+0x11a>
    12c0:	4799                	li	a5,6
    12c2:	459d                	li	a1,7
    12c4:	bf85                	j	1234 <printint.constprop.0+0x11a>

00000000000012c6 <getchar>:
{
    12c6:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12c8:	00f10593          	addi	a1,sp,15
    12cc:	4605                	li	a2,1
    12ce:	4501                	li	a0,0
{
    12d0:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12d2:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12d6:	2e3000ef          	jal	ra,1db8 <read>
}
    12da:	60e2                	ld	ra,24(sp)
    12dc:	00f14503          	lbu	a0,15(sp)
    12e0:	6105                	addi	sp,sp,32
    12e2:	8082                	ret

00000000000012e4 <putchar>:
{
    12e4:	1101                	addi	sp,sp,-32
    char byte = c;
    12e6:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12ea:	00f10593          	addi	a1,sp,15
    12ee:	4605                	li	a2,1
    12f0:	4505                	li	a0,1
{
    12f2:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12f4:	2cf000ef          	jal	ra,1dc2 <write>
}
    12f8:	60e2                	ld	ra,24(sp)
    12fa:	2501                	sext.w	a0,a0
    12fc:	6105                	addi	sp,sp,32
    12fe:	8082                	ret

0000000000001300 <puts>:
{
    1300:	1141                	addi	sp,sp,-16
    1302:	e406                	sd	ra,8(sp)
    1304:	e022                	sd	s0,0(sp)
    1306:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1308:	59e000ef          	jal	ra,18a6 <strlen>
    130c:	862a                	mv	a2,a0
    130e:	85a2                	mv	a1,s0
    1310:	4505                	li	a0,1
    1312:	2b1000ef          	jal	ra,1dc2 <write>
}
    1316:	60a2                	ld	ra,8(sp)
    1318:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    131a:	957d                	srai	a0,a0,0x3f
    return r;
    131c:	2501                	sext.w	a0,a0
}
    131e:	0141                	addi	sp,sp,16
    1320:	8082                	ret

0000000000001322 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1322:	7131                	addi	sp,sp,-192
    1324:	e0da                	sd	s6,64(sp)
    1326:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1328:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    132a:	013c                	addi	a5,sp,136
{
    132c:	f0ca                	sd	s2,96(sp)
    132e:	ecce                	sd	s3,88(sp)
    1330:	e8d2                	sd	s4,80(sp)
    1332:	e4d6                	sd	s5,72(sp)
    1334:	fc5e                	sd	s7,56(sp)
    1336:	fc86                	sd	ra,120(sp)
    1338:	f8a2                	sd	s0,112(sp)
    133a:	f4a6                	sd	s1,104(sp)
    133c:	89aa                	mv	s3,a0
    133e:	e52e                	sd	a1,136(sp)
    1340:	e932                	sd	a2,144(sp)
    1342:	ed36                	sd	a3,152(sp)
    1344:	f13a                	sd	a4,160(sp)
    1346:	f942                	sd	a6,176(sp)
    1348:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    134a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    134c:	02500913          	li	s2,37
    1350:	07000a93          	li	s5,112
    buf[i++] = '0';
    1354:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1358:	00001a17          	auipc	s4,0x1
    135c:	e20a0a13          	addi	s4,s4,-480 # 2178 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1360:	00001b97          	auipc	s7,0x1
    1364:	d68b8b93          	addi	s7,s7,-664 # 20c8 <__clone+0xcc>
        if (!*s)
    1368:	0009c783          	lbu	a5,0(s3)
    136c:	cfb9                	beqz	a5,13ca <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    136e:	23278d63          	beq	a5,s2,15a8 <printf+0x286>
    1372:	864e                	mv	a2,s3
    1374:	a019                	j	137a <printf+0x58>
    1376:	07278563          	beq	a5,s2,13e0 <printf+0xbe>
    137a:	0605                	addi	a2,a2,1
    137c:	00064783          	lbu	a5,0(a2)
    1380:	fbfd                	bnez	a5,1376 <printf+0x54>
    1382:	84b2                	mv	s1,a2
        l = z - a;
    1384:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1388:	8622                	mv	a2,s0
    138a:	85ce                	mv	a1,s3
    138c:	4505                	li	a0,1
    138e:	235000ef          	jal	ra,1dc2 <write>
        if (l)
    1392:	ec3d                	bnez	s0,1410 <printf+0xee>
        if (s[1] == 0)
    1394:	0014c783          	lbu	a5,1(s1)
    1398:	cb8d                	beqz	a5,13ca <printf+0xa8>
        switch (s[1])
    139a:	09578b63          	beq	a5,s5,1430 <printf+0x10e>
    139e:	06fafb63          	bleu	a5,s5,1414 <printf+0xf2>
    13a2:	07300713          	li	a4,115
    13a6:	1ce78e63          	beq	a5,a4,1582 <printf+0x260>
    13aa:	07800713          	li	a4,120
    13ae:	1ae79563          	bne	a5,a4,1558 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    13b2:	6782                	ld	a5,0(sp)
    13b4:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    13b6:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    13ba:	4388                	lw	a0,0(a5)
    13bc:	07a1                	addi	a5,a5,8
    13be:	e03e                	sd	a5,0(sp)
    13c0:	d5bff0ef          	jal	ra,111a <printint.constprop.0>
        if (!*s)
    13c4:	0009c783          	lbu	a5,0(s3)
    13c8:	f3dd                	bnez	a5,136e <printf+0x4c>
    }
    va_end(ap);
}
    13ca:	70e6                	ld	ra,120(sp)
    13cc:	7446                	ld	s0,112(sp)
    13ce:	74a6                	ld	s1,104(sp)
    13d0:	7906                	ld	s2,96(sp)
    13d2:	69e6                	ld	s3,88(sp)
    13d4:	6a46                	ld	s4,80(sp)
    13d6:	6aa6                	ld	s5,72(sp)
    13d8:	6b06                	ld	s6,64(sp)
    13da:	7be2                	ld	s7,56(sp)
    13dc:	6129                	addi	sp,sp,192
    13de:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13e0:	00164783          	lbu	a5,1(a2)
    13e4:	84b2                	mv	s1,a2
    13e6:	01278763          	beq	a5,s2,13f4 <printf+0xd2>
    13ea:	bf69                	j	1384 <printf+0x62>
    13ec:	0014c783          	lbu	a5,1(s1)
    13f0:	f9279ae3          	bne	a5,s2,1384 <printf+0x62>
    13f4:	0489                	addi	s1,s1,2
    13f6:	0004c783          	lbu	a5,0(s1)
    13fa:	0605                	addi	a2,a2,1
    13fc:	ff2788e3          	beq	a5,s2,13ec <printf+0xca>
        l = z - a;
    1400:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1404:	8622                	mv	a2,s0
    1406:	85ce                	mv	a1,s3
    1408:	4505                	li	a0,1
    140a:	1b9000ef          	jal	ra,1dc2 <write>
        if (l)
    140e:	d059                	beqz	s0,1394 <printf+0x72>
    1410:	89a6                	mv	s3,s1
    1412:	bf99                	j	1368 <printf+0x46>
    1414:	06400713          	li	a4,100
    1418:	14e79063          	bne	a5,a4,1558 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    141c:	6782                	ld	a5,0(sp)
    141e:	45a9                	li	a1,10
        s += 2;
    1420:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    1424:	4388                	lw	a0,0(a5)
    1426:	07a1                	addi	a5,a5,8
    1428:	e03e                	sd	a5,0(sp)
    142a:	cf1ff0ef          	jal	ra,111a <printint.constprop.0>
        s += 2;
    142e:	bf59                	j	13c4 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    1430:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1432:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1436:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1438:	631c                	ld	a5,0(a4)
    143a:	0721                	addi	a4,a4,8
    143c:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    143e:	00479293          	slli	t0,a5,0x4
    1442:	00879f93          	slli	t6,a5,0x8
    1446:	00c79f13          	slli	t5,a5,0xc
    144a:	01079e93          	slli	t4,a5,0x10
    144e:	01479e13          	slli	t3,a5,0x14
    1452:	01879313          	slli	t1,a5,0x18
    1456:	01c79893          	slli	a7,a5,0x1c
    145a:	02479813          	slli	a6,a5,0x24
    145e:	02879513          	slli	a0,a5,0x28
    1462:	02c79593          	slli	a1,a5,0x2c
    1466:	03079693          	slli	a3,a5,0x30
    146a:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    146e:	03c7d413          	srli	s0,a5,0x3c
    1472:	01c7d39b          	srliw	t2,a5,0x1c
    1476:	03c2d293          	srli	t0,t0,0x3c
    147a:	03cfdf93          	srli	t6,t6,0x3c
    147e:	03cf5f13          	srli	t5,t5,0x3c
    1482:	03cede93          	srli	t4,t4,0x3c
    1486:	03ce5e13          	srli	t3,t3,0x3c
    148a:	03c35313          	srli	t1,t1,0x3c
    148e:	03c8d893          	srli	a7,a7,0x3c
    1492:	03c85813          	srli	a6,a6,0x3c
    1496:	9171                	srli	a0,a0,0x3c
    1498:	91f1                	srli	a1,a1,0x3c
    149a:	92f1                	srli	a3,a3,0x3c
    149c:	9371                	srli	a4,a4,0x3c
    149e:	96d2                	add	a3,a3,s4
    14a0:	9752                	add	a4,a4,s4
    14a2:	9452                	add	s0,s0,s4
    14a4:	92d2                	add	t0,t0,s4
    14a6:	9fd2                	add	t6,t6,s4
    14a8:	9f52                	add	t5,t5,s4
    14aa:	9ed2                	add	t4,t4,s4
    14ac:	9e52                	add	t3,t3,s4
    14ae:	9352                	add	t1,t1,s4
    14b0:	98d2                	add	a7,a7,s4
    14b2:	93d2                	add	t2,t2,s4
    14b4:	9852                	add	a6,a6,s4
    14b6:	9552                	add	a0,a0,s4
    14b8:	95d2                	add	a1,a1,s4
    14ba:	0006c983          	lbu	s3,0(a3)
    14be:	0002c283          	lbu	t0,0(t0)
    14c2:	00074683          	lbu	a3,0(a4)
    14c6:	000fcf83          	lbu	t6,0(t6)
    14ca:	000f4f03          	lbu	t5,0(t5)
    14ce:	000ece83          	lbu	t4,0(t4)
    14d2:	000e4e03          	lbu	t3,0(t3)
    14d6:	00034303          	lbu	t1,0(t1)
    14da:	0008c883          	lbu	a7,0(a7)
    14de:	0003c383          	lbu	t2,0(t2)
    14e2:	00084803          	lbu	a6,0(a6)
    14e6:	00054503          	lbu	a0,0(a0)
    14ea:	0005c583          	lbu	a1,0(a1)
    14ee:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14f2:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14f6:	9371                	srli	a4,a4,0x3c
    14f8:	8bbd                	andi	a5,a5,15
    14fa:	9752                	add	a4,a4,s4
    14fc:	97d2                	add	a5,a5,s4
    14fe:	005105a3          	sb	t0,11(sp)
    1502:	01f10623          	sb	t6,12(sp)
    1506:	01e106a3          	sb	t5,13(sp)
    150a:	01d10723          	sb	t4,14(sp)
    150e:	01c107a3          	sb	t3,15(sp)
    1512:	00610823          	sb	t1,16(sp)
    1516:	011108a3          	sb	a7,17(sp)
    151a:	00710923          	sb	t2,18(sp)
    151e:	010109a3          	sb	a6,19(sp)
    1522:	00a10a23          	sb	a0,20(sp)
    1526:	00b10aa3          	sb	a1,21(sp)
    152a:	01310b23          	sb	s3,22(sp)
    152e:	00d10ba3          	sb	a3,23(sp)
    1532:	00810523          	sb	s0,10(sp)
    1536:	00074703          	lbu	a4,0(a4)
    153a:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    153e:	002c                	addi	a1,sp,8
    1540:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1542:	00e10c23          	sb	a4,24(sp)
    1546:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    154a:	00010d23          	sb	zero,26(sp)
        s += 2;
    154e:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1552:	071000ef          	jal	ra,1dc2 <write>
        s += 2;
    1556:	b5bd                	j	13c4 <printf+0xa2>
    char byte = c;
    1558:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    155c:	4605                	li	a2,1
    155e:	002c                	addi	a1,sp,8
    1560:	4505                	li	a0,1
    char byte = c;
    1562:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1566:	05d000ef          	jal	ra,1dc2 <write>
    char byte = c;
    156a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    156e:	4605                	li	a2,1
    1570:	002c                	addi	a1,sp,8
    1572:	4505                	li	a0,1
    char byte = c;
    1574:	00f10423          	sb	a5,8(sp)
        s += 2;
    1578:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    157c:	047000ef          	jal	ra,1dc2 <write>
        s += 2;
    1580:	b591                	j	13c4 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1582:	6782                	ld	a5,0(sp)
    1584:	6380                	ld	s0,0(a5)
    1586:	07a1                	addi	a5,a5,8
    1588:	e03e                	sd	a5,0(sp)
    158a:	cc05                	beqz	s0,15c2 <printf+0x2a0>
            l = strnlen(a, 200);
    158c:	0c800593          	li	a1,200
    1590:	8522                	mv	a0,s0
    1592:	446000ef          	jal	ra,19d8 <strnlen>
    write(f, s, l);
    1596:	0005061b          	sext.w	a2,a0
    159a:	85a2                	mv	a1,s0
    159c:	4505                	li	a0,1
    159e:	025000ef          	jal	ra,1dc2 <write>
        s += 2;
    15a2:	00248993          	addi	s3,s1,2
    15a6:	bd39                	j	13c4 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    15a8:	0019c783          	lbu	a5,1(s3)
    15ac:	84ce                	mv	s1,s3
    15ae:	864e                	mv	a2,s3
    15b0:	e52782e3          	beq	a5,s2,13f4 <printf+0xd2>
    write(f, s, l);
    15b4:	4601                	li	a2,0
    15b6:	85ce                	mv	a1,s3
    15b8:	4505                	li	a0,1
    15ba:	009000ef          	jal	ra,1dc2 <write>
    15be:	84ce                	mv	s1,s3
    15c0:	bbd1                	j	1394 <printf+0x72>
                a = "(null)";
    15c2:	845e                	mv	s0,s7
    15c4:	b7e1                	j	158c <printf+0x26a>

00000000000015c6 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c6:	02000793          	li	a5,32
    15ca:	00f50663          	beq	a0,a5,15d6 <isspace+0x10>
    15ce:	355d                	addiw	a0,a0,-9
    15d0:	00553513          	sltiu	a0,a0,5
    15d4:	8082                	ret
    15d6:	4505                	li	a0,1
}
    15d8:	8082                	ret

00000000000015da <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15da:	fd05051b          	addiw	a0,a0,-48
}
    15de:	00a53513          	sltiu	a0,a0,10
    15e2:	8082                	ret

00000000000015e4 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e4:	02000613          	li	a2,32
    15e8:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15ea:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ee:	0007079b          	sext.w	a5,a4
    15f2:	ff77869b          	addiw	a3,a5,-9
    15f6:	04c70b63          	beq	a4,a2,164c <atoi+0x68>
    15fa:	04d5f963          	bleu	a3,a1,164c <atoi+0x68>
        s++;
    switch (*s)
    15fe:	02b00693          	li	a3,43
    1602:	04d70a63          	beq	a4,a3,1656 <atoi+0x72>
    1606:	02d00693          	li	a3,45
    160a:	06d70463          	beq	a4,a3,1672 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    160e:	fd07859b          	addiw	a1,a5,-48
    1612:	4625                	li	a2,9
    1614:	873e                	mv	a4,a5
    1616:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1618:	4e01                	li	t3,0
    while (isdigit(*s))
    161a:	04b66a63          	bltu	a2,a1,166e <atoi+0x8a>
    int n = 0, neg = 0;
    161e:	4501                	li	a0,0
    while (isdigit(*s))
    1620:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    1622:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    1624:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    1628:	0025179b          	slliw	a5,a0,0x2
    162c:	9d3d                	addw	a0,a0,a5
    162e:	fd07031b          	addiw	t1,a4,-48
    1632:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1636:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    163a:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    163e:	0006071b          	sext.w	a4,a2
    1642:	feb870e3          	bleu	a1,a6,1622 <atoi+0x3e>
    return neg ? n : -n;
    1646:	000e0563          	beqz	t3,1650 <atoi+0x6c>
}
    164a:	8082                	ret
        s++;
    164c:	0505                	addi	a0,a0,1
    164e:	bf71                	j	15ea <atoi+0x6>
    1650:	4113053b          	subw	a0,t1,a7
    1654:	8082                	ret
    while (isdigit(*s))
    1656:	00154783          	lbu	a5,1(a0)
    165a:	4625                	li	a2,9
        s++;
    165c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1660:	fd07859b          	addiw	a1,a5,-48
    1664:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1668:	4e01                	li	t3,0
    while (isdigit(*s))
    166a:	fab67ae3          	bleu	a1,a2,161e <atoi+0x3a>
    166e:	4501                	li	a0,0
}
    1670:	8082                	ret
    while (isdigit(*s))
    1672:	00154783          	lbu	a5,1(a0)
    1676:	4625                	li	a2,9
        s++;
    1678:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    167c:	fd07859b          	addiw	a1,a5,-48
    1680:	0007871b          	sext.w	a4,a5
    1684:	feb665e3          	bltu	a2,a1,166e <atoi+0x8a>
        neg = 1;
    1688:	4e05                	li	t3,1
    168a:	bf51                	j	161e <atoi+0x3a>

000000000000168c <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    168c:	16060d63          	beqz	a2,1806 <memset+0x17a>
    1690:	40a007b3          	neg	a5,a0
    1694:	8b9d                	andi	a5,a5,7
    1696:	00778713          	addi	a4,a5,7
    169a:	482d                	li	a6,11
    169c:	0ff5f593          	andi	a1,a1,255
    16a0:	fff60693          	addi	a3,a2,-1
    16a4:	17076263          	bltu	a4,a6,1808 <memset+0x17c>
    16a8:	16e6ea63          	bltu	a3,a4,181c <memset+0x190>
    16ac:	16078563          	beqz	a5,1816 <memset+0x18a>
    16b0:	00b50023          	sb	a1,0(a0)
    16b4:	4705                	li	a4,1
    16b6:	00150e93          	addi	t4,a0,1
    16ba:	14e78c63          	beq	a5,a4,1812 <memset+0x186>
    16be:	00b500a3          	sb	a1,1(a0)
    16c2:	4709                	li	a4,2
    16c4:	00250e93          	addi	t4,a0,2
    16c8:	14e78d63          	beq	a5,a4,1822 <memset+0x196>
    16cc:	00b50123          	sb	a1,2(a0)
    16d0:	470d                	li	a4,3
    16d2:	00350e93          	addi	t4,a0,3
    16d6:	12e78b63          	beq	a5,a4,180c <memset+0x180>
    16da:	00b501a3          	sb	a1,3(a0)
    16de:	4711                	li	a4,4
    16e0:	00450e93          	addi	t4,a0,4
    16e4:	14e78163          	beq	a5,a4,1826 <memset+0x19a>
    16e8:	00b50223          	sb	a1,4(a0)
    16ec:	4715                	li	a4,5
    16ee:	00550e93          	addi	t4,a0,5
    16f2:	12e78c63          	beq	a5,a4,182a <memset+0x19e>
    16f6:	00b502a3          	sb	a1,5(a0)
    16fa:	471d                	li	a4,7
    16fc:	00650e93          	addi	t4,a0,6
    1700:	12e79763          	bne	a5,a4,182e <memset+0x1a2>
    1704:	00750e93          	addi	t4,a0,7
    1708:	00b50323          	sb	a1,6(a0)
    170c:	4f1d                	li	t5,7
    170e:	00859713          	slli	a4,a1,0x8
    1712:	8f4d                	or	a4,a4,a1
    1714:	01059e13          	slli	t3,a1,0x10
    1718:	01c76e33          	or	t3,a4,t3
    171c:	01859313          	slli	t1,a1,0x18
    1720:	006e6333          	or	t1,t3,t1
    1724:	02059893          	slli	a7,a1,0x20
    1728:	011368b3          	or	a7,t1,a7
    172c:	02859813          	slli	a6,a1,0x28
    1730:	40f60333          	sub	t1,a2,a5
    1734:	0108e833          	or	a6,a7,a6
    1738:	03059693          	slli	a3,a1,0x30
    173c:	00d866b3          	or	a3,a6,a3
    1740:	03859713          	slli	a4,a1,0x38
    1744:	97aa                	add	a5,a5,a0
    1746:	ff837813          	andi	a6,t1,-8
    174a:	8f55                	or	a4,a4,a3
    174c:	00f806b3          	add	a3,a6,a5
    1750:	e398                	sd	a4,0(a5)
    1752:	07a1                	addi	a5,a5,8
    1754:	fed79ee3          	bne	a5,a3,1750 <memset+0xc4>
    1758:	ff837693          	andi	a3,t1,-8
    175c:	00de87b3          	add	a5,t4,a3
    1760:	01e6873b          	addw	a4,a3,t5
    1764:	0ad30663          	beq	t1,a3,1810 <memset+0x184>
    1768:	00b78023          	sb	a1,0(a5)
    176c:	0017069b          	addiw	a3,a4,1
    1770:	08c6fb63          	bleu	a2,a3,1806 <memset+0x17a>
    1774:	00b780a3          	sb	a1,1(a5)
    1778:	0027069b          	addiw	a3,a4,2
    177c:	08c6f563          	bleu	a2,a3,1806 <memset+0x17a>
    1780:	00b78123          	sb	a1,2(a5)
    1784:	0037069b          	addiw	a3,a4,3
    1788:	06c6ff63          	bleu	a2,a3,1806 <memset+0x17a>
    178c:	00b781a3          	sb	a1,3(a5)
    1790:	0047069b          	addiw	a3,a4,4
    1794:	06c6f963          	bleu	a2,a3,1806 <memset+0x17a>
    1798:	00b78223          	sb	a1,4(a5)
    179c:	0057069b          	addiw	a3,a4,5
    17a0:	06c6f363          	bleu	a2,a3,1806 <memset+0x17a>
    17a4:	00b782a3          	sb	a1,5(a5)
    17a8:	0067069b          	addiw	a3,a4,6
    17ac:	04c6fd63          	bleu	a2,a3,1806 <memset+0x17a>
    17b0:	00b78323          	sb	a1,6(a5)
    17b4:	0077069b          	addiw	a3,a4,7
    17b8:	04c6f763          	bleu	a2,a3,1806 <memset+0x17a>
    17bc:	00b783a3          	sb	a1,7(a5)
    17c0:	0087069b          	addiw	a3,a4,8
    17c4:	04c6f163          	bleu	a2,a3,1806 <memset+0x17a>
    17c8:	00b78423          	sb	a1,8(a5)
    17cc:	0097069b          	addiw	a3,a4,9
    17d0:	02c6fb63          	bleu	a2,a3,1806 <memset+0x17a>
    17d4:	00b784a3          	sb	a1,9(a5)
    17d8:	00a7069b          	addiw	a3,a4,10
    17dc:	02c6f563          	bleu	a2,a3,1806 <memset+0x17a>
    17e0:	00b78523          	sb	a1,10(a5)
    17e4:	00b7069b          	addiw	a3,a4,11
    17e8:	00c6ff63          	bleu	a2,a3,1806 <memset+0x17a>
    17ec:	00b785a3          	sb	a1,11(a5)
    17f0:	00c7069b          	addiw	a3,a4,12
    17f4:	00c6f963          	bleu	a2,a3,1806 <memset+0x17a>
    17f8:	00b78623          	sb	a1,12(a5)
    17fc:	2735                	addiw	a4,a4,13
    17fe:	00c77463          	bleu	a2,a4,1806 <memset+0x17a>
    1802:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1806:	8082                	ret
    1808:	472d                	li	a4,11
    180a:	bd79                	j	16a8 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    180c:	4f0d                	li	t5,3
    180e:	b701                	j	170e <memset+0x82>
    1810:	8082                	ret
    1812:	4f05                	li	t5,1
    1814:	bded                	j	170e <memset+0x82>
    1816:	8eaa                	mv	t4,a0
    1818:	4f01                	li	t5,0
    181a:	bdd5                	j	170e <memset+0x82>
    181c:	87aa                	mv	a5,a0
    181e:	4701                	li	a4,0
    1820:	b7a1                	j	1768 <memset+0xdc>
    1822:	4f09                	li	t5,2
    1824:	b5ed                	j	170e <memset+0x82>
    1826:	4f11                	li	t5,4
    1828:	b5dd                	j	170e <memset+0x82>
    182a:	4f15                	li	t5,5
    182c:	b5cd                	j	170e <memset+0x82>
    182e:	4f19                	li	t5,6
    1830:	bdf9                	j	170e <memset+0x82>

0000000000001832 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1832:	00054703          	lbu	a4,0(a0)
    1836:	0005c783          	lbu	a5,0(a1)
    183a:	00e79b63          	bne	a5,a4,1850 <strcmp+0x1e>
    183e:	cf89                	beqz	a5,1858 <strcmp+0x26>
    1840:	0505                	addi	a0,a0,1
    1842:	0585                	addi	a1,a1,1
    1844:	0005c783          	lbu	a5,0(a1)
    1848:	00054703          	lbu	a4,0(a0)
    184c:	fef709e3          	beq	a4,a5,183e <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1850:	0007051b          	sext.w	a0,a4
}
    1854:	9d1d                	subw	a0,a0,a5
    1856:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1858:	4501                	li	a0,0
}
    185a:	9d1d                	subw	a0,a0,a5
    185c:	8082                	ret

000000000000185e <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    185e:	c231                	beqz	a2,18a2 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1860:	00054783          	lbu	a5,0(a0)
    1864:	0005c683          	lbu	a3,0(a1)
    1868:	c795                	beqz	a5,1894 <strncmp+0x36>
    186a:	ca85                	beqz	a3,189a <strncmp+0x3c>
    if (!n--)
    186c:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    186e:	c615                	beqz	a2,189a <strncmp+0x3c>
    1870:	00150713          	addi	a4,a0,1
    1874:	9532                	add	a0,a0,a2
    1876:	00d78963          	beq	a5,a3,1888 <strncmp+0x2a>
    187a:	a005                	j	189a <strncmp+0x3c>
    187c:	ce99                	beqz	a3,189a <strncmp+0x3c>
    187e:	00e50e63          	beq	a0,a4,189a <strncmp+0x3c>
    1882:	0705                	addi	a4,a4,1
    1884:	00d79b63          	bne	a5,a3,189a <strncmp+0x3c>
    1888:	00074783          	lbu	a5,0(a4)
    188c:	0585                	addi	a1,a1,1
    188e:	0005c683          	lbu	a3,0(a1)
    1892:	f7ed                	bnez	a5,187c <strncmp+0x1e>
    1894:	4501                	li	a0,0
        ;
    return *l - *r;
    1896:	9d15                	subw	a0,a0,a3
    1898:	8082                	ret
    189a:	0007851b          	sext.w	a0,a5
    189e:	9d15                	subw	a0,a0,a3
    18a0:	8082                	ret
        return 0;
    18a2:	4501                	li	a0,0
}
    18a4:	8082                	ret

00000000000018a6 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18a6:	00757793          	andi	a5,a0,7
    18aa:	cfa1                	beqz	a5,1902 <strlen+0x5c>
        if (!*s)
    18ac:	00054783          	lbu	a5,0(a0)
    18b0:	cbb9                	beqz	a5,1906 <strlen+0x60>
    18b2:	87aa                	mv	a5,a0
    18b4:	a021                	j	18bc <strlen+0x16>
    18b6:	0007c703          	lbu	a4,0(a5)
    18ba:	c329                	beqz	a4,18fc <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    18bc:	0785                	addi	a5,a5,1
    18be:	0077f713          	andi	a4,a5,7
    18c2:	fb75                	bnez	a4,18b6 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18c4:	00001717          	auipc	a4,0x1
    18c8:	80c70713          	addi	a4,a4,-2036 # 20d0 <__clone+0xd4>
    18cc:	630c                	ld	a1,0(a4)
    18ce:	00001717          	auipc	a4,0x1
    18d2:	80a70713          	addi	a4,a4,-2038 # 20d8 <__clone+0xdc>
    18d6:	6394                	ld	a3,0(a5)
    18d8:	6310                	ld	a2,0(a4)
    18da:	a019                	j	18e0 <strlen+0x3a>
    18dc:	07a1                	addi	a5,a5,8
    18de:	6394                	ld	a3,0(a5)
    18e0:	00b68733          	add	a4,a3,a1
    18e4:	fff6c693          	not	a3,a3
    18e8:	8f75                	and	a4,a4,a3
    18ea:	8f71                	and	a4,a4,a2
    18ec:	db65                	beqz	a4,18dc <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18ee:	0007c703          	lbu	a4,0(a5)
    18f2:	c709                	beqz	a4,18fc <strlen+0x56>
    18f4:	0785                	addi	a5,a5,1
    18f6:	0007c703          	lbu	a4,0(a5)
    18fa:	ff6d                	bnez	a4,18f4 <strlen+0x4e>
        ;
    return s - a;
    18fc:	40a78533          	sub	a0,a5,a0
}
    1900:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1902:	87aa                	mv	a5,a0
    1904:	b7c1                	j	18c4 <strlen+0x1e>
        if (!*s)
    1906:	4501                	li	a0,0
            return s - a;
    1908:	8082                	ret

000000000000190a <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    190a:	00757793          	andi	a5,a0,7
    190e:	0ff5f593          	andi	a1,a1,255
    1912:	cb99                	beqz	a5,1928 <memchr+0x1e>
    1914:	c655                	beqz	a2,19c0 <memchr+0xb6>
    1916:	00054783          	lbu	a5,0(a0)
    191a:	0ab78663          	beq	a5,a1,19c6 <memchr+0xbc>
    191e:	0505                	addi	a0,a0,1
    1920:	00757793          	andi	a5,a0,7
    1924:	167d                	addi	a2,a2,-1
    1926:	f7fd                	bnez	a5,1914 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1928:	4701                	li	a4,0
    if (n && *s != c)
    192a:	ca49                	beqz	a2,19bc <memchr+0xb2>
    192c:	00054783          	lbu	a5,0(a0)
    1930:	08b78b63          	beq	a5,a1,19c6 <memchr+0xbc>
        size_t k = ONES * c;
    1934:	00000797          	auipc	a5,0x0
    1938:	7ac78793          	addi	a5,a5,1964 # 20e0 <__clone+0xe4>
    193c:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    193e:	479d                	li	a5,7
        size_t k = ONES * c;
    1940:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1944:	08c7f863          	bleu	a2,a5,19d4 <memchr+0xca>
    1948:	611c                	ld	a5,0(a0)
    194a:	00000317          	auipc	t1,0x0
    194e:	78e30313          	addi	t1,t1,1934 # 20d8 <__clone+0xdc>
    1952:	00033803          	ld	a6,0(t1)
    1956:	00f8c7b3          	xor	a5,a7,a5
    195a:	fff7c713          	not	a4,a5
    195e:	8f95                	sub	a5,a5,a3
    1960:	8ff9                	and	a5,a5,a4
    1962:	0107f7b3          	and	a5,a5,a6
    1966:	e7bd                	bnez	a5,19d4 <memchr+0xca>
    1968:	4e1d                	li	t3,7
    196a:	00000e97          	auipc	t4,0x0
    196e:	766e8e93          	addi	t4,t4,1894 # 20d0 <__clone+0xd4>
    1972:	a005                	j	1992 <memchr+0x88>
    1974:	6514                	ld	a3,8(a0)
    1976:	000eb783          	ld	a5,0(t4)
    197a:	00033803          	ld	a6,0(t1)
    197e:	00d8c6b3          	xor	a3,a7,a3
    1982:	97b6                	add	a5,a5,a3
    1984:	fff6c693          	not	a3,a3
    1988:	8ff5                	and	a5,a5,a3
    198a:	0107f7b3          	and	a5,a5,a6
    198e:	e3a1                	bnez	a5,19ce <memchr+0xc4>
    1990:	853a                	mv	a0,a4
    1992:	1661                	addi	a2,a2,-8
    1994:	00850713          	addi	a4,a0,8
    1998:	fcce6ee3          	bltu	t3,a2,1974 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    199c:	c215                	beqz	a2,19c0 <memchr+0xb6>
    199e:	00074783          	lbu	a5,0(a4)
    19a2:	00f58d63          	beq	a1,a5,19bc <memchr+0xb2>
    19a6:	00170793          	addi	a5,a4,1
    19aa:	963a                	add	a2,a2,a4
    19ac:	873e                	mv	a4,a5
    19ae:	00f60963          	beq	a2,a5,19c0 <memchr+0xb6>
    19b2:	0007c683          	lbu	a3,0(a5)
    19b6:	0785                	addi	a5,a5,1
    19b8:	feb69ae3          	bne	a3,a1,19ac <memchr+0xa2>
}
    19bc:	853a                	mv	a0,a4
    19be:	8082                	ret
    return n ? (void *)s : 0;
    19c0:	4701                	li	a4,0
}
    19c2:	853a                	mv	a0,a4
    19c4:	8082                	ret
    19c6:	872a                	mv	a4,a0
    19c8:	00074783          	lbu	a5,0(a4)
    19cc:	bfd9                	j	19a2 <memchr+0x98>
    19ce:	00854783          	lbu	a5,8(a0)
    19d2:	bfc1                	j	19a2 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19d4:	872a                	mv	a4,a0
    19d6:	bfc1                	j	19a6 <memchr+0x9c>

00000000000019d8 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19d8:	00757793          	andi	a5,a0,7
    19dc:	cfc5                	beqz	a5,1a94 <strnlen+0xbc>
    19de:	c1c5                	beqz	a1,1a7e <strnlen+0xa6>
    19e0:	00054783          	lbu	a5,0(a0)
    19e4:	cfd9                	beqz	a5,1a82 <strnlen+0xaa>
    19e6:	87ae                	mv	a5,a1
    19e8:	86aa                	mv	a3,a0
    19ea:	a029                	j	19f4 <strnlen+0x1c>
    19ec:	cbc9                	beqz	a5,1a7e <strnlen+0xa6>
    19ee:	0006c703          	lbu	a4,0(a3)
    19f2:	cb51                	beqz	a4,1a86 <strnlen+0xae>
    19f4:	0685                	addi	a3,a3,1
    19f6:	0076f713          	andi	a4,a3,7
    19fa:	17fd                	addi	a5,a5,-1
    19fc:	fb65                	bnez	a4,19ec <strnlen+0x14>
    if (n && *s != c)
    19fe:	c3c1                	beqz	a5,1a7e <strnlen+0xa6>
    1a00:	0006c703          	lbu	a4,0(a3)
    1a04:	c349                	beqz	a4,1a86 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a06:	471d                	li	a4,7
    1a08:	08f77a63          	bleu	a5,a4,1a9c <strnlen+0xc4>
    1a0c:	00000e17          	auipc	t3,0x0
    1a10:	6c4e0e13          	addi	t3,t3,1732 # 20d0 <__clone+0xd4>
    1a14:	6290                	ld	a2,0(a3)
    1a16:	000e3703          	ld	a4,0(t3)
    1a1a:	00000e97          	auipc	t4,0x0
    1a1e:	6bee8e93          	addi	t4,t4,1726 # 20d8 <__clone+0xdc>
    1a22:	000eb803          	ld	a6,0(t4)
    1a26:	9732                	add	a4,a4,a2
    1a28:	fff64613          	not	a2,a2
    1a2c:	8f71                	and	a4,a4,a2
    1a2e:	01077733          	and	a4,a4,a6
    1a32:	e72d                	bnez	a4,1a9c <strnlen+0xc4>
    1a34:	4f1d                	li	t5,7
    1a36:	a839                	j	1a54 <strnlen+0x7c>
    1a38:	6698                	ld	a4,8(a3)
    1a3a:	000e3303          	ld	t1,0(t3)
    1a3e:	000eb803          	ld	a6,0(t4)
    1a42:	fff74893          	not	a7,a4
    1a46:	971a                	add	a4,a4,t1
    1a48:	01177733          	and	a4,a4,a7
    1a4c:	01077733          	and	a4,a4,a6
    1a50:	ef1d                	bnez	a4,1a8e <strnlen+0xb6>
    1a52:	86b2                	mv	a3,a2
    1a54:	17e1                	addi	a5,a5,-8
    1a56:	00868613          	addi	a2,a3,8
    1a5a:	fcff6fe3          	bltu	t5,a5,1a38 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a5e:	c385                	beqz	a5,1a7e <strnlen+0xa6>
    1a60:	00064703          	lbu	a4,0(a2)
    1a64:	cb19                	beqz	a4,1a7a <strnlen+0xa2>
    1a66:	00160713          	addi	a4,a2,1
    1a6a:	97b2                	add	a5,a5,a2
    1a6c:	863a                	mv	a2,a4
    1a6e:	00e78863          	beq	a5,a4,1a7e <strnlen+0xa6>
    1a72:	0705                	addi	a4,a4,1
    1a74:	fff74683          	lbu	a3,-1(a4)
    1a78:	faf5                	bnez	a3,1a6c <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a7a:	40a605b3          	sub	a1,a2,a0
}
    1a7e:	852e                	mv	a0,a1
    1a80:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a82:	87ae                	mv	a5,a1
    1a84:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a86:	8636                	mv	a2,a3
    1a88:	00064703          	lbu	a4,0(a2)
    1a8c:	bfe1                	j	1a64 <strnlen+0x8c>
    1a8e:	0086c703          	lbu	a4,8(a3)
    1a92:	bfc9                	j	1a64 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a94:	87ae                	mv	a5,a1
    1a96:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a98:	f7a5                	bnez	a5,1a00 <strnlen+0x28>
    1a9a:	b7d5                	j	1a7e <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a9c:	8636                	mv	a2,a3
    1a9e:	b7e1                	j	1a66 <strnlen+0x8e>

0000000000001aa0 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1aa0:	00b547b3          	xor	a5,a0,a1
    1aa4:	8b9d                	andi	a5,a5,7
    1aa6:	efa9                	bnez	a5,1b00 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1aa8:	0075f793          	andi	a5,a1,7
    1aac:	c38d                	beqz	a5,1ace <strcpy+0x2e>
            if (!(*d = *s))
    1aae:	0005c783          	lbu	a5,0(a1)
    1ab2:	00f50023          	sb	a5,0(a0)
    1ab6:	e799                	bnez	a5,1ac4 <strcpy+0x24>
    1ab8:	a095                	j	1b1c <strcpy+0x7c>
    1aba:	0005c783          	lbu	a5,0(a1)
    1abe:	00f50023          	sb	a5,0(a0)
    1ac2:	cbb9                	beqz	a5,1b18 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1ac4:	0585                	addi	a1,a1,1
    1ac6:	0075f793          	andi	a5,a1,7
    1aca:	0505                	addi	a0,a0,1
    1acc:	f7fd                	bnez	a5,1aba <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1ace:	00000797          	auipc	a5,0x0
    1ad2:	60278793          	addi	a5,a5,1538 # 20d0 <__clone+0xd4>
    1ad6:	0007b803          	ld	a6,0(a5)
    1ada:	00000797          	auipc	a5,0x0
    1ade:	5fe78793          	addi	a5,a5,1534 # 20d8 <__clone+0xdc>
    1ae2:	6198                	ld	a4,0(a1)
    1ae4:	6390                	ld	a2,0(a5)
    1ae6:	a031                	j	1af2 <strcpy+0x52>
    1ae8:	0521                	addi	a0,a0,8
    1aea:	05a1                	addi	a1,a1,8
    1aec:	fee53c23          	sd	a4,-8(a0)
    1af0:	6198                	ld	a4,0(a1)
    1af2:	010707b3          	add	a5,a4,a6
    1af6:	fff74693          	not	a3,a4
    1afa:	8ff5                	and	a5,a5,a3
    1afc:	8ff1                	and	a5,a5,a2
    1afe:	d7ed                	beqz	a5,1ae8 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1b00:	0005c783          	lbu	a5,0(a1)
    1b04:	00f50023          	sb	a5,0(a0)
    1b08:	cb89                	beqz	a5,1b1a <strcpy+0x7a>
    1b0a:	0585                	addi	a1,a1,1
    1b0c:	0005c783          	lbu	a5,0(a1)
    1b10:	0505                	addi	a0,a0,1
    1b12:	00f50023          	sb	a5,0(a0)
    1b16:	fbf5                	bnez	a5,1b0a <strcpy+0x6a>
        ;
    return d;
}
    1b18:	8082                	ret
    1b1a:	8082                	ret
    1b1c:	8082                	ret

0000000000001b1e <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b1e:	00b547b3          	xor	a5,a0,a1
    1b22:	8b9d                	andi	a5,a5,7
    1b24:	ebc1                	bnez	a5,1bb4 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b26:	0075f793          	andi	a5,a1,7
    1b2a:	cf91                	beqz	a5,1b46 <strncpy+0x28>
    1b2c:	20060e63          	beqz	a2,1d48 <strncpy+0x22a>
    1b30:	0005c783          	lbu	a5,0(a1)
    1b34:	00f50023          	sb	a5,0(a0)
    1b38:	c3d5                	beqz	a5,1bdc <strncpy+0xbe>
    1b3a:	0585                	addi	a1,a1,1
    1b3c:	0075f793          	andi	a5,a1,7
    1b40:	167d                	addi	a2,a2,-1
    1b42:	0505                	addi	a0,a0,1
    1b44:	f7e5                	bnez	a5,1b2c <strncpy+0xe>
            ;
        if (!n || !*s)
    1b46:	20060163          	beqz	a2,1d48 <strncpy+0x22a>
    1b4a:	0005c683          	lbu	a3,0(a1)
    1b4e:	c6d9                	beqz	a3,1bdc <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b50:	479d                	li	a5,7
    1b52:	22c7f563          	bleu	a2,a5,1d7c <strncpy+0x25e>
    1b56:	00000317          	auipc	t1,0x0
    1b5a:	57a30313          	addi	t1,t1,1402 # 20d0 <__clone+0xd4>
    1b5e:	6198                	ld	a4,0(a1)
    1b60:	00033783          	ld	a5,0(t1)
    1b64:	00000e17          	auipc	t3,0x0
    1b68:	574e0e13          	addi	t3,t3,1396 # 20d8 <__clone+0xdc>
    1b6c:	000e3803          	ld	a6,0(t3)
    1b70:	97ba                	add	a5,a5,a4
    1b72:	fff74893          	not	a7,a4
    1b76:	0117f7b3          	and	a5,a5,a7
    1b7a:	0107f7b3          	and	a5,a5,a6
    1b7e:	1e079f63          	bnez	a5,1d7c <strncpy+0x25e>
    1b82:	4e9d                	li	t4,7
    1b84:	a005                	j	1ba4 <strncpy+0x86>
    1b86:	6598                	ld	a4,8(a1)
    1b88:	00033783          	ld	a5,0(t1)
    1b8c:	000e3803          	ld	a6,0(t3)
    1b90:	fff74893          	not	a7,a4
    1b94:	97ba                	add	a5,a5,a4
    1b96:	0117f7b3          	and	a5,a5,a7
    1b9a:	0107f7b3          	and	a5,a5,a6
    1b9e:	1a079f63          	bnez	a5,1d5c <strncpy+0x23e>
    1ba2:	85b6                	mv	a1,a3
            *wd = *ws;
    1ba4:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ba6:	1661                	addi	a2,a2,-8
    1ba8:	00858693          	addi	a3,a1,8
    1bac:	0521                	addi	a0,a0,8
    1bae:	fcceece3          	bltu	t4,a2,1b86 <strncpy+0x68>
    1bb2:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bb4:	18060a63          	beqz	a2,1d48 <strncpy+0x22a>
    1bb8:	0005c783          	lbu	a5,0(a1)
    1bbc:	872a                	mv	a4,a0
    1bbe:	00f50023          	sb	a5,0(a0)
    1bc2:	e799                	bnez	a5,1bd0 <strncpy+0xb2>
    1bc4:	a829                	j	1bde <strncpy+0xc0>
    1bc6:	0005c783          	lbu	a5,0(a1)
    1bca:	00f70023          	sb	a5,0(a4)
    1bce:	cb81                	beqz	a5,1bde <strncpy+0xc0>
    1bd0:	167d                	addi	a2,a2,-1
    1bd2:	0585                	addi	a1,a1,1
    1bd4:	0705                	addi	a4,a4,1
    1bd6:	fa65                	bnez	a2,1bc6 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1bd8:	853a                	mv	a0,a4
    1bda:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1bdc:	872a                	mv	a4,a0
    1bde:	4805                	li	a6,1
    1be0:	14061c63          	bnez	a2,1d38 <strncpy+0x21a>
    1be4:	40e007b3          	neg	a5,a4
    1be8:	8b9d                	andi	a5,a5,7
    1bea:	4581                	li	a1,0
    1bec:	12061e63          	bnez	a2,1d28 <strncpy+0x20a>
    1bf0:	00778693          	addi	a3,a5,7
    1bf4:	452d                	li	a0,11
    1bf6:	12a6e763          	bltu	a3,a0,1d24 <strncpy+0x206>
    1bfa:	16d5e663          	bltu	a1,a3,1d66 <strncpy+0x248>
    1bfe:	14078c63          	beqz	a5,1d56 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c02:	00070023          	sb	zero,0(a4)
    1c06:	4585                	li	a1,1
    1c08:	00170693          	addi	a3,a4,1
    1c0c:	14b78363          	beq	a5,a1,1d52 <strncpy+0x234>
    1c10:	000700a3          	sb	zero,1(a4)
    1c14:	4589                	li	a1,2
    1c16:	00270693          	addi	a3,a4,2
    1c1a:	14b78963          	beq	a5,a1,1d6c <strncpy+0x24e>
    1c1e:	00070123          	sb	zero,2(a4)
    1c22:	458d                	li	a1,3
    1c24:	00370693          	addi	a3,a4,3
    1c28:	12b78363          	beq	a5,a1,1d4e <strncpy+0x230>
    1c2c:	000701a3          	sb	zero,3(a4)
    1c30:	4591                	li	a1,4
    1c32:	00470693          	addi	a3,a4,4
    1c36:	12b78d63          	beq	a5,a1,1d70 <strncpy+0x252>
    1c3a:	00070223          	sb	zero,4(a4)
    1c3e:	4595                	li	a1,5
    1c40:	00570693          	addi	a3,a4,5
    1c44:	12b78863          	beq	a5,a1,1d74 <strncpy+0x256>
    1c48:	000702a3          	sb	zero,5(a4)
    1c4c:	459d                	li	a1,7
    1c4e:	00670693          	addi	a3,a4,6
    1c52:	12b79363          	bne	a5,a1,1d78 <strncpy+0x25a>
    1c56:	00770693          	addi	a3,a4,7
    1c5a:	00070323          	sb	zero,6(a4)
    1c5e:	40f80833          	sub	a6,a6,a5
    1c62:	ff887513          	andi	a0,a6,-8
    1c66:	97ba                	add	a5,a5,a4
    1c68:	953e                	add	a0,a0,a5
    1c6a:	0007b023          	sd	zero,0(a5)
    1c6e:	07a1                	addi	a5,a5,8
    1c70:	fea79de3          	bne	a5,a0,1c6a <strncpy+0x14c>
    1c74:	ff887513          	andi	a0,a6,-8
    1c78:	9da9                	addw	a1,a1,a0
    1c7a:	00a687b3          	add	a5,a3,a0
    1c7e:	f4a80de3          	beq	a6,a0,1bd8 <strncpy+0xba>
    1c82:	00078023          	sb	zero,0(a5)
    1c86:	0015869b          	addiw	a3,a1,1
    1c8a:	f4c6f7e3          	bleu	a2,a3,1bd8 <strncpy+0xba>
    1c8e:	000780a3          	sb	zero,1(a5)
    1c92:	0025869b          	addiw	a3,a1,2
    1c96:	f4c6f1e3          	bleu	a2,a3,1bd8 <strncpy+0xba>
    1c9a:	00078123          	sb	zero,2(a5)
    1c9e:	0035869b          	addiw	a3,a1,3
    1ca2:	f2c6fbe3          	bleu	a2,a3,1bd8 <strncpy+0xba>
    1ca6:	000781a3          	sb	zero,3(a5)
    1caa:	0045869b          	addiw	a3,a1,4
    1cae:	f2c6f5e3          	bleu	a2,a3,1bd8 <strncpy+0xba>
    1cb2:	00078223          	sb	zero,4(a5)
    1cb6:	0055869b          	addiw	a3,a1,5
    1cba:	f0c6ffe3          	bleu	a2,a3,1bd8 <strncpy+0xba>
    1cbe:	000782a3          	sb	zero,5(a5)
    1cc2:	0065869b          	addiw	a3,a1,6
    1cc6:	f0c6f9e3          	bleu	a2,a3,1bd8 <strncpy+0xba>
    1cca:	00078323          	sb	zero,6(a5)
    1cce:	0075869b          	addiw	a3,a1,7
    1cd2:	f0c6f3e3          	bleu	a2,a3,1bd8 <strncpy+0xba>
    1cd6:	000783a3          	sb	zero,7(a5)
    1cda:	0085869b          	addiw	a3,a1,8
    1cde:	eec6fde3          	bleu	a2,a3,1bd8 <strncpy+0xba>
    1ce2:	00078423          	sb	zero,8(a5)
    1ce6:	0095869b          	addiw	a3,a1,9
    1cea:	eec6f7e3          	bleu	a2,a3,1bd8 <strncpy+0xba>
    1cee:	000784a3          	sb	zero,9(a5)
    1cf2:	00a5869b          	addiw	a3,a1,10
    1cf6:	eec6f1e3          	bleu	a2,a3,1bd8 <strncpy+0xba>
    1cfa:	00078523          	sb	zero,10(a5)
    1cfe:	00b5869b          	addiw	a3,a1,11
    1d02:	ecc6fbe3          	bleu	a2,a3,1bd8 <strncpy+0xba>
    1d06:	000785a3          	sb	zero,11(a5)
    1d0a:	00c5869b          	addiw	a3,a1,12
    1d0e:	ecc6f5e3          	bleu	a2,a3,1bd8 <strncpy+0xba>
    1d12:	00078623          	sb	zero,12(a5)
    1d16:	25b5                	addiw	a1,a1,13
    1d18:	ecc5f0e3          	bleu	a2,a1,1bd8 <strncpy+0xba>
    1d1c:	000786a3          	sb	zero,13(a5)
}
    1d20:	853a                	mv	a0,a4
    1d22:	8082                	ret
    1d24:	46ad                	li	a3,11
    1d26:	bdd1                	j	1bfa <strncpy+0xdc>
    1d28:	00778693          	addi	a3,a5,7
    1d2c:	452d                	li	a0,11
    1d2e:	fff60593          	addi	a1,a2,-1
    1d32:	eca6f4e3          	bleu	a0,a3,1bfa <strncpy+0xdc>
    1d36:	b7fd                	j	1d24 <strncpy+0x206>
    1d38:	40e007b3          	neg	a5,a4
    1d3c:	8832                	mv	a6,a2
    1d3e:	8b9d                	andi	a5,a5,7
    1d40:	4581                	li	a1,0
    1d42:	ea0607e3          	beqz	a2,1bf0 <strncpy+0xd2>
    1d46:	b7cd                	j	1d28 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d48:	872a                	mv	a4,a0
}
    1d4a:	853a                	mv	a0,a4
    1d4c:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d4e:	458d                	li	a1,3
    1d50:	b739                	j	1c5e <strncpy+0x140>
    1d52:	4585                	li	a1,1
    1d54:	b729                	j	1c5e <strncpy+0x140>
    1d56:	86ba                	mv	a3,a4
    1d58:	4581                	li	a1,0
    1d5a:	b711                	j	1c5e <strncpy+0x140>
    1d5c:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d60:	872a                	mv	a4,a0
    1d62:	85b6                	mv	a1,a3
    1d64:	bda9                	j	1bbe <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d66:	87ba                	mv	a5,a4
    1d68:	4581                	li	a1,0
    1d6a:	bf21                	j	1c82 <strncpy+0x164>
    1d6c:	4589                	li	a1,2
    1d6e:	bdc5                	j	1c5e <strncpy+0x140>
    1d70:	4591                	li	a1,4
    1d72:	b5f5                	j	1c5e <strncpy+0x140>
    1d74:	4595                	li	a1,5
    1d76:	b5e5                	j	1c5e <strncpy+0x140>
    1d78:	4599                	li	a1,6
    1d7a:	b5d5                	j	1c5e <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d7c:	00d50023          	sb	a3,0(a0)
    1d80:	872a                	mv	a4,a0
    1d82:	b5b9                	j	1bd0 <strncpy+0xb2>

0000000000001d84 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d84:	87aa                	mv	a5,a0
    1d86:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d88:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d8c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d90:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d92:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d94:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <openat>:
    register long a7 __asm__("a7") = n;
    1d9c:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1da0:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1da4:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <close>:
    register long a7 __asm__("a7") = n;
    1dac:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1db0:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <read>:
    register long a7 __asm__("a7") = n;
    1db8:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dbc:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1dc0:	8082                	ret

0000000000001dc2 <write>:
    register long a7 __asm__("a7") = n;
    1dc2:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc6:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1dca:	8082                	ret

0000000000001dcc <getpid>:
    register long a7 __asm__("a7") = n;
    1dcc:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1dd0:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <getppid>:
    register long a7 __asm__("a7") = n;
    1dd8:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1ddc:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1de0:	2501                	sext.w	a0,a0
    1de2:	8082                	ret

0000000000001de4 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1de4:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1de8:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dec:	2501                	sext.w	a0,a0
    1dee:	8082                	ret

0000000000001df0 <fork>:
    register long a7 __asm__("a7") = n;
    1df0:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1df4:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1df6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df8:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1e00:	85b2                	mv	a1,a2
    1e02:	863a                	mv	a2,a4
    if (stack)
    1e04:	c191                	beqz	a1,1e08 <clone+0x8>
	stack += stack_size;
    1e06:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1e08:	4781                	li	a5,0
    1e0a:	4701                	li	a4,0
    1e0c:	4681                	li	a3,0
    1e0e:	2601                	sext.w	a2,a2
    1e10:	1ec0006f          	j	1ffc <__clone>

0000000000001e14 <exit>:
    register long a7 __asm__("a7") = n;
    1e14:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e18:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e1c:	8082                	ret

0000000000001e1e <waitpid>:
    register long a7 __asm__("a7") = n;
    1e1e:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e22:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e24:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <exec>:
    register long a7 __asm__("a7") = n;
    1e2c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e30:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <execve>:
    register long a7 __asm__("a7") = n;
    1e38:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e3c:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <times>:
    register long a7 __asm__("a7") = n;
    1e44:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e48:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <get_time>:

int64 get_time()
{
    1e50:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e52:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e56:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e58:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5a:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e5e:	2501                	sext.w	a0,a0
    1e60:	ed09                	bnez	a0,1e7a <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e62:	67a2                	ld	a5,8(sp)
    1e64:	3e800713          	li	a4,1000
    1e68:	00015503          	lhu	a0,0(sp)
    1e6c:	02e7d7b3          	divu	a5,a5,a4
    1e70:	02e50533          	mul	a0,a0,a4
    1e74:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e76:	0141                	addi	sp,sp,16
    1e78:	8082                	ret
        return -1;
    1e7a:	557d                	li	a0,-1
    1e7c:	bfed                	j	1e76 <get_time+0x26>

0000000000001e7e <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e7e:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e82:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <time>:
    register long a7 __asm__("a7") = n;
    1e8a:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e8e:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e92:	2501                	sext.w	a0,a0
    1e94:	8082                	ret

0000000000001e96 <sleep>:

int sleep(unsigned long long time)
{
    1e96:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e98:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e9a:	850a                	mv	a0,sp
    1e9c:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e9e:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1ea2:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea4:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ea8:	e501                	bnez	a0,1eb0 <sleep+0x1a>
    return 0;
    1eaa:	4501                	li	a0,0
}
    1eac:	0141                	addi	sp,sp,16
    1eae:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1eb0:	4502                	lw	a0,0(sp)
}
    1eb2:	0141                	addi	sp,sp,16
    1eb4:	8082                	ret

0000000000001eb6 <set_priority>:
    register long a7 __asm__("a7") = n;
    1eb6:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1eba:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	8082                	ret

0000000000001ec2 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1ec2:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1ec6:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1eca:	8082                	ret

0000000000001ecc <munmap>:
    register long a7 __asm__("a7") = n;
    1ecc:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed0:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <wait>:

int wait(int *code)
{
    1ed8:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1eda:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ede:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ee0:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1ee2:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ee4:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ee8:	2501                	sext.w	a0,a0
    1eea:	8082                	ret

0000000000001eec <spawn>:
    register long a7 __asm__("a7") = n;
    1eec:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ef0:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ef4:	2501                	sext.w	a0,a0
    1ef6:	8082                	ret

0000000000001ef8 <mailread>:
    register long a7 __asm__("a7") = n;
    1ef8:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1efc:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1f00:	2501                	sext.w	a0,a0
    1f02:	8082                	ret

0000000000001f04 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f04:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f08:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f0c:	2501                	sext.w	a0,a0
    1f0e:	8082                	ret

0000000000001f10 <fstat>:
    register long a7 __asm__("a7") = n;
    1f10:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f14:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f18:	2501                	sext.w	a0,a0
    1f1a:	8082                	ret

0000000000001f1c <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1f1c:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f1e:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f22:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f24:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f28:	2501                	sext.w	a0,a0
    1f2a:	8082                	ret

0000000000001f2c <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f2c:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f2e:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f32:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f34:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f38:	2501                	sext.w	a0,a0
    1f3a:	8082                	ret

0000000000001f3c <link>:

int link(char *old_path, char *new_path)
{
    1f3c:	87aa                	mv	a5,a0
    1f3e:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f40:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f44:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f48:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f4a:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f4e:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f50:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f54:	2501                	sext.w	a0,a0
    1f56:	8082                	ret

0000000000001f58 <unlink>:

int unlink(char *path)
{
    1f58:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f5a:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f5e:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f62:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f64:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f68:	2501                	sext.w	a0,a0
    1f6a:	8082                	ret

0000000000001f6c <uname>:
    register long a7 __asm__("a7") = n;
    1f6c:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f70:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f74:	2501                	sext.w	a0,a0
    1f76:	8082                	ret

0000000000001f78 <brk>:
    register long a7 __asm__("a7") = n;
    1f78:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f7c:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f80:	2501                	sext.w	a0,a0
    1f82:	8082                	ret

0000000000001f84 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f84:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f86:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f8a:	8082                	ret

0000000000001f8c <chdir>:
    register long a7 __asm__("a7") = n;
    1f8c:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f90:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f94:	2501                	sext.w	a0,a0
    1f96:	8082                	ret

0000000000001f98 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f98:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f9a:	02059613          	slli	a2,a1,0x20
    1f9e:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1fa0:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1fa4:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fa8:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1faa:	00000073          	ecall
}
    1fae:	2501                	sext.w	a0,a0
    1fb0:	8082                	ret

0000000000001fb2 <getdents>:
    register long a7 __asm__("a7") = n;
    1fb2:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fb6:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1fba:	2501                	sext.w	a0,a0
    1fbc:	8082                	ret

0000000000001fbe <pipe>:
    register long a7 __asm__("a7") = n;
    1fbe:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1fc2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fc4:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1fc8:	2501                	sext.w	a0,a0
    1fca:	8082                	ret

0000000000001fcc <dup>:
    register long a7 __asm__("a7") = n;
    1fcc:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1fce:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1fd2:	2501                	sext.w	a0,a0
    1fd4:	8082                	ret

0000000000001fd6 <dup2>:
    register long a7 __asm__("a7") = n;
    1fd6:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fd8:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fda:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fde:	2501                	sext.w	a0,a0
    1fe0:	8082                	ret

0000000000001fe2 <mount>:
    register long a7 __asm__("a7") = n;
    1fe2:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fe6:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fea:	2501                	sext.w	a0,a0
    1fec:	8082                	ret

0000000000001fee <umount>:
    register long a7 __asm__("a7") = n;
    1fee:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1ff2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ff4:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ff8:	2501                	sext.w	a0,a0
    1ffa:	8082                	ret

0000000000001ffc <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ffc:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1ffe:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    2000:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    2002:	8532                	mv	a0,a2
	mv a2, a4
    2004:	863a                	mv	a2,a4
	mv a3, a5
    2006:	86be                	mv	a3,a5
	mv a4, a6
    2008:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    200a:	0dc00893          	li	a7,220
	ecall
    200e:	00000073          	ecall

	beqz a0, 1f
    2012:	c111                	beqz	a0,2016 <__clone+0x1a>
	# Parent
	ret
    2014:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    2016:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    2018:	6522                	ld	a0,8(sp)
	jalr a1
    201a:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    201c:	05d00893          	li	a7,93
	ecall
    2020:	00000073          	ecall
