
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/getdents:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0e60006f          	j	10e8 <__start_main>

0000000000001006 <test_getdents>:
#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

char buf[512];
void test_getdents(void){
    1006:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	01850513          	addi	a0,a0,24 # 2020 <__clone+0x28>
void test_getdents(void){
    1010:	ec06                	sd	ra,24(sp)
    1012:	e822                	sd	s0,16(sp)
    1014:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1016:	2d2000ef          	jal	ra,12e8 <puts>
    101a:	00001517          	auipc	a0,0x1
    101e:	2be50513          	addi	a0,a0,702 # 22d8 <__func__.1187>
    1022:	2c6000ef          	jal	ra,12e8 <puts>
    1026:	00001517          	auipc	a0,0x1
    102a:	01250513          	addi	a0,a0,18 # 2038 <__clone+0x40>
    102e:	2ba000ef          	jal	ra,12e8 <puts>
    int fd, nread;
    struct linux_dirent64 *dirp64;
    dirp64 = buf;
    //fd = open(".", O_DIRECTORY);
    fd = open(".", O_RDONLY);
    1032:	4581                	li	a1,0
    1034:	00001517          	auipc	a0,0x1
    1038:	01450513          	addi	a0,a0,20 # 2048 <__clone+0x50>
    103c:	545000ef          	jal	ra,1d80 <open>
    printf("open fd:%d\n", fd);
    1040:	85aa                	mv	a1,a0
    fd = open(".", O_RDONLY);
    1042:	842a                	mv	s0,a0
    printf("open fd:%d\n", fd);
    1044:	00001517          	auipc	a0,0x1
    1048:	00c50513          	addi	a0,a0,12 # 2050 <__clone+0x58>
    104c:	2be000ef          	jal	ra,130a <printf>

	nread = getdents(fd, dirp64, 512);
    1050:	20000613          	li	a2,512
    1054:	00001597          	auipc	a1,0x1
    1058:	08458593          	addi	a1,a1,132 # 20d8 <buf>
    105c:	8522                	mv	a0,s0
    105e:	751000ef          	jal	ra,1fae <getdents>
	printf("getdents fd:%d\n", nread);
    1062:	85aa                	mv	a1,a0
	nread = getdents(fd, dirp64, 512);
    1064:	84aa                	mv	s1,a0
	printf("getdents fd:%d\n", nread);
    1066:	00001517          	auipc	a0,0x1
    106a:	ffa50513          	addi	a0,a0,-6 # 2060 <__clone+0x68>
    106e:	29c000ef          	jal	ra,130a <printf>
	assert(nread != -1);
    1072:	57fd                	li	a5,-1
    1074:	04f48b63          	beq	s1,a5,10ca <test_getdents+0xc4>
	printf("getdents success.\n%s\n", dirp64->d_name);
    1078:	00001597          	auipc	a1,0x1
    107c:	07358593          	addi	a1,a1,115 # 20eb <buf+0x13>
    1080:	00001517          	auipc	a0,0x1
    1084:	01050513          	addi	a0,a0,16 # 2090 <__clone+0x98>
    1088:	282000ef          	jal	ra,130a <printf>
	    printf(  "%s\t", d->d_name);
	    bpos += d->d_reclen;
	}
	*/

    printf("\n");
    108c:	00001517          	auipc	a0,0x1
    1090:	ffc50513          	addi	a0,a0,-4 # 2088 <__clone+0x90>
    1094:	276000ef          	jal	ra,130a <printf>
    close(fd);
    1098:	8522                	mv	a0,s0
    109a:	50f000ef          	jal	ra,1da8 <close>
    TEST_END(__func__);
    109e:	00001517          	auipc	a0,0x1
    10a2:	00a50513          	addi	a0,a0,10 # 20a8 <__clone+0xb0>
    10a6:	242000ef          	jal	ra,12e8 <puts>
    10aa:	00001517          	auipc	a0,0x1
    10ae:	22e50513          	addi	a0,a0,558 # 22d8 <__func__.1187>
    10b2:	236000ef          	jal	ra,12e8 <puts>
}
    10b6:	6442                	ld	s0,16(sp)
    10b8:	60e2                	ld	ra,24(sp)
    10ba:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    10bc:	00001517          	auipc	a0,0x1
    10c0:	f7c50513          	addi	a0,a0,-132 # 2038 <__clone+0x40>
}
    10c4:	6105                	addi	sp,sp,32
    TEST_END(__func__);
    10c6:	2220006f          	j	12e8 <puts>
	assert(nread != -1);
    10ca:	00001517          	auipc	a0,0x1
    10ce:	fa650513          	addi	a0,a0,-90 # 2070 <__clone+0x78>
    10d2:	4dc000ef          	jal	ra,15ae <panic>
    10d6:	b74d                	j	1078 <test_getdents+0x72>

00000000000010d8 <main>:

int main(void){
    10d8:	1141                	addi	sp,sp,-16
    10da:	e406                	sd	ra,8(sp)
    test_getdents();
    10dc:	f2bff0ef          	jal	ra,1006 <test_getdents>
    return 0;
}
    10e0:	60a2                	ld	ra,8(sp)
    10e2:	4501                	li	a0,0
    10e4:	0141                	addi	sp,sp,16
    10e6:	8082                	ret

00000000000010e8 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10e8:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10ea:	4108                	lw	a0,0(a0)
{
    10ec:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10ee:	05a1                	addi	a1,a1,8
{
    10f0:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10f2:	fe7ff0ef          	jal	ra,10d8 <main>
    10f6:	51b000ef          	jal	ra,1e10 <exit>
	return 0;
}
    10fa:	60a2                	ld	ra,8(sp)
    10fc:	4501                	li	a0,0
    10fe:	0141                	addi	sp,sp,16
    1100:	8082                	ret

0000000000001102 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    1102:	7179                	addi	sp,sp,-48
    1104:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1106:	12054e63          	bltz	a0,1242 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    110a:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    110e:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    1110:	02b7f6bb          	remuw	a3,a5,a1
    1114:	00001717          	auipc	a4,0x1
    1118:	1d470713          	addi	a4,a4,468 # 22e8 <digits>
    buf[16] = 0;
    111c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1120:	1682                	slli	a3,a3,0x20
    1122:	9281                	srli	a3,a3,0x20
    1124:	96ba                	add	a3,a3,a4
    1126:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    112a:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    112e:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1132:	16b7e363          	bltu	a5,a1,1298 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1136:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    113a:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    113e:	1602                	slli	a2,a2,0x20
    1140:	9201                	srli	a2,a2,0x20
    1142:	963a                	add	a2,a2,a4
    1144:	00064603          	lbu	a2,0(a2)
    1148:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    114c:	0007861b          	sext.w	a2,a5
    1150:	12b6e863          	bltu	a3,a1,1280 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    1154:	02b7f6bb          	remuw	a3,a5,a1
    1158:	1682                	slli	a3,a3,0x20
    115a:	9281                	srli	a3,a3,0x20
    115c:	96ba                	add	a3,a3,a4
    115e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1162:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1166:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    116a:	10b66e63          	bltu	a2,a1,1286 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    116e:	02b876bb          	remuw	a3,a6,a1
    1172:	1682                	slli	a3,a3,0x20
    1174:	9281                	srli	a3,a3,0x20
    1176:	96ba                	add	a3,a3,a4
    1178:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    117c:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1180:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1184:	10b86463          	bltu	a6,a1,128c <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1188:	02b676bb          	remuw	a3,a2,a1
    118c:	1682                	slli	a3,a3,0x20
    118e:	9281                	srli	a3,a3,0x20
    1190:	96ba                	add	a3,a3,a4
    1192:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1196:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    119a:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    119e:	0eb66a63          	bltu	a2,a1,1292 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    11a2:	02b876bb          	remuw	a3,a6,a1
    11a6:	1682                	slli	a3,a3,0x20
    11a8:	9281                	srli	a3,a3,0x20
    11aa:	96ba                	add	a3,a3,a4
    11ac:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b0:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11b4:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11b8:	0cb86163          	bltu	a6,a1,127a <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    11bc:	02b676bb          	remuw	a3,a2,a1
    11c0:	1682                	slli	a3,a3,0x20
    11c2:	9281                	srli	a3,a3,0x20
    11c4:	96ba                	add	a3,a3,a4
    11c6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ca:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11ce:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11d2:	0cb66563          	bltu	a2,a1,129c <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11d6:	02b876bb          	remuw	a3,a6,a1
    11da:	1682                	slli	a3,a3,0x20
    11dc:	9281                	srli	a3,a3,0x20
    11de:	96ba                	add	a3,a3,a4
    11e0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11e4:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11e8:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11ec:	0ab86b63          	bltu	a6,a1,12a2 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11f0:	02b676bb          	remuw	a3,a2,a1
    11f4:	1682                	slli	a3,a3,0x20
    11f6:	9281                	srli	a3,a3,0x20
    11f8:	96ba                	add	a3,a3,a4
    11fa:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11fe:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    1202:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1206:	0ab66163          	bltu	a2,a1,12a8 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    120a:	1782                	slli	a5,a5,0x20
    120c:	9381                	srli	a5,a5,0x20
    120e:	97ba                	add	a5,a5,a4
    1210:	0007c703          	lbu	a4,0(a5)
    1214:	4599                	li	a1,6
    1216:	4795                	li	a5,5
    1218:	00e10723          	sb	a4,14(sp)

    if (sign)
    121c:	00055963          	bgez	a0,122e <printint.constprop.0+0x12c>
        buf[i--] = '-';
    1220:	1018                	addi	a4,sp,32
    1222:	973e                	add	a4,a4,a5
    1224:	02d00693          	li	a3,45
    1228:	fed70423          	sb	a3,-24(a4)
    122c:	85be                	mv	a1,a5
    write(f, s, l);
    122e:	003c                	addi	a5,sp,8
    1230:	4641                	li	a2,16
    1232:	9e0d                	subw	a2,a2,a1
    1234:	4505                	li	a0,1
    1236:	95be                	add	a1,a1,a5
    1238:	387000ef          	jal	ra,1dbe <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    123c:	70a2                	ld	ra,40(sp)
    123e:	6145                	addi	sp,sp,48
    1240:	8082                	ret
        x = -xx;
    1242:	40a0063b          	negw	a2,a0
    1246:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1248:	02b677bb          	remuw	a5,a2,a1
    124c:	00001717          	auipc	a4,0x1
    1250:	09c70713          	addi	a4,a4,156 # 22e8 <digits>
    buf[16] = 0;
    1254:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1258:	1782                	slli	a5,a5,0x20
    125a:	9381                	srli	a5,a5,0x20
    125c:	97ba                	add	a5,a5,a4
    125e:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1262:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1266:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    126a:	ecb676e3          	bleu	a1,a2,1136 <printint.constprop.0+0x34>
        buf[i--] = '-';
    126e:	02d00793          	li	a5,45
    1272:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1276:	45b9                	li	a1,14
    1278:	bf5d                	j	122e <printint.constprop.0+0x12c>
    127a:	47a5                	li	a5,9
    127c:	45a9                	li	a1,10
    127e:	bf79                	j	121c <printint.constprop.0+0x11a>
    1280:	47b5                	li	a5,13
    1282:	45b9                	li	a1,14
    1284:	bf61                	j	121c <printint.constprop.0+0x11a>
    1286:	47b1                	li	a5,12
    1288:	45b5                	li	a1,13
    128a:	bf49                	j	121c <printint.constprop.0+0x11a>
    128c:	47ad                	li	a5,11
    128e:	45b1                	li	a1,12
    1290:	b771                	j	121c <printint.constprop.0+0x11a>
    1292:	47a9                	li	a5,10
    1294:	45ad                	li	a1,11
    1296:	b759                	j	121c <printint.constprop.0+0x11a>
    i = 15;
    1298:	45bd                	li	a1,15
    129a:	bf51                	j	122e <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    129c:	47a1                	li	a5,8
    129e:	45a5                	li	a1,9
    12a0:	bfb5                	j	121c <printint.constprop.0+0x11a>
    12a2:	479d                	li	a5,7
    12a4:	45a1                	li	a1,8
    12a6:	bf9d                	j	121c <printint.constprop.0+0x11a>
    12a8:	4799                	li	a5,6
    12aa:	459d                	li	a1,7
    12ac:	bf85                	j	121c <printint.constprop.0+0x11a>

00000000000012ae <getchar>:
{
    12ae:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12b0:	00f10593          	addi	a1,sp,15
    12b4:	4605                	li	a2,1
    12b6:	4501                	li	a0,0
{
    12b8:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12ba:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12be:	2f7000ef          	jal	ra,1db4 <read>
}
    12c2:	60e2                	ld	ra,24(sp)
    12c4:	00f14503          	lbu	a0,15(sp)
    12c8:	6105                	addi	sp,sp,32
    12ca:	8082                	ret

00000000000012cc <putchar>:
{
    12cc:	1101                	addi	sp,sp,-32
    char byte = c;
    12ce:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12d2:	00f10593          	addi	a1,sp,15
    12d6:	4605                	li	a2,1
    12d8:	4505                	li	a0,1
{
    12da:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12dc:	2e3000ef          	jal	ra,1dbe <write>
}
    12e0:	60e2                	ld	ra,24(sp)
    12e2:	2501                	sext.w	a0,a0
    12e4:	6105                	addi	sp,sp,32
    12e6:	8082                	ret

00000000000012e8 <puts>:
{
    12e8:	1141                	addi	sp,sp,-16
    12ea:	e406                	sd	ra,8(sp)
    12ec:	e022                	sd	s0,0(sp)
    12ee:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12f0:	5b2000ef          	jal	ra,18a2 <strlen>
    12f4:	862a                	mv	a2,a0
    12f6:	85a2                	mv	a1,s0
    12f8:	4505                	li	a0,1
    12fa:	2c5000ef          	jal	ra,1dbe <write>
}
    12fe:	60a2                	ld	ra,8(sp)
    1300:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    1302:	957d                	srai	a0,a0,0x3f
    return r;
    1304:	2501                	sext.w	a0,a0
}
    1306:	0141                	addi	sp,sp,16
    1308:	8082                	ret

000000000000130a <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    130a:	7131                	addi	sp,sp,-192
    130c:	e0da                	sd	s6,64(sp)
    130e:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    1310:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    1312:	013c                	addi	a5,sp,136
{
    1314:	f0ca                	sd	s2,96(sp)
    1316:	ecce                	sd	s3,88(sp)
    1318:	e8d2                	sd	s4,80(sp)
    131a:	e4d6                	sd	s5,72(sp)
    131c:	fc5e                	sd	s7,56(sp)
    131e:	fc86                	sd	ra,120(sp)
    1320:	f8a2                	sd	s0,112(sp)
    1322:	f4a6                	sd	s1,104(sp)
    1324:	89aa                	mv	s3,a0
    1326:	e52e                	sd	a1,136(sp)
    1328:	e932                	sd	a2,144(sp)
    132a:	ed36                	sd	a3,152(sp)
    132c:	f13a                	sd	a4,160(sp)
    132e:	f942                	sd	a6,176(sp)
    1330:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1332:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1334:	02500913          	li	s2,37
    1338:	07000a93          	li	s5,112
    buf[i++] = '0';
    133c:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1340:	00001a17          	auipc	s4,0x1
    1344:	fa8a0a13          	addi	s4,s4,-88 # 22e8 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1348:	00001b97          	auipc	s7,0x1
    134c:	d70b8b93          	addi	s7,s7,-656 # 20b8 <__clone+0xc0>
        if (!*s)
    1350:	0009c783          	lbu	a5,0(s3)
    1354:	cfb9                	beqz	a5,13b2 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1356:	23278d63          	beq	a5,s2,1590 <printf+0x286>
    135a:	864e                	mv	a2,s3
    135c:	a019                	j	1362 <printf+0x58>
    135e:	07278563          	beq	a5,s2,13c8 <printf+0xbe>
    1362:	0605                	addi	a2,a2,1
    1364:	00064783          	lbu	a5,0(a2)
    1368:	fbfd                	bnez	a5,135e <printf+0x54>
    136a:	84b2                	mv	s1,a2
        l = z - a;
    136c:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1370:	8622                	mv	a2,s0
    1372:	85ce                	mv	a1,s3
    1374:	4505                	li	a0,1
    1376:	249000ef          	jal	ra,1dbe <write>
        if (l)
    137a:	ec3d                	bnez	s0,13f8 <printf+0xee>
        if (s[1] == 0)
    137c:	0014c783          	lbu	a5,1(s1)
    1380:	cb8d                	beqz	a5,13b2 <printf+0xa8>
        switch (s[1])
    1382:	09578b63          	beq	a5,s5,1418 <printf+0x10e>
    1386:	06fafb63          	bleu	a5,s5,13fc <printf+0xf2>
    138a:	07300713          	li	a4,115
    138e:	1ce78e63          	beq	a5,a4,156a <printf+0x260>
    1392:	07800713          	li	a4,120
    1396:	1ae79563          	bne	a5,a4,1540 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    139a:	6782                	ld	a5,0(sp)
    139c:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    139e:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    13a2:	4388                	lw	a0,0(a5)
    13a4:	07a1                	addi	a5,a5,8
    13a6:	e03e                	sd	a5,0(sp)
    13a8:	d5bff0ef          	jal	ra,1102 <printint.constprop.0>
        if (!*s)
    13ac:	0009c783          	lbu	a5,0(s3)
    13b0:	f3dd                	bnez	a5,1356 <printf+0x4c>
    }
    va_end(ap);
}
    13b2:	70e6                	ld	ra,120(sp)
    13b4:	7446                	ld	s0,112(sp)
    13b6:	74a6                	ld	s1,104(sp)
    13b8:	7906                	ld	s2,96(sp)
    13ba:	69e6                	ld	s3,88(sp)
    13bc:	6a46                	ld	s4,80(sp)
    13be:	6aa6                	ld	s5,72(sp)
    13c0:	6b06                	ld	s6,64(sp)
    13c2:	7be2                	ld	s7,56(sp)
    13c4:	6129                	addi	sp,sp,192
    13c6:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13c8:	00164783          	lbu	a5,1(a2)
    13cc:	84b2                	mv	s1,a2
    13ce:	01278763          	beq	a5,s2,13dc <printf+0xd2>
    13d2:	bf69                	j	136c <printf+0x62>
    13d4:	0014c783          	lbu	a5,1(s1)
    13d8:	f9279ae3          	bne	a5,s2,136c <printf+0x62>
    13dc:	0489                	addi	s1,s1,2
    13de:	0004c783          	lbu	a5,0(s1)
    13e2:	0605                	addi	a2,a2,1
    13e4:	ff2788e3          	beq	a5,s2,13d4 <printf+0xca>
        l = z - a;
    13e8:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13ec:	8622                	mv	a2,s0
    13ee:	85ce                	mv	a1,s3
    13f0:	4505                	li	a0,1
    13f2:	1cd000ef          	jal	ra,1dbe <write>
        if (l)
    13f6:	d059                	beqz	s0,137c <printf+0x72>
    13f8:	89a6                	mv	s3,s1
    13fa:	bf99                	j	1350 <printf+0x46>
    13fc:	06400713          	li	a4,100
    1400:	14e79063          	bne	a5,a4,1540 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    1404:	6782                	ld	a5,0(sp)
    1406:	45a9                	li	a1,10
        s += 2;
    1408:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    140c:	4388                	lw	a0,0(a5)
    140e:	07a1                	addi	a5,a5,8
    1410:	e03e                	sd	a5,0(sp)
    1412:	cf1ff0ef          	jal	ra,1102 <printint.constprop.0>
        s += 2;
    1416:	bf59                	j	13ac <printf+0xa2>
            printptr(va_arg(ap, uint64));
    1418:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    141a:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    141e:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    1420:	631c                	ld	a5,0(a4)
    1422:	0721                	addi	a4,a4,8
    1424:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1426:	00479293          	slli	t0,a5,0x4
    142a:	00879f93          	slli	t6,a5,0x8
    142e:	00c79f13          	slli	t5,a5,0xc
    1432:	01079e93          	slli	t4,a5,0x10
    1436:	01479e13          	slli	t3,a5,0x14
    143a:	01879313          	slli	t1,a5,0x18
    143e:	01c79893          	slli	a7,a5,0x1c
    1442:	02479813          	slli	a6,a5,0x24
    1446:	02879513          	slli	a0,a5,0x28
    144a:	02c79593          	slli	a1,a5,0x2c
    144e:	03079693          	slli	a3,a5,0x30
    1452:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1456:	03c7d413          	srli	s0,a5,0x3c
    145a:	01c7d39b          	srliw	t2,a5,0x1c
    145e:	03c2d293          	srli	t0,t0,0x3c
    1462:	03cfdf93          	srli	t6,t6,0x3c
    1466:	03cf5f13          	srli	t5,t5,0x3c
    146a:	03cede93          	srli	t4,t4,0x3c
    146e:	03ce5e13          	srli	t3,t3,0x3c
    1472:	03c35313          	srli	t1,t1,0x3c
    1476:	03c8d893          	srli	a7,a7,0x3c
    147a:	03c85813          	srli	a6,a6,0x3c
    147e:	9171                	srli	a0,a0,0x3c
    1480:	91f1                	srli	a1,a1,0x3c
    1482:	92f1                	srli	a3,a3,0x3c
    1484:	9371                	srli	a4,a4,0x3c
    1486:	96d2                	add	a3,a3,s4
    1488:	9752                	add	a4,a4,s4
    148a:	9452                	add	s0,s0,s4
    148c:	92d2                	add	t0,t0,s4
    148e:	9fd2                	add	t6,t6,s4
    1490:	9f52                	add	t5,t5,s4
    1492:	9ed2                	add	t4,t4,s4
    1494:	9e52                	add	t3,t3,s4
    1496:	9352                	add	t1,t1,s4
    1498:	98d2                	add	a7,a7,s4
    149a:	93d2                	add	t2,t2,s4
    149c:	9852                	add	a6,a6,s4
    149e:	9552                	add	a0,a0,s4
    14a0:	95d2                	add	a1,a1,s4
    14a2:	0006c983          	lbu	s3,0(a3)
    14a6:	0002c283          	lbu	t0,0(t0)
    14aa:	00074683          	lbu	a3,0(a4)
    14ae:	000fcf83          	lbu	t6,0(t6)
    14b2:	000f4f03          	lbu	t5,0(t5)
    14b6:	000ece83          	lbu	t4,0(t4)
    14ba:	000e4e03          	lbu	t3,0(t3)
    14be:	00034303          	lbu	t1,0(t1)
    14c2:	0008c883          	lbu	a7,0(a7)
    14c6:	0003c383          	lbu	t2,0(t2)
    14ca:	00084803          	lbu	a6,0(a6)
    14ce:	00054503          	lbu	a0,0(a0)
    14d2:	0005c583          	lbu	a1,0(a1)
    14d6:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14da:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14de:	9371                	srli	a4,a4,0x3c
    14e0:	8bbd                	andi	a5,a5,15
    14e2:	9752                	add	a4,a4,s4
    14e4:	97d2                	add	a5,a5,s4
    14e6:	005105a3          	sb	t0,11(sp)
    14ea:	01f10623          	sb	t6,12(sp)
    14ee:	01e106a3          	sb	t5,13(sp)
    14f2:	01d10723          	sb	t4,14(sp)
    14f6:	01c107a3          	sb	t3,15(sp)
    14fa:	00610823          	sb	t1,16(sp)
    14fe:	011108a3          	sb	a7,17(sp)
    1502:	00710923          	sb	t2,18(sp)
    1506:	010109a3          	sb	a6,19(sp)
    150a:	00a10a23          	sb	a0,20(sp)
    150e:	00b10aa3          	sb	a1,21(sp)
    1512:	01310b23          	sb	s3,22(sp)
    1516:	00d10ba3          	sb	a3,23(sp)
    151a:	00810523          	sb	s0,10(sp)
    151e:	00074703          	lbu	a4,0(a4)
    1522:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1526:	002c                	addi	a1,sp,8
    1528:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    152a:	00e10c23          	sb	a4,24(sp)
    152e:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1532:	00010d23          	sb	zero,26(sp)
        s += 2;
    1536:	00248993          	addi	s3,s1,2
    write(f, s, l);
    153a:	085000ef          	jal	ra,1dbe <write>
        s += 2;
    153e:	b5bd                	j	13ac <printf+0xa2>
    char byte = c;
    1540:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1544:	4605                	li	a2,1
    1546:	002c                	addi	a1,sp,8
    1548:	4505                	li	a0,1
    char byte = c;
    154a:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    154e:	071000ef          	jal	ra,1dbe <write>
    char byte = c;
    1552:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1556:	4605                	li	a2,1
    1558:	002c                	addi	a1,sp,8
    155a:	4505                	li	a0,1
    char byte = c;
    155c:	00f10423          	sb	a5,8(sp)
        s += 2;
    1560:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    1564:	05b000ef          	jal	ra,1dbe <write>
        s += 2;
    1568:	b591                	j	13ac <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    156a:	6782                	ld	a5,0(sp)
    156c:	6380                	ld	s0,0(a5)
    156e:	07a1                	addi	a5,a5,8
    1570:	e03e                	sd	a5,0(sp)
    1572:	cc05                	beqz	s0,15aa <printf+0x2a0>
            l = strnlen(a, 200);
    1574:	0c800593          	li	a1,200
    1578:	8522                	mv	a0,s0
    157a:	45a000ef          	jal	ra,19d4 <strnlen>
    write(f, s, l);
    157e:	0005061b          	sext.w	a2,a0
    1582:	85a2                	mv	a1,s0
    1584:	4505                	li	a0,1
    1586:	039000ef          	jal	ra,1dbe <write>
        s += 2;
    158a:	00248993          	addi	s3,s1,2
    158e:	bd39                	j	13ac <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1590:	0019c783          	lbu	a5,1(s3)
    1594:	84ce                	mv	s1,s3
    1596:	864e                	mv	a2,s3
    1598:	e52782e3          	beq	a5,s2,13dc <printf+0xd2>
    write(f, s, l);
    159c:	4601                	li	a2,0
    159e:	85ce                	mv	a1,s3
    15a0:	4505                	li	a0,1
    15a2:	01d000ef          	jal	ra,1dbe <write>
    15a6:	84ce                	mv	s1,s3
    15a8:	bbd1                	j	137c <printf+0x72>
                a = "(null)";
    15aa:	845e                	mv	s0,s7
    15ac:	b7e1                	j	1574 <printf+0x26a>

00000000000015ae <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15ae:	1141                	addi	sp,sp,-16
    15b0:	e406                	sd	ra,8(sp)
    puts(m);
    15b2:	d37ff0ef          	jal	ra,12e8 <puts>
    exit(-100);
}
    15b6:	60a2                	ld	ra,8(sp)
    exit(-100);
    15b8:	f9c00513          	li	a0,-100
}
    15bc:	0141                	addi	sp,sp,16
    exit(-100);
    15be:	0530006f          	j	1e10 <exit>

00000000000015c2 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c2:	02000793          	li	a5,32
    15c6:	00f50663          	beq	a0,a5,15d2 <isspace+0x10>
    15ca:	355d                	addiw	a0,a0,-9
    15cc:	00553513          	sltiu	a0,a0,5
    15d0:	8082                	ret
    15d2:	4505                	li	a0,1
}
    15d4:	8082                	ret

00000000000015d6 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15d6:	fd05051b          	addiw	a0,a0,-48
}
    15da:	00a53513          	sltiu	a0,a0,10
    15de:	8082                	ret

00000000000015e0 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e0:	02000613          	li	a2,32
    15e4:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15e6:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ea:	0007079b          	sext.w	a5,a4
    15ee:	ff77869b          	addiw	a3,a5,-9
    15f2:	04c70b63          	beq	a4,a2,1648 <atoi+0x68>
    15f6:	04d5f963          	bleu	a3,a1,1648 <atoi+0x68>
        s++;
    switch (*s)
    15fa:	02b00693          	li	a3,43
    15fe:	04d70a63          	beq	a4,a3,1652 <atoi+0x72>
    1602:	02d00693          	li	a3,45
    1606:	06d70463          	beq	a4,a3,166e <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    160a:	fd07859b          	addiw	a1,a5,-48
    160e:	4625                	li	a2,9
    1610:	873e                	mv	a4,a5
    1612:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1614:	4e01                	li	t3,0
    while (isdigit(*s))
    1616:	04b66a63          	bltu	a2,a1,166a <atoi+0x8a>
    int n = 0, neg = 0;
    161a:	4501                	li	a0,0
    while (isdigit(*s))
    161c:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    161e:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    1620:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    1624:	0025179b          	slliw	a5,a0,0x2
    1628:	9d3d                	addw	a0,a0,a5
    162a:	fd07031b          	addiw	t1,a4,-48
    162e:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1632:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1636:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    163a:	0006071b          	sext.w	a4,a2
    163e:	feb870e3          	bleu	a1,a6,161e <atoi+0x3e>
    return neg ? n : -n;
    1642:	000e0563          	beqz	t3,164c <atoi+0x6c>
}
    1646:	8082                	ret
        s++;
    1648:	0505                	addi	a0,a0,1
    164a:	bf71                	j	15e6 <atoi+0x6>
    164c:	4113053b          	subw	a0,t1,a7
    1650:	8082                	ret
    while (isdigit(*s))
    1652:	00154783          	lbu	a5,1(a0)
    1656:	4625                	li	a2,9
        s++;
    1658:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    165c:	fd07859b          	addiw	a1,a5,-48
    1660:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1664:	4e01                	li	t3,0
    while (isdigit(*s))
    1666:	fab67ae3          	bleu	a1,a2,161a <atoi+0x3a>
    166a:	4501                	li	a0,0
}
    166c:	8082                	ret
    while (isdigit(*s))
    166e:	00154783          	lbu	a5,1(a0)
    1672:	4625                	li	a2,9
        s++;
    1674:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1678:	fd07859b          	addiw	a1,a5,-48
    167c:	0007871b          	sext.w	a4,a5
    1680:	feb665e3          	bltu	a2,a1,166a <atoi+0x8a>
        neg = 1;
    1684:	4e05                	li	t3,1
    1686:	bf51                	j	161a <atoi+0x3a>

0000000000001688 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1688:	16060d63          	beqz	a2,1802 <memset+0x17a>
    168c:	40a007b3          	neg	a5,a0
    1690:	8b9d                	andi	a5,a5,7
    1692:	00778713          	addi	a4,a5,7
    1696:	482d                	li	a6,11
    1698:	0ff5f593          	andi	a1,a1,255
    169c:	fff60693          	addi	a3,a2,-1
    16a0:	17076263          	bltu	a4,a6,1804 <memset+0x17c>
    16a4:	16e6ea63          	bltu	a3,a4,1818 <memset+0x190>
    16a8:	16078563          	beqz	a5,1812 <memset+0x18a>
    16ac:	00b50023          	sb	a1,0(a0)
    16b0:	4705                	li	a4,1
    16b2:	00150e93          	addi	t4,a0,1
    16b6:	14e78c63          	beq	a5,a4,180e <memset+0x186>
    16ba:	00b500a3          	sb	a1,1(a0)
    16be:	4709                	li	a4,2
    16c0:	00250e93          	addi	t4,a0,2
    16c4:	14e78d63          	beq	a5,a4,181e <memset+0x196>
    16c8:	00b50123          	sb	a1,2(a0)
    16cc:	470d                	li	a4,3
    16ce:	00350e93          	addi	t4,a0,3
    16d2:	12e78b63          	beq	a5,a4,1808 <memset+0x180>
    16d6:	00b501a3          	sb	a1,3(a0)
    16da:	4711                	li	a4,4
    16dc:	00450e93          	addi	t4,a0,4
    16e0:	14e78163          	beq	a5,a4,1822 <memset+0x19a>
    16e4:	00b50223          	sb	a1,4(a0)
    16e8:	4715                	li	a4,5
    16ea:	00550e93          	addi	t4,a0,5
    16ee:	12e78c63          	beq	a5,a4,1826 <memset+0x19e>
    16f2:	00b502a3          	sb	a1,5(a0)
    16f6:	471d                	li	a4,7
    16f8:	00650e93          	addi	t4,a0,6
    16fc:	12e79763          	bne	a5,a4,182a <memset+0x1a2>
    1700:	00750e93          	addi	t4,a0,7
    1704:	00b50323          	sb	a1,6(a0)
    1708:	4f1d                	li	t5,7
    170a:	00859713          	slli	a4,a1,0x8
    170e:	8f4d                	or	a4,a4,a1
    1710:	01059e13          	slli	t3,a1,0x10
    1714:	01c76e33          	or	t3,a4,t3
    1718:	01859313          	slli	t1,a1,0x18
    171c:	006e6333          	or	t1,t3,t1
    1720:	02059893          	slli	a7,a1,0x20
    1724:	011368b3          	or	a7,t1,a7
    1728:	02859813          	slli	a6,a1,0x28
    172c:	40f60333          	sub	t1,a2,a5
    1730:	0108e833          	or	a6,a7,a6
    1734:	03059693          	slli	a3,a1,0x30
    1738:	00d866b3          	or	a3,a6,a3
    173c:	03859713          	slli	a4,a1,0x38
    1740:	97aa                	add	a5,a5,a0
    1742:	ff837813          	andi	a6,t1,-8
    1746:	8f55                	or	a4,a4,a3
    1748:	00f806b3          	add	a3,a6,a5
    174c:	e398                	sd	a4,0(a5)
    174e:	07a1                	addi	a5,a5,8
    1750:	fed79ee3          	bne	a5,a3,174c <memset+0xc4>
    1754:	ff837693          	andi	a3,t1,-8
    1758:	00de87b3          	add	a5,t4,a3
    175c:	01e6873b          	addw	a4,a3,t5
    1760:	0ad30663          	beq	t1,a3,180c <memset+0x184>
    1764:	00b78023          	sb	a1,0(a5)
    1768:	0017069b          	addiw	a3,a4,1
    176c:	08c6fb63          	bleu	a2,a3,1802 <memset+0x17a>
    1770:	00b780a3          	sb	a1,1(a5)
    1774:	0027069b          	addiw	a3,a4,2
    1778:	08c6f563          	bleu	a2,a3,1802 <memset+0x17a>
    177c:	00b78123          	sb	a1,2(a5)
    1780:	0037069b          	addiw	a3,a4,3
    1784:	06c6ff63          	bleu	a2,a3,1802 <memset+0x17a>
    1788:	00b781a3          	sb	a1,3(a5)
    178c:	0047069b          	addiw	a3,a4,4
    1790:	06c6f963          	bleu	a2,a3,1802 <memset+0x17a>
    1794:	00b78223          	sb	a1,4(a5)
    1798:	0057069b          	addiw	a3,a4,5
    179c:	06c6f363          	bleu	a2,a3,1802 <memset+0x17a>
    17a0:	00b782a3          	sb	a1,5(a5)
    17a4:	0067069b          	addiw	a3,a4,6
    17a8:	04c6fd63          	bleu	a2,a3,1802 <memset+0x17a>
    17ac:	00b78323          	sb	a1,6(a5)
    17b0:	0077069b          	addiw	a3,a4,7
    17b4:	04c6f763          	bleu	a2,a3,1802 <memset+0x17a>
    17b8:	00b783a3          	sb	a1,7(a5)
    17bc:	0087069b          	addiw	a3,a4,8
    17c0:	04c6f163          	bleu	a2,a3,1802 <memset+0x17a>
    17c4:	00b78423          	sb	a1,8(a5)
    17c8:	0097069b          	addiw	a3,a4,9
    17cc:	02c6fb63          	bleu	a2,a3,1802 <memset+0x17a>
    17d0:	00b784a3          	sb	a1,9(a5)
    17d4:	00a7069b          	addiw	a3,a4,10
    17d8:	02c6f563          	bleu	a2,a3,1802 <memset+0x17a>
    17dc:	00b78523          	sb	a1,10(a5)
    17e0:	00b7069b          	addiw	a3,a4,11
    17e4:	00c6ff63          	bleu	a2,a3,1802 <memset+0x17a>
    17e8:	00b785a3          	sb	a1,11(a5)
    17ec:	00c7069b          	addiw	a3,a4,12
    17f0:	00c6f963          	bleu	a2,a3,1802 <memset+0x17a>
    17f4:	00b78623          	sb	a1,12(a5)
    17f8:	2735                	addiw	a4,a4,13
    17fa:	00c77463          	bleu	a2,a4,1802 <memset+0x17a>
    17fe:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1802:	8082                	ret
    1804:	472d                	li	a4,11
    1806:	bd79                	j	16a4 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1808:	4f0d                	li	t5,3
    180a:	b701                	j	170a <memset+0x82>
    180c:	8082                	ret
    180e:	4f05                	li	t5,1
    1810:	bded                	j	170a <memset+0x82>
    1812:	8eaa                	mv	t4,a0
    1814:	4f01                	li	t5,0
    1816:	bdd5                	j	170a <memset+0x82>
    1818:	87aa                	mv	a5,a0
    181a:	4701                	li	a4,0
    181c:	b7a1                	j	1764 <memset+0xdc>
    181e:	4f09                	li	t5,2
    1820:	b5ed                	j	170a <memset+0x82>
    1822:	4f11                	li	t5,4
    1824:	b5dd                	j	170a <memset+0x82>
    1826:	4f15                	li	t5,5
    1828:	b5cd                	j	170a <memset+0x82>
    182a:	4f19                	li	t5,6
    182c:	bdf9                	j	170a <memset+0x82>

000000000000182e <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    182e:	00054703          	lbu	a4,0(a0)
    1832:	0005c783          	lbu	a5,0(a1)
    1836:	00e79b63          	bne	a5,a4,184c <strcmp+0x1e>
    183a:	cf89                	beqz	a5,1854 <strcmp+0x26>
    183c:	0505                	addi	a0,a0,1
    183e:	0585                	addi	a1,a1,1
    1840:	0005c783          	lbu	a5,0(a1)
    1844:	00054703          	lbu	a4,0(a0)
    1848:	fef709e3          	beq	a4,a5,183a <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    184c:	0007051b          	sext.w	a0,a4
}
    1850:	9d1d                	subw	a0,a0,a5
    1852:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1854:	4501                	li	a0,0
}
    1856:	9d1d                	subw	a0,a0,a5
    1858:	8082                	ret

000000000000185a <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    185a:	c231                	beqz	a2,189e <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    185c:	00054783          	lbu	a5,0(a0)
    1860:	0005c683          	lbu	a3,0(a1)
    1864:	c795                	beqz	a5,1890 <strncmp+0x36>
    1866:	ca85                	beqz	a3,1896 <strncmp+0x3c>
    if (!n--)
    1868:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    186a:	c615                	beqz	a2,1896 <strncmp+0x3c>
    186c:	00150713          	addi	a4,a0,1
    1870:	9532                	add	a0,a0,a2
    1872:	00d78963          	beq	a5,a3,1884 <strncmp+0x2a>
    1876:	a005                	j	1896 <strncmp+0x3c>
    1878:	ce99                	beqz	a3,1896 <strncmp+0x3c>
    187a:	00e50e63          	beq	a0,a4,1896 <strncmp+0x3c>
    187e:	0705                	addi	a4,a4,1
    1880:	00d79b63          	bne	a5,a3,1896 <strncmp+0x3c>
    1884:	00074783          	lbu	a5,0(a4)
    1888:	0585                	addi	a1,a1,1
    188a:	0005c683          	lbu	a3,0(a1)
    188e:	f7ed                	bnez	a5,1878 <strncmp+0x1e>
    1890:	4501                	li	a0,0
        ;
    return *l - *r;
    1892:	9d15                	subw	a0,a0,a3
    1894:	8082                	ret
    1896:	0007851b          	sext.w	a0,a5
    189a:	9d15                	subw	a0,a0,a3
    189c:	8082                	ret
        return 0;
    189e:	4501                	li	a0,0
}
    18a0:	8082                	ret

00000000000018a2 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    18a2:	00757793          	andi	a5,a0,7
    18a6:	cfa1                	beqz	a5,18fe <strlen+0x5c>
        if (!*s)
    18a8:	00054783          	lbu	a5,0(a0)
    18ac:	cbb9                	beqz	a5,1902 <strlen+0x60>
    18ae:	87aa                	mv	a5,a0
    18b0:	a021                	j	18b8 <strlen+0x16>
    18b2:	0007c703          	lbu	a4,0(a5)
    18b6:	c329                	beqz	a4,18f8 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    18b8:	0785                	addi	a5,a5,1
    18ba:	0077f713          	andi	a4,a5,7
    18be:	fb75                	bnez	a4,18b2 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18c0:	00001717          	auipc	a4,0x1
    18c4:	80070713          	addi	a4,a4,-2048 # 20c0 <__clone+0xc8>
    18c8:	630c                	ld	a1,0(a4)
    18ca:	00000717          	auipc	a4,0x0
    18ce:	7fe70713          	addi	a4,a4,2046 # 20c8 <__clone+0xd0>
    18d2:	6394                	ld	a3,0(a5)
    18d4:	6310                	ld	a2,0(a4)
    18d6:	a019                	j	18dc <strlen+0x3a>
    18d8:	07a1                	addi	a5,a5,8
    18da:	6394                	ld	a3,0(a5)
    18dc:	00b68733          	add	a4,a3,a1
    18e0:	fff6c693          	not	a3,a3
    18e4:	8f75                	and	a4,a4,a3
    18e6:	8f71                	and	a4,a4,a2
    18e8:	db65                	beqz	a4,18d8 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18ea:	0007c703          	lbu	a4,0(a5)
    18ee:	c709                	beqz	a4,18f8 <strlen+0x56>
    18f0:	0785                	addi	a5,a5,1
    18f2:	0007c703          	lbu	a4,0(a5)
    18f6:	ff6d                	bnez	a4,18f0 <strlen+0x4e>
        ;
    return s - a;
    18f8:	40a78533          	sub	a0,a5,a0
}
    18fc:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18fe:	87aa                	mv	a5,a0
    1900:	b7c1                	j	18c0 <strlen+0x1e>
        if (!*s)
    1902:	4501                	li	a0,0
            return s - a;
    1904:	8082                	ret

0000000000001906 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1906:	00757793          	andi	a5,a0,7
    190a:	0ff5f593          	andi	a1,a1,255
    190e:	cb99                	beqz	a5,1924 <memchr+0x1e>
    1910:	c655                	beqz	a2,19bc <memchr+0xb6>
    1912:	00054783          	lbu	a5,0(a0)
    1916:	0ab78663          	beq	a5,a1,19c2 <memchr+0xbc>
    191a:	0505                	addi	a0,a0,1
    191c:	00757793          	andi	a5,a0,7
    1920:	167d                	addi	a2,a2,-1
    1922:	f7fd                	bnez	a5,1910 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1924:	4701                	li	a4,0
    if (n && *s != c)
    1926:	ca49                	beqz	a2,19b8 <memchr+0xb2>
    1928:	00054783          	lbu	a5,0(a0)
    192c:	08b78b63          	beq	a5,a1,19c2 <memchr+0xbc>
        size_t k = ONES * c;
    1930:	00000797          	auipc	a5,0x0
    1934:	7a078793          	addi	a5,a5,1952 # 20d0 <__clone+0xd8>
    1938:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    193a:	479d                	li	a5,7
        size_t k = ONES * c;
    193c:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1940:	08c7f863          	bleu	a2,a5,19d0 <memchr+0xca>
    1944:	611c                	ld	a5,0(a0)
    1946:	00000317          	auipc	t1,0x0
    194a:	78230313          	addi	t1,t1,1922 # 20c8 <__clone+0xd0>
    194e:	00033803          	ld	a6,0(t1)
    1952:	00f8c7b3          	xor	a5,a7,a5
    1956:	fff7c713          	not	a4,a5
    195a:	8f95                	sub	a5,a5,a3
    195c:	8ff9                	and	a5,a5,a4
    195e:	0107f7b3          	and	a5,a5,a6
    1962:	e7bd                	bnez	a5,19d0 <memchr+0xca>
    1964:	4e1d                	li	t3,7
    1966:	00000e97          	auipc	t4,0x0
    196a:	75ae8e93          	addi	t4,t4,1882 # 20c0 <__clone+0xc8>
    196e:	a005                	j	198e <memchr+0x88>
    1970:	6514                	ld	a3,8(a0)
    1972:	000eb783          	ld	a5,0(t4)
    1976:	00033803          	ld	a6,0(t1)
    197a:	00d8c6b3          	xor	a3,a7,a3
    197e:	97b6                	add	a5,a5,a3
    1980:	fff6c693          	not	a3,a3
    1984:	8ff5                	and	a5,a5,a3
    1986:	0107f7b3          	and	a5,a5,a6
    198a:	e3a1                	bnez	a5,19ca <memchr+0xc4>
    198c:	853a                	mv	a0,a4
    198e:	1661                	addi	a2,a2,-8
    1990:	00850713          	addi	a4,a0,8
    1994:	fcce6ee3          	bltu	t3,a2,1970 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1998:	c215                	beqz	a2,19bc <memchr+0xb6>
    199a:	00074783          	lbu	a5,0(a4)
    199e:	00f58d63          	beq	a1,a5,19b8 <memchr+0xb2>
    19a2:	00170793          	addi	a5,a4,1
    19a6:	963a                	add	a2,a2,a4
    19a8:	873e                	mv	a4,a5
    19aa:	00f60963          	beq	a2,a5,19bc <memchr+0xb6>
    19ae:	0007c683          	lbu	a3,0(a5)
    19b2:	0785                	addi	a5,a5,1
    19b4:	feb69ae3          	bne	a3,a1,19a8 <memchr+0xa2>
}
    19b8:	853a                	mv	a0,a4
    19ba:	8082                	ret
    return n ? (void *)s : 0;
    19bc:	4701                	li	a4,0
}
    19be:	853a                	mv	a0,a4
    19c0:	8082                	ret
    19c2:	872a                	mv	a4,a0
    19c4:	00074783          	lbu	a5,0(a4)
    19c8:	bfd9                	j	199e <memchr+0x98>
    19ca:	00854783          	lbu	a5,8(a0)
    19ce:	bfc1                	j	199e <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19d0:	872a                	mv	a4,a0
    19d2:	bfc1                	j	19a2 <memchr+0x9c>

00000000000019d4 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19d4:	00757793          	andi	a5,a0,7
    19d8:	cfc5                	beqz	a5,1a90 <strnlen+0xbc>
    19da:	c1c5                	beqz	a1,1a7a <strnlen+0xa6>
    19dc:	00054783          	lbu	a5,0(a0)
    19e0:	cfd9                	beqz	a5,1a7e <strnlen+0xaa>
    19e2:	87ae                	mv	a5,a1
    19e4:	86aa                	mv	a3,a0
    19e6:	a029                	j	19f0 <strnlen+0x1c>
    19e8:	cbc9                	beqz	a5,1a7a <strnlen+0xa6>
    19ea:	0006c703          	lbu	a4,0(a3)
    19ee:	cb51                	beqz	a4,1a82 <strnlen+0xae>
    19f0:	0685                	addi	a3,a3,1
    19f2:	0076f713          	andi	a4,a3,7
    19f6:	17fd                	addi	a5,a5,-1
    19f8:	fb65                	bnez	a4,19e8 <strnlen+0x14>
    if (n && *s != c)
    19fa:	c3c1                	beqz	a5,1a7a <strnlen+0xa6>
    19fc:	0006c703          	lbu	a4,0(a3)
    1a00:	c349                	beqz	a4,1a82 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a02:	471d                	li	a4,7
    1a04:	08f77a63          	bleu	a5,a4,1a98 <strnlen+0xc4>
    1a08:	00000e17          	auipc	t3,0x0
    1a0c:	6b8e0e13          	addi	t3,t3,1720 # 20c0 <__clone+0xc8>
    1a10:	6290                	ld	a2,0(a3)
    1a12:	000e3703          	ld	a4,0(t3)
    1a16:	00000e97          	auipc	t4,0x0
    1a1a:	6b2e8e93          	addi	t4,t4,1714 # 20c8 <__clone+0xd0>
    1a1e:	000eb803          	ld	a6,0(t4)
    1a22:	9732                	add	a4,a4,a2
    1a24:	fff64613          	not	a2,a2
    1a28:	8f71                	and	a4,a4,a2
    1a2a:	01077733          	and	a4,a4,a6
    1a2e:	e72d                	bnez	a4,1a98 <strnlen+0xc4>
    1a30:	4f1d                	li	t5,7
    1a32:	a839                	j	1a50 <strnlen+0x7c>
    1a34:	6698                	ld	a4,8(a3)
    1a36:	000e3303          	ld	t1,0(t3)
    1a3a:	000eb803          	ld	a6,0(t4)
    1a3e:	fff74893          	not	a7,a4
    1a42:	971a                	add	a4,a4,t1
    1a44:	01177733          	and	a4,a4,a7
    1a48:	01077733          	and	a4,a4,a6
    1a4c:	ef1d                	bnez	a4,1a8a <strnlen+0xb6>
    1a4e:	86b2                	mv	a3,a2
    1a50:	17e1                	addi	a5,a5,-8
    1a52:	00868613          	addi	a2,a3,8
    1a56:	fcff6fe3          	bltu	t5,a5,1a34 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a5a:	c385                	beqz	a5,1a7a <strnlen+0xa6>
    1a5c:	00064703          	lbu	a4,0(a2)
    1a60:	cb19                	beqz	a4,1a76 <strnlen+0xa2>
    1a62:	00160713          	addi	a4,a2,1
    1a66:	97b2                	add	a5,a5,a2
    1a68:	863a                	mv	a2,a4
    1a6a:	00e78863          	beq	a5,a4,1a7a <strnlen+0xa6>
    1a6e:	0705                	addi	a4,a4,1
    1a70:	fff74683          	lbu	a3,-1(a4)
    1a74:	faf5                	bnez	a3,1a68 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a76:	40a605b3          	sub	a1,a2,a0
}
    1a7a:	852e                	mv	a0,a1
    1a7c:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a7e:	87ae                	mv	a5,a1
    1a80:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a82:	8636                	mv	a2,a3
    1a84:	00064703          	lbu	a4,0(a2)
    1a88:	bfe1                	j	1a60 <strnlen+0x8c>
    1a8a:	0086c703          	lbu	a4,8(a3)
    1a8e:	bfc9                	j	1a60 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a90:	87ae                	mv	a5,a1
    1a92:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a94:	f7a5                	bnez	a5,19fc <strnlen+0x28>
    1a96:	b7d5                	j	1a7a <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a98:	8636                	mv	a2,a3
    1a9a:	b7e1                	j	1a62 <strnlen+0x8e>

0000000000001a9c <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a9c:	00b547b3          	xor	a5,a0,a1
    1aa0:	8b9d                	andi	a5,a5,7
    1aa2:	efa9                	bnez	a5,1afc <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1aa4:	0075f793          	andi	a5,a1,7
    1aa8:	c38d                	beqz	a5,1aca <strcpy+0x2e>
            if (!(*d = *s))
    1aaa:	0005c783          	lbu	a5,0(a1)
    1aae:	00f50023          	sb	a5,0(a0)
    1ab2:	e799                	bnez	a5,1ac0 <strcpy+0x24>
    1ab4:	a095                	j	1b18 <strcpy+0x7c>
    1ab6:	0005c783          	lbu	a5,0(a1)
    1aba:	00f50023          	sb	a5,0(a0)
    1abe:	cbb9                	beqz	a5,1b14 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1ac0:	0585                	addi	a1,a1,1
    1ac2:	0075f793          	andi	a5,a1,7
    1ac6:	0505                	addi	a0,a0,1
    1ac8:	f7fd                	bnez	a5,1ab6 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1aca:	00000797          	auipc	a5,0x0
    1ace:	5f678793          	addi	a5,a5,1526 # 20c0 <__clone+0xc8>
    1ad2:	0007b803          	ld	a6,0(a5)
    1ad6:	00000797          	auipc	a5,0x0
    1ada:	5f278793          	addi	a5,a5,1522 # 20c8 <__clone+0xd0>
    1ade:	6198                	ld	a4,0(a1)
    1ae0:	6390                	ld	a2,0(a5)
    1ae2:	a031                	j	1aee <strcpy+0x52>
    1ae4:	0521                	addi	a0,a0,8
    1ae6:	05a1                	addi	a1,a1,8
    1ae8:	fee53c23          	sd	a4,-8(a0)
    1aec:	6198                	ld	a4,0(a1)
    1aee:	010707b3          	add	a5,a4,a6
    1af2:	fff74693          	not	a3,a4
    1af6:	8ff5                	and	a5,a5,a3
    1af8:	8ff1                	and	a5,a5,a2
    1afa:	d7ed                	beqz	a5,1ae4 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1afc:	0005c783          	lbu	a5,0(a1)
    1b00:	00f50023          	sb	a5,0(a0)
    1b04:	cb89                	beqz	a5,1b16 <strcpy+0x7a>
    1b06:	0585                	addi	a1,a1,1
    1b08:	0005c783          	lbu	a5,0(a1)
    1b0c:	0505                	addi	a0,a0,1
    1b0e:	00f50023          	sb	a5,0(a0)
    1b12:	fbf5                	bnez	a5,1b06 <strcpy+0x6a>
        ;
    return d;
}
    1b14:	8082                	ret
    1b16:	8082                	ret
    1b18:	8082                	ret

0000000000001b1a <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b1a:	00b547b3          	xor	a5,a0,a1
    1b1e:	8b9d                	andi	a5,a5,7
    1b20:	ebc1                	bnez	a5,1bb0 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b22:	0075f793          	andi	a5,a1,7
    1b26:	cf91                	beqz	a5,1b42 <strncpy+0x28>
    1b28:	20060e63          	beqz	a2,1d44 <strncpy+0x22a>
    1b2c:	0005c783          	lbu	a5,0(a1)
    1b30:	00f50023          	sb	a5,0(a0)
    1b34:	c3d5                	beqz	a5,1bd8 <strncpy+0xbe>
    1b36:	0585                	addi	a1,a1,1
    1b38:	0075f793          	andi	a5,a1,7
    1b3c:	167d                	addi	a2,a2,-1
    1b3e:	0505                	addi	a0,a0,1
    1b40:	f7e5                	bnez	a5,1b28 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b42:	20060163          	beqz	a2,1d44 <strncpy+0x22a>
    1b46:	0005c683          	lbu	a3,0(a1)
    1b4a:	c6d9                	beqz	a3,1bd8 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b4c:	479d                	li	a5,7
    1b4e:	22c7f563          	bleu	a2,a5,1d78 <strncpy+0x25e>
    1b52:	00000317          	auipc	t1,0x0
    1b56:	56e30313          	addi	t1,t1,1390 # 20c0 <__clone+0xc8>
    1b5a:	6198                	ld	a4,0(a1)
    1b5c:	00033783          	ld	a5,0(t1)
    1b60:	00000e17          	auipc	t3,0x0
    1b64:	568e0e13          	addi	t3,t3,1384 # 20c8 <__clone+0xd0>
    1b68:	000e3803          	ld	a6,0(t3)
    1b6c:	97ba                	add	a5,a5,a4
    1b6e:	fff74893          	not	a7,a4
    1b72:	0117f7b3          	and	a5,a5,a7
    1b76:	0107f7b3          	and	a5,a5,a6
    1b7a:	1e079f63          	bnez	a5,1d78 <strncpy+0x25e>
    1b7e:	4e9d                	li	t4,7
    1b80:	a005                	j	1ba0 <strncpy+0x86>
    1b82:	6598                	ld	a4,8(a1)
    1b84:	00033783          	ld	a5,0(t1)
    1b88:	000e3803          	ld	a6,0(t3)
    1b8c:	fff74893          	not	a7,a4
    1b90:	97ba                	add	a5,a5,a4
    1b92:	0117f7b3          	and	a5,a5,a7
    1b96:	0107f7b3          	and	a5,a5,a6
    1b9a:	1a079f63          	bnez	a5,1d58 <strncpy+0x23e>
    1b9e:	85b6                	mv	a1,a3
            *wd = *ws;
    1ba0:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ba2:	1661                	addi	a2,a2,-8
    1ba4:	00858693          	addi	a3,a1,8
    1ba8:	0521                	addi	a0,a0,8
    1baa:	fcceece3          	bltu	t4,a2,1b82 <strncpy+0x68>
    1bae:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bb0:	18060a63          	beqz	a2,1d44 <strncpy+0x22a>
    1bb4:	0005c783          	lbu	a5,0(a1)
    1bb8:	872a                	mv	a4,a0
    1bba:	00f50023          	sb	a5,0(a0)
    1bbe:	e799                	bnez	a5,1bcc <strncpy+0xb2>
    1bc0:	a829                	j	1bda <strncpy+0xc0>
    1bc2:	0005c783          	lbu	a5,0(a1)
    1bc6:	00f70023          	sb	a5,0(a4)
    1bca:	cb81                	beqz	a5,1bda <strncpy+0xc0>
    1bcc:	167d                	addi	a2,a2,-1
    1bce:	0585                	addi	a1,a1,1
    1bd0:	0705                	addi	a4,a4,1
    1bd2:	fa65                	bnez	a2,1bc2 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1bd4:	853a                	mv	a0,a4
    1bd6:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1bd8:	872a                	mv	a4,a0
    1bda:	4805                	li	a6,1
    1bdc:	14061c63          	bnez	a2,1d34 <strncpy+0x21a>
    1be0:	40e007b3          	neg	a5,a4
    1be4:	8b9d                	andi	a5,a5,7
    1be6:	4581                	li	a1,0
    1be8:	12061e63          	bnez	a2,1d24 <strncpy+0x20a>
    1bec:	00778693          	addi	a3,a5,7
    1bf0:	452d                	li	a0,11
    1bf2:	12a6e763          	bltu	a3,a0,1d20 <strncpy+0x206>
    1bf6:	16d5e663          	bltu	a1,a3,1d62 <strncpy+0x248>
    1bfa:	14078c63          	beqz	a5,1d52 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bfe:	00070023          	sb	zero,0(a4)
    1c02:	4585                	li	a1,1
    1c04:	00170693          	addi	a3,a4,1
    1c08:	14b78363          	beq	a5,a1,1d4e <strncpy+0x234>
    1c0c:	000700a3          	sb	zero,1(a4)
    1c10:	4589                	li	a1,2
    1c12:	00270693          	addi	a3,a4,2
    1c16:	14b78963          	beq	a5,a1,1d68 <strncpy+0x24e>
    1c1a:	00070123          	sb	zero,2(a4)
    1c1e:	458d                	li	a1,3
    1c20:	00370693          	addi	a3,a4,3
    1c24:	12b78363          	beq	a5,a1,1d4a <strncpy+0x230>
    1c28:	000701a3          	sb	zero,3(a4)
    1c2c:	4591                	li	a1,4
    1c2e:	00470693          	addi	a3,a4,4
    1c32:	12b78d63          	beq	a5,a1,1d6c <strncpy+0x252>
    1c36:	00070223          	sb	zero,4(a4)
    1c3a:	4595                	li	a1,5
    1c3c:	00570693          	addi	a3,a4,5
    1c40:	12b78863          	beq	a5,a1,1d70 <strncpy+0x256>
    1c44:	000702a3          	sb	zero,5(a4)
    1c48:	459d                	li	a1,7
    1c4a:	00670693          	addi	a3,a4,6
    1c4e:	12b79363          	bne	a5,a1,1d74 <strncpy+0x25a>
    1c52:	00770693          	addi	a3,a4,7
    1c56:	00070323          	sb	zero,6(a4)
    1c5a:	40f80833          	sub	a6,a6,a5
    1c5e:	ff887513          	andi	a0,a6,-8
    1c62:	97ba                	add	a5,a5,a4
    1c64:	953e                	add	a0,a0,a5
    1c66:	0007b023          	sd	zero,0(a5)
    1c6a:	07a1                	addi	a5,a5,8
    1c6c:	fea79de3          	bne	a5,a0,1c66 <strncpy+0x14c>
    1c70:	ff887513          	andi	a0,a6,-8
    1c74:	9da9                	addw	a1,a1,a0
    1c76:	00a687b3          	add	a5,a3,a0
    1c7a:	f4a80de3          	beq	a6,a0,1bd4 <strncpy+0xba>
    1c7e:	00078023          	sb	zero,0(a5)
    1c82:	0015869b          	addiw	a3,a1,1
    1c86:	f4c6f7e3          	bleu	a2,a3,1bd4 <strncpy+0xba>
    1c8a:	000780a3          	sb	zero,1(a5)
    1c8e:	0025869b          	addiw	a3,a1,2
    1c92:	f4c6f1e3          	bleu	a2,a3,1bd4 <strncpy+0xba>
    1c96:	00078123          	sb	zero,2(a5)
    1c9a:	0035869b          	addiw	a3,a1,3
    1c9e:	f2c6fbe3          	bleu	a2,a3,1bd4 <strncpy+0xba>
    1ca2:	000781a3          	sb	zero,3(a5)
    1ca6:	0045869b          	addiw	a3,a1,4
    1caa:	f2c6f5e3          	bleu	a2,a3,1bd4 <strncpy+0xba>
    1cae:	00078223          	sb	zero,4(a5)
    1cb2:	0055869b          	addiw	a3,a1,5
    1cb6:	f0c6ffe3          	bleu	a2,a3,1bd4 <strncpy+0xba>
    1cba:	000782a3          	sb	zero,5(a5)
    1cbe:	0065869b          	addiw	a3,a1,6
    1cc2:	f0c6f9e3          	bleu	a2,a3,1bd4 <strncpy+0xba>
    1cc6:	00078323          	sb	zero,6(a5)
    1cca:	0075869b          	addiw	a3,a1,7
    1cce:	f0c6f3e3          	bleu	a2,a3,1bd4 <strncpy+0xba>
    1cd2:	000783a3          	sb	zero,7(a5)
    1cd6:	0085869b          	addiw	a3,a1,8
    1cda:	eec6fde3          	bleu	a2,a3,1bd4 <strncpy+0xba>
    1cde:	00078423          	sb	zero,8(a5)
    1ce2:	0095869b          	addiw	a3,a1,9
    1ce6:	eec6f7e3          	bleu	a2,a3,1bd4 <strncpy+0xba>
    1cea:	000784a3          	sb	zero,9(a5)
    1cee:	00a5869b          	addiw	a3,a1,10
    1cf2:	eec6f1e3          	bleu	a2,a3,1bd4 <strncpy+0xba>
    1cf6:	00078523          	sb	zero,10(a5)
    1cfa:	00b5869b          	addiw	a3,a1,11
    1cfe:	ecc6fbe3          	bleu	a2,a3,1bd4 <strncpy+0xba>
    1d02:	000785a3          	sb	zero,11(a5)
    1d06:	00c5869b          	addiw	a3,a1,12
    1d0a:	ecc6f5e3          	bleu	a2,a3,1bd4 <strncpy+0xba>
    1d0e:	00078623          	sb	zero,12(a5)
    1d12:	25b5                	addiw	a1,a1,13
    1d14:	ecc5f0e3          	bleu	a2,a1,1bd4 <strncpy+0xba>
    1d18:	000786a3          	sb	zero,13(a5)
}
    1d1c:	853a                	mv	a0,a4
    1d1e:	8082                	ret
    1d20:	46ad                	li	a3,11
    1d22:	bdd1                	j	1bf6 <strncpy+0xdc>
    1d24:	00778693          	addi	a3,a5,7
    1d28:	452d                	li	a0,11
    1d2a:	fff60593          	addi	a1,a2,-1
    1d2e:	eca6f4e3          	bleu	a0,a3,1bf6 <strncpy+0xdc>
    1d32:	b7fd                	j	1d20 <strncpy+0x206>
    1d34:	40e007b3          	neg	a5,a4
    1d38:	8832                	mv	a6,a2
    1d3a:	8b9d                	andi	a5,a5,7
    1d3c:	4581                	li	a1,0
    1d3e:	ea0607e3          	beqz	a2,1bec <strncpy+0xd2>
    1d42:	b7cd                	j	1d24 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d44:	872a                	mv	a4,a0
}
    1d46:	853a                	mv	a0,a4
    1d48:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d4a:	458d                	li	a1,3
    1d4c:	b739                	j	1c5a <strncpy+0x140>
    1d4e:	4585                	li	a1,1
    1d50:	b729                	j	1c5a <strncpy+0x140>
    1d52:	86ba                	mv	a3,a4
    1d54:	4581                	li	a1,0
    1d56:	b711                	j	1c5a <strncpy+0x140>
    1d58:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d5c:	872a                	mv	a4,a0
    1d5e:	85b6                	mv	a1,a3
    1d60:	bda9                	j	1bba <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d62:	87ba                	mv	a5,a4
    1d64:	4581                	li	a1,0
    1d66:	bf21                	j	1c7e <strncpy+0x164>
    1d68:	4589                	li	a1,2
    1d6a:	bdc5                	j	1c5a <strncpy+0x140>
    1d6c:	4591                	li	a1,4
    1d6e:	b5f5                	j	1c5a <strncpy+0x140>
    1d70:	4595                	li	a1,5
    1d72:	b5e5                	j	1c5a <strncpy+0x140>
    1d74:	4599                	li	a1,6
    1d76:	b5d5                	j	1c5a <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d78:	00d50023          	sb	a3,0(a0)
    1d7c:	872a                	mv	a4,a0
    1d7e:	b5b9                	j	1bcc <strncpy+0xb2>

0000000000001d80 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d80:	87aa                	mv	a5,a0
    1d82:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d84:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d88:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d8c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d8e:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d90:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <openat>:
    register long a7 __asm__("a7") = n;
    1d98:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d9c:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1da0:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1da4:	2501                	sext.w	a0,a0
    1da6:	8082                	ret

0000000000001da8 <close>:
    register long a7 __asm__("a7") = n;
    1da8:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1dac:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <read>:
    register long a7 __asm__("a7") = n;
    1db4:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db8:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1dbc:	8082                	ret

0000000000001dbe <write>:
    register long a7 __asm__("a7") = n;
    1dbe:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dc2:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1dc6:	8082                	ret

0000000000001dc8 <getpid>:
    register long a7 __asm__("a7") = n;
    1dc8:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1dcc:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <getppid>:
    register long a7 __asm__("a7") = n;
    1dd4:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1dd8:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1de0:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1de4:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <fork>:
    register long a7 __asm__("a7") = n;
    1dec:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1df0:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1df2:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df4:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1df8:	2501                	sext.w	a0,a0
    1dfa:	8082                	ret

0000000000001dfc <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1dfc:	85b2                	mv	a1,a2
    1dfe:	863a                	mv	a2,a4
    if (stack)
    1e00:	c191                	beqz	a1,1e04 <clone+0x8>
	stack += stack_size;
    1e02:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1e04:	4781                	li	a5,0
    1e06:	4701                	li	a4,0
    1e08:	4681                	li	a3,0
    1e0a:	2601                	sext.w	a2,a2
    1e0c:	1ec0006f          	j	1ff8 <__clone>

0000000000001e10 <exit>:
    register long a7 __asm__("a7") = n;
    1e10:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e14:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e18:	8082                	ret

0000000000001e1a <waitpid>:
    register long a7 __asm__("a7") = n;
    1e1a:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e1e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e20:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e24:	2501                	sext.w	a0,a0
    1e26:	8082                	ret

0000000000001e28 <exec>:
    register long a7 __asm__("a7") = n;
    1e28:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e2c:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e30:	2501                	sext.w	a0,a0
    1e32:	8082                	ret

0000000000001e34 <execve>:
    register long a7 __asm__("a7") = n;
    1e34:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e38:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <times>:
    register long a7 __asm__("a7") = n;
    1e40:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e44:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <get_time>:

int64 get_time()
{
    1e4c:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e4e:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e52:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e54:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e56:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	ed09                	bnez	a0,1e76 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e5e:	67a2                	ld	a5,8(sp)
    1e60:	3e800713          	li	a4,1000
    1e64:	00015503          	lhu	a0,0(sp)
    1e68:	02e7d7b3          	divu	a5,a5,a4
    1e6c:	02e50533          	mul	a0,a0,a4
    1e70:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e72:	0141                	addi	sp,sp,16
    1e74:	8082                	ret
        return -1;
    1e76:	557d                	li	a0,-1
    1e78:	bfed                	j	1e72 <get_time+0x26>

0000000000001e7a <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e7a:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7e:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <time>:
    register long a7 __asm__("a7") = n;
    1e86:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e8a:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <sleep>:

int sleep(unsigned long long time)
{
    1e92:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e94:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e96:	850a                	mv	a0,sp
    1e98:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e9a:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e9e:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea0:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ea4:	e501                	bnez	a0,1eac <sleep+0x1a>
    return 0;
    1ea6:	4501                	li	a0,0
}
    1ea8:	0141                	addi	sp,sp,16
    1eaa:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1eac:	4502                	lw	a0,0(sp)
}
    1eae:	0141                	addi	sp,sp,16
    1eb0:	8082                	ret

0000000000001eb2 <set_priority>:
    register long a7 __asm__("a7") = n;
    1eb2:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1eb6:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1ebe:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1ec2:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1ec6:	8082                	ret

0000000000001ec8 <munmap>:
    register long a7 __asm__("a7") = n;
    1ec8:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ecc:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1ed0:	2501                	sext.w	a0,a0
    1ed2:	8082                	ret

0000000000001ed4 <wait>:

int wait(int *code)
{
    1ed4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ed6:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1eda:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1edc:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1ede:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ee0:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ee4:	2501                	sext.w	a0,a0
    1ee6:	8082                	ret

0000000000001ee8 <spawn>:
    register long a7 __asm__("a7") = n;
    1ee8:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1eec:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ef0:	2501                	sext.w	a0,a0
    1ef2:	8082                	ret

0000000000001ef4 <mailread>:
    register long a7 __asm__("a7") = n;
    1ef4:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef8:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1efc:	2501                	sext.w	a0,a0
    1efe:	8082                	ret

0000000000001f00 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1f00:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f04:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f08:	2501                	sext.w	a0,a0
    1f0a:	8082                	ret

0000000000001f0c <fstat>:
    register long a7 __asm__("a7") = n;
    1f0c:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f10:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f14:	2501                	sext.w	a0,a0
    1f16:	8082                	ret

0000000000001f18 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1f18:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f1a:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f1e:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f20:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f24:	2501                	sext.w	a0,a0
    1f26:	8082                	ret

0000000000001f28 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f28:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f2a:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f2e:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f30:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f34:	2501                	sext.w	a0,a0
    1f36:	8082                	ret

0000000000001f38 <link>:

int link(char *old_path, char *new_path)
{
    1f38:	87aa                	mv	a5,a0
    1f3a:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f3c:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f40:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f44:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f46:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f4a:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f4c:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f50:	2501                	sext.w	a0,a0
    1f52:	8082                	ret

0000000000001f54 <unlink>:

int unlink(char *path)
{
    1f54:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f56:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f5a:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f5e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f60:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f64:	2501                	sext.w	a0,a0
    1f66:	8082                	ret

0000000000001f68 <uname>:
    register long a7 __asm__("a7") = n;
    1f68:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f6c:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f70:	2501                	sext.w	a0,a0
    1f72:	8082                	ret

0000000000001f74 <brk>:
    register long a7 __asm__("a7") = n;
    1f74:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f78:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f7c:	2501                	sext.w	a0,a0
    1f7e:	8082                	ret

0000000000001f80 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f80:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f82:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f86:	8082                	ret

0000000000001f88 <chdir>:
    register long a7 __asm__("a7") = n;
    1f88:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f8c:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f90:	2501                	sext.w	a0,a0
    1f92:	8082                	ret

0000000000001f94 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f94:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f96:	02059613          	slli	a2,a1,0x20
    1f9a:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f9c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1fa0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fa4:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fa6:	00000073          	ecall
}
    1faa:	2501                	sext.w	a0,a0
    1fac:	8082                	ret

0000000000001fae <getdents>:
    register long a7 __asm__("a7") = n;
    1fae:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fb2:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1fb6:	2501                	sext.w	a0,a0
    1fb8:	8082                	ret

0000000000001fba <pipe>:
    register long a7 __asm__("a7") = n;
    1fba:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1fbe:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fc0:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1fc4:	2501                	sext.w	a0,a0
    1fc6:	8082                	ret

0000000000001fc8 <dup>:
    register long a7 __asm__("a7") = n;
    1fc8:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1fca:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1fce:	2501                	sext.w	a0,a0
    1fd0:	8082                	ret

0000000000001fd2 <dup2>:
    register long a7 __asm__("a7") = n;
    1fd2:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fd4:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fd6:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fda:	2501                	sext.w	a0,a0
    1fdc:	8082                	ret

0000000000001fde <mount>:
    register long a7 __asm__("a7") = n;
    1fde:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fe2:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fe6:	2501                	sext.w	a0,a0
    1fe8:	8082                	ret

0000000000001fea <umount>:
    register long a7 __asm__("a7") = n;
    1fea:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fee:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ff0:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ff4:	2501                	sext.w	a0,a0
    1ff6:	8082                	ret

0000000000001ff8 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ff8:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1ffa:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ffc:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ffe:	8532                	mv	a0,a2
	mv a2, a4
    2000:	863a                	mv	a2,a4
	mv a3, a5
    2002:	86be                	mv	a3,a5
	mv a4, a6
    2004:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    2006:	0dc00893          	li	a7,220
	ecall
    200a:	00000073          	ecall

	beqz a0, 1f
    200e:	c111                	beqz	a0,2012 <__clone+0x1a>
	# Parent
	ret
    2010:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    2012:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    2014:	6522                	ld	a0,8(sp)
	jalr a1
    2016:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    2018:	05d00893          	li	a7,93
	ecall
    201c:	00000073          	ecall
