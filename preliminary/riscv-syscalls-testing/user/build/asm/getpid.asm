
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/getpid:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	08c0006f          	j	108e <__start_main>

0000000000001006 <test_getpid>:
/*
理想结果：得到进程 pid，注意要关注 pid 是否符合内核逻辑，不要单纯以 Test OK! 作为判断。
*/

int test_getpid()
{
    1006:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	fc050513          	addi	a0,a0,-64 # 1fc8 <__clone+0x2a>
{
    1010:	ec06                	sd	ra,24(sp)
    TEST_START(__func__);
    1012:	27c000ef          	jal	ra,128e <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	04a50513          	addi	a0,a0,74 # 2060 <__func__.1185>
    101e:	270000ef          	jal	ra,128e <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	fbe50513          	addi	a0,a0,-66 # 1fe0 <__clone+0x42>
    102a:	264000ef          	jal	ra,128e <puts>
    int pid = getpid();
    102e:	541000ef          	jal	ra,1d6e <getpid>
    1032:	85aa                	mv	a1,a0
    assert(pid >= 0);
    1034:	02054c63          	bltz	a0,106c <test_getpid+0x66>
    printf("getpid success.\npid = %d\n", pid);
    1038:	00001517          	auipc	a0,0x1
    103c:	fd850513          	addi	a0,a0,-40 # 2010 <__clone+0x72>
    1040:	270000ef          	jal	ra,12b0 <printf>
    TEST_END(__func__);
    1044:	00001517          	auipc	a0,0x1
    1048:	fec50513          	addi	a0,a0,-20 # 2030 <__clone+0x92>
    104c:	242000ef          	jal	ra,128e <puts>
    1050:	00001517          	auipc	a0,0x1
    1054:	01050513          	addi	a0,a0,16 # 2060 <__func__.1185>
    1058:	236000ef          	jal	ra,128e <puts>
}
    105c:	60e2                	ld	ra,24(sp)
    TEST_END(__func__);
    105e:	00001517          	auipc	a0,0x1
    1062:	f8250513          	addi	a0,a0,-126 # 1fe0 <__clone+0x42>
}
    1066:	6105                	addi	sp,sp,32
    TEST_END(__func__);
    1068:	2260006f          	j	128e <puts>
    106c:	e42a                	sd	a0,8(sp)
    assert(pid >= 0);
    106e:	00001517          	auipc	a0,0x1
    1072:	f8250513          	addi	a0,a0,-126 # 1ff0 <__clone+0x52>
    1076:	4de000ef          	jal	ra,1554 <panic>
    107a:	65a2                	ld	a1,8(sp)
    107c:	bf75                	j	1038 <test_getpid+0x32>

000000000000107e <main>:

int main(void) {
    107e:	1141                	addi	sp,sp,-16
    1080:	e406                	sd	ra,8(sp)
	test_getpid();
    1082:	f85ff0ef          	jal	ra,1006 <test_getpid>
	return 0;
}
    1086:	60a2                	ld	ra,8(sp)
    1088:	4501                	li	a0,0
    108a:	0141                	addi	sp,sp,16
    108c:	8082                	ret

000000000000108e <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    108e:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1090:	4108                	lw	a0,0(a0)
{
    1092:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1094:	05a1                	addi	a1,a1,8
{
    1096:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    1098:	fe7ff0ef          	jal	ra,107e <main>
    109c:	51b000ef          	jal	ra,1db6 <exit>
	return 0;
}
    10a0:	60a2                	ld	ra,8(sp)
    10a2:	4501                	li	a0,0
    10a4:	0141                	addi	sp,sp,16
    10a6:	8082                	ret

00000000000010a8 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10a8:	7179                	addi	sp,sp,-48
    10aa:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ac:	12054e63          	bltz	a0,11e8 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10b0:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10b4:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10b6:	02b7f6bb          	remuw	a3,a5,a1
    10ba:	00001717          	auipc	a4,0x1
    10be:	fb670713          	addi	a4,a4,-74 # 2070 <digits>
    buf[16] = 0;
    10c2:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10c6:	1682                	slli	a3,a3,0x20
    10c8:	9281                	srli	a3,a3,0x20
    10ca:	96ba                	add	a3,a3,a4
    10cc:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    10d0:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    10d4:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10d8:	16b7e363          	bltu	a5,a1,123e <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    10dc:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    10e0:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    10e4:	1602                	slli	a2,a2,0x20
    10e6:	9201                	srli	a2,a2,0x20
    10e8:	963a                	add	a2,a2,a4
    10ea:	00064603          	lbu	a2,0(a2)
    10ee:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10f2:	0007861b          	sext.w	a2,a5
    10f6:	12b6e863          	bltu	a3,a1,1226 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    10fa:	02b7f6bb          	remuw	a3,a5,a1
    10fe:	1682                	slli	a3,a3,0x20
    1100:	9281                	srli	a3,a3,0x20
    1102:	96ba                	add	a3,a3,a4
    1104:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1108:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    110c:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1110:	10b66e63          	bltu	a2,a1,122c <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1114:	02b876bb          	remuw	a3,a6,a1
    1118:	1682                	slli	a3,a3,0x20
    111a:	9281                	srli	a3,a3,0x20
    111c:	96ba                	add	a3,a3,a4
    111e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1122:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1126:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    112a:	10b86463          	bltu	a6,a1,1232 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    112e:	02b676bb          	remuw	a3,a2,a1
    1132:	1682                	slli	a3,a3,0x20
    1134:	9281                	srli	a3,a3,0x20
    1136:	96ba                	add	a3,a3,a4
    1138:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    113c:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1140:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1144:	0eb66a63          	bltu	a2,a1,1238 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    1148:	02b876bb          	remuw	a3,a6,a1
    114c:	1682                	slli	a3,a3,0x20
    114e:	9281                	srli	a3,a3,0x20
    1150:	96ba                	add	a3,a3,a4
    1152:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1156:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    115a:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    115e:	0cb86163          	bltu	a6,a1,1220 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    1162:	02b676bb          	remuw	a3,a2,a1
    1166:	1682                	slli	a3,a3,0x20
    1168:	9281                	srli	a3,a3,0x20
    116a:	96ba                	add	a3,a3,a4
    116c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1170:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1174:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1178:	0cb66563          	bltu	a2,a1,1242 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    117c:	02b876bb          	remuw	a3,a6,a1
    1180:	1682                	slli	a3,a3,0x20
    1182:	9281                	srli	a3,a3,0x20
    1184:	96ba                	add	a3,a3,a4
    1186:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    118a:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    118e:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1192:	0ab86b63          	bltu	a6,a1,1248 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    1196:	02b676bb          	remuw	a3,a2,a1
    119a:	1682                	slli	a3,a3,0x20
    119c:	9281                	srli	a3,a3,0x20
    119e:	96ba                	add	a3,a3,a4
    11a0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a4:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11a8:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11ac:	0ab66163          	bltu	a2,a1,124e <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11b0:	1782                	slli	a5,a5,0x20
    11b2:	9381                	srli	a5,a5,0x20
    11b4:	97ba                	add	a5,a5,a4
    11b6:	0007c703          	lbu	a4,0(a5)
    11ba:	4599                	li	a1,6
    11bc:	4795                	li	a5,5
    11be:	00e10723          	sb	a4,14(sp)

    if (sign)
    11c2:	00055963          	bgez	a0,11d4 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11c6:	1018                	addi	a4,sp,32
    11c8:	973e                	add	a4,a4,a5
    11ca:	02d00693          	li	a3,45
    11ce:	fed70423          	sb	a3,-24(a4)
    11d2:	85be                	mv	a1,a5
    write(f, s, l);
    11d4:	003c                	addi	a5,sp,8
    11d6:	4641                	li	a2,16
    11d8:	9e0d                	subw	a2,a2,a1
    11da:	4505                	li	a0,1
    11dc:	95be                	add	a1,a1,a5
    11de:	387000ef          	jal	ra,1d64 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11e2:	70a2                	ld	ra,40(sp)
    11e4:	6145                	addi	sp,sp,48
    11e6:	8082                	ret
        x = -xx;
    11e8:	40a0063b          	negw	a2,a0
    11ec:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    11ee:	02b677bb          	remuw	a5,a2,a1
    11f2:	00001717          	auipc	a4,0x1
    11f6:	e7e70713          	addi	a4,a4,-386 # 2070 <digits>
    buf[16] = 0;
    11fa:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11fe:	1782                	slli	a5,a5,0x20
    1200:	9381                	srli	a5,a5,0x20
    1202:	97ba                	add	a5,a5,a4
    1204:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1208:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    120c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1210:	ecb676e3          	bleu	a1,a2,10dc <printint.constprop.0+0x34>
        buf[i--] = '-';
    1214:	02d00793          	li	a5,45
    1218:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    121c:	45b9                	li	a1,14
    121e:	bf5d                	j	11d4 <printint.constprop.0+0x12c>
    1220:	47a5                	li	a5,9
    1222:	45a9                	li	a1,10
    1224:	bf79                	j	11c2 <printint.constprop.0+0x11a>
    1226:	47b5                	li	a5,13
    1228:	45b9                	li	a1,14
    122a:	bf61                	j	11c2 <printint.constprop.0+0x11a>
    122c:	47b1                	li	a5,12
    122e:	45b5                	li	a1,13
    1230:	bf49                	j	11c2 <printint.constprop.0+0x11a>
    1232:	47ad                	li	a5,11
    1234:	45b1                	li	a1,12
    1236:	b771                	j	11c2 <printint.constprop.0+0x11a>
    1238:	47a9                	li	a5,10
    123a:	45ad                	li	a1,11
    123c:	b759                	j	11c2 <printint.constprop.0+0x11a>
    i = 15;
    123e:	45bd                	li	a1,15
    1240:	bf51                	j	11d4 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1242:	47a1                	li	a5,8
    1244:	45a5                	li	a1,9
    1246:	bfb5                	j	11c2 <printint.constprop.0+0x11a>
    1248:	479d                	li	a5,7
    124a:	45a1                	li	a1,8
    124c:	bf9d                	j	11c2 <printint.constprop.0+0x11a>
    124e:	4799                	li	a5,6
    1250:	459d                	li	a1,7
    1252:	bf85                	j	11c2 <printint.constprop.0+0x11a>

0000000000001254 <getchar>:
{
    1254:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1256:	00f10593          	addi	a1,sp,15
    125a:	4605                	li	a2,1
    125c:	4501                	li	a0,0
{
    125e:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1260:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1264:	2f7000ef          	jal	ra,1d5a <read>
}
    1268:	60e2                	ld	ra,24(sp)
    126a:	00f14503          	lbu	a0,15(sp)
    126e:	6105                	addi	sp,sp,32
    1270:	8082                	ret

0000000000001272 <putchar>:
{
    1272:	1101                	addi	sp,sp,-32
    char byte = c;
    1274:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    1278:	00f10593          	addi	a1,sp,15
    127c:	4605                	li	a2,1
    127e:	4505                	li	a0,1
{
    1280:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    1282:	2e3000ef          	jal	ra,1d64 <write>
}
    1286:	60e2                	ld	ra,24(sp)
    1288:	2501                	sext.w	a0,a0
    128a:	6105                	addi	sp,sp,32
    128c:	8082                	ret

000000000000128e <puts>:
{
    128e:	1141                	addi	sp,sp,-16
    1290:	e406                	sd	ra,8(sp)
    1292:	e022                	sd	s0,0(sp)
    1294:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    1296:	5b2000ef          	jal	ra,1848 <strlen>
    129a:	862a                	mv	a2,a0
    129c:	85a2                	mv	a1,s0
    129e:	4505                	li	a0,1
    12a0:	2c5000ef          	jal	ra,1d64 <write>
}
    12a4:	60a2                	ld	ra,8(sp)
    12a6:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12a8:	957d                	srai	a0,a0,0x3f
    return r;
    12aa:	2501                	sext.w	a0,a0
}
    12ac:	0141                	addi	sp,sp,16
    12ae:	8082                	ret

00000000000012b0 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12b0:	7131                	addi	sp,sp,-192
    12b2:	e0da                	sd	s6,64(sp)
    12b4:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12b6:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12b8:	013c                	addi	a5,sp,136
{
    12ba:	f0ca                	sd	s2,96(sp)
    12bc:	ecce                	sd	s3,88(sp)
    12be:	e8d2                	sd	s4,80(sp)
    12c0:	e4d6                	sd	s5,72(sp)
    12c2:	fc5e                	sd	s7,56(sp)
    12c4:	fc86                	sd	ra,120(sp)
    12c6:	f8a2                	sd	s0,112(sp)
    12c8:	f4a6                	sd	s1,104(sp)
    12ca:	89aa                	mv	s3,a0
    12cc:	e52e                	sd	a1,136(sp)
    12ce:	e932                	sd	a2,144(sp)
    12d0:	ed36                	sd	a3,152(sp)
    12d2:	f13a                	sd	a4,160(sp)
    12d4:	f942                	sd	a6,176(sp)
    12d6:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12d8:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12da:	02500913          	li	s2,37
    12de:	07000a93          	li	s5,112
    buf[i++] = '0';
    12e2:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12e6:	00001a17          	auipc	s4,0x1
    12ea:	d8aa0a13          	addi	s4,s4,-630 # 2070 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12ee:	00001b97          	auipc	s7,0x1
    12f2:	d52b8b93          	addi	s7,s7,-686 # 2040 <__clone+0xa2>
        if (!*s)
    12f6:	0009c783          	lbu	a5,0(s3)
    12fa:	cfb9                	beqz	a5,1358 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    12fc:	23278d63          	beq	a5,s2,1536 <printf+0x286>
    1300:	864e                	mv	a2,s3
    1302:	a019                	j	1308 <printf+0x58>
    1304:	07278563          	beq	a5,s2,136e <printf+0xbe>
    1308:	0605                	addi	a2,a2,1
    130a:	00064783          	lbu	a5,0(a2)
    130e:	fbfd                	bnez	a5,1304 <printf+0x54>
    1310:	84b2                	mv	s1,a2
        l = z - a;
    1312:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1316:	8622                	mv	a2,s0
    1318:	85ce                	mv	a1,s3
    131a:	4505                	li	a0,1
    131c:	249000ef          	jal	ra,1d64 <write>
        if (l)
    1320:	ec3d                	bnez	s0,139e <printf+0xee>
        if (s[1] == 0)
    1322:	0014c783          	lbu	a5,1(s1)
    1326:	cb8d                	beqz	a5,1358 <printf+0xa8>
        switch (s[1])
    1328:	09578b63          	beq	a5,s5,13be <printf+0x10e>
    132c:	06fafb63          	bleu	a5,s5,13a2 <printf+0xf2>
    1330:	07300713          	li	a4,115
    1334:	1ce78e63          	beq	a5,a4,1510 <printf+0x260>
    1338:	07800713          	li	a4,120
    133c:	1ae79563          	bne	a5,a4,14e6 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1340:	6782                	ld	a5,0(sp)
    1342:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1344:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    1348:	4388                	lw	a0,0(a5)
    134a:	07a1                	addi	a5,a5,8
    134c:	e03e                	sd	a5,0(sp)
    134e:	d5bff0ef          	jal	ra,10a8 <printint.constprop.0>
        if (!*s)
    1352:	0009c783          	lbu	a5,0(s3)
    1356:	f3dd                	bnez	a5,12fc <printf+0x4c>
    }
    va_end(ap);
}
    1358:	70e6                	ld	ra,120(sp)
    135a:	7446                	ld	s0,112(sp)
    135c:	74a6                	ld	s1,104(sp)
    135e:	7906                	ld	s2,96(sp)
    1360:	69e6                	ld	s3,88(sp)
    1362:	6a46                	ld	s4,80(sp)
    1364:	6aa6                	ld	s5,72(sp)
    1366:	6b06                	ld	s6,64(sp)
    1368:	7be2                	ld	s7,56(sp)
    136a:	6129                	addi	sp,sp,192
    136c:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    136e:	00164783          	lbu	a5,1(a2)
    1372:	84b2                	mv	s1,a2
    1374:	01278763          	beq	a5,s2,1382 <printf+0xd2>
    1378:	bf69                	j	1312 <printf+0x62>
    137a:	0014c783          	lbu	a5,1(s1)
    137e:	f9279ae3          	bne	a5,s2,1312 <printf+0x62>
    1382:	0489                	addi	s1,s1,2
    1384:	0004c783          	lbu	a5,0(s1)
    1388:	0605                	addi	a2,a2,1
    138a:	ff2788e3          	beq	a5,s2,137a <printf+0xca>
        l = z - a;
    138e:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1392:	8622                	mv	a2,s0
    1394:	85ce                	mv	a1,s3
    1396:	4505                	li	a0,1
    1398:	1cd000ef          	jal	ra,1d64 <write>
        if (l)
    139c:	d059                	beqz	s0,1322 <printf+0x72>
    139e:	89a6                	mv	s3,s1
    13a0:	bf99                	j	12f6 <printf+0x46>
    13a2:	06400713          	li	a4,100
    13a6:	14e79063          	bne	a5,a4,14e6 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13aa:	6782                	ld	a5,0(sp)
    13ac:	45a9                	li	a1,10
        s += 2;
    13ae:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13b2:	4388                	lw	a0,0(a5)
    13b4:	07a1                	addi	a5,a5,8
    13b6:	e03e                	sd	a5,0(sp)
    13b8:	cf1ff0ef          	jal	ra,10a8 <printint.constprop.0>
        s += 2;
    13bc:	bf59                	j	1352 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13be:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13c0:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13c4:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13c6:	631c                	ld	a5,0(a4)
    13c8:	0721                	addi	a4,a4,8
    13ca:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13cc:	00479293          	slli	t0,a5,0x4
    13d0:	00879f93          	slli	t6,a5,0x8
    13d4:	00c79f13          	slli	t5,a5,0xc
    13d8:	01079e93          	slli	t4,a5,0x10
    13dc:	01479e13          	slli	t3,a5,0x14
    13e0:	01879313          	slli	t1,a5,0x18
    13e4:	01c79893          	slli	a7,a5,0x1c
    13e8:	02479813          	slli	a6,a5,0x24
    13ec:	02879513          	slli	a0,a5,0x28
    13f0:	02c79593          	slli	a1,a5,0x2c
    13f4:	03079693          	slli	a3,a5,0x30
    13f8:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13fc:	03c7d413          	srli	s0,a5,0x3c
    1400:	01c7d39b          	srliw	t2,a5,0x1c
    1404:	03c2d293          	srli	t0,t0,0x3c
    1408:	03cfdf93          	srli	t6,t6,0x3c
    140c:	03cf5f13          	srli	t5,t5,0x3c
    1410:	03cede93          	srli	t4,t4,0x3c
    1414:	03ce5e13          	srli	t3,t3,0x3c
    1418:	03c35313          	srli	t1,t1,0x3c
    141c:	03c8d893          	srli	a7,a7,0x3c
    1420:	03c85813          	srli	a6,a6,0x3c
    1424:	9171                	srli	a0,a0,0x3c
    1426:	91f1                	srli	a1,a1,0x3c
    1428:	92f1                	srli	a3,a3,0x3c
    142a:	9371                	srli	a4,a4,0x3c
    142c:	96d2                	add	a3,a3,s4
    142e:	9752                	add	a4,a4,s4
    1430:	9452                	add	s0,s0,s4
    1432:	92d2                	add	t0,t0,s4
    1434:	9fd2                	add	t6,t6,s4
    1436:	9f52                	add	t5,t5,s4
    1438:	9ed2                	add	t4,t4,s4
    143a:	9e52                	add	t3,t3,s4
    143c:	9352                	add	t1,t1,s4
    143e:	98d2                	add	a7,a7,s4
    1440:	93d2                	add	t2,t2,s4
    1442:	9852                	add	a6,a6,s4
    1444:	9552                	add	a0,a0,s4
    1446:	95d2                	add	a1,a1,s4
    1448:	0006c983          	lbu	s3,0(a3)
    144c:	0002c283          	lbu	t0,0(t0)
    1450:	00074683          	lbu	a3,0(a4)
    1454:	000fcf83          	lbu	t6,0(t6)
    1458:	000f4f03          	lbu	t5,0(t5)
    145c:	000ece83          	lbu	t4,0(t4)
    1460:	000e4e03          	lbu	t3,0(t3)
    1464:	00034303          	lbu	t1,0(t1)
    1468:	0008c883          	lbu	a7,0(a7)
    146c:	0003c383          	lbu	t2,0(t2)
    1470:	00084803          	lbu	a6,0(a6)
    1474:	00054503          	lbu	a0,0(a0)
    1478:	0005c583          	lbu	a1,0(a1)
    147c:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1480:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1484:	9371                	srli	a4,a4,0x3c
    1486:	8bbd                	andi	a5,a5,15
    1488:	9752                	add	a4,a4,s4
    148a:	97d2                	add	a5,a5,s4
    148c:	005105a3          	sb	t0,11(sp)
    1490:	01f10623          	sb	t6,12(sp)
    1494:	01e106a3          	sb	t5,13(sp)
    1498:	01d10723          	sb	t4,14(sp)
    149c:	01c107a3          	sb	t3,15(sp)
    14a0:	00610823          	sb	t1,16(sp)
    14a4:	011108a3          	sb	a7,17(sp)
    14a8:	00710923          	sb	t2,18(sp)
    14ac:	010109a3          	sb	a6,19(sp)
    14b0:	00a10a23          	sb	a0,20(sp)
    14b4:	00b10aa3          	sb	a1,21(sp)
    14b8:	01310b23          	sb	s3,22(sp)
    14bc:	00d10ba3          	sb	a3,23(sp)
    14c0:	00810523          	sb	s0,10(sp)
    14c4:	00074703          	lbu	a4,0(a4)
    14c8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14cc:	002c                	addi	a1,sp,8
    14ce:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14d0:	00e10c23          	sb	a4,24(sp)
    14d4:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14d8:	00010d23          	sb	zero,26(sp)
        s += 2;
    14dc:	00248993          	addi	s3,s1,2
    write(f, s, l);
    14e0:	085000ef          	jal	ra,1d64 <write>
        s += 2;
    14e4:	b5bd                	j	1352 <printf+0xa2>
    char byte = c;
    14e6:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    14ea:	4605                	li	a2,1
    14ec:	002c                	addi	a1,sp,8
    14ee:	4505                	li	a0,1
    char byte = c;
    14f0:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    14f4:	071000ef          	jal	ra,1d64 <write>
    char byte = c;
    14f8:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    14fc:	4605                	li	a2,1
    14fe:	002c                	addi	a1,sp,8
    1500:	4505                	li	a0,1
    char byte = c;
    1502:	00f10423          	sb	a5,8(sp)
        s += 2;
    1506:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    150a:	05b000ef          	jal	ra,1d64 <write>
        s += 2;
    150e:	b591                	j	1352 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1510:	6782                	ld	a5,0(sp)
    1512:	6380                	ld	s0,0(a5)
    1514:	07a1                	addi	a5,a5,8
    1516:	e03e                	sd	a5,0(sp)
    1518:	cc05                	beqz	s0,1550 <printf+0x2a0>
            l = strnlen(a, 200);
    151a:	0c800593          	li	a1,200
    151e:	8522                	mv	a0,s0
    1520:	45a000ef          	jal	ra,197a <strnlen>
    write(f, s, l);
    1524:	0005061b          	sext.w	a2,a0
    1528:	85a2                	mv	a1,s0
    152a:	4505                	li	a0,1
    152c:	039000ef          	jal	ra,1d64 <write>
        s += 2;
    1530:	00248993          	addi	s3,s1,2
    1534:	bd39                	j	1352 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1536:	0019c783          	lbu	a5,1(s3)
    153a:	84ce                	mv	s1,s3
    153c:	864e                	mv	a2,s3
    153e:	e52782e3          	beq	a5,s2,1382 <printf+0xd2>
    write(f, s, l);
    1542:	4601                	li	a2,0
    1544:	85ce                	mv	a1,s3
    1546:	4505                	li	a0,1
    1548:	01d000ef          	jal	ra,1d64 <write>
    154c:	84ce                	mv	s1,s3
    154e:	bbd1                	j	1322 <printf+0x72>
                a = "(null)";
    1550:	845e                	mv	s0,s7
    1552:	b7e1                	j	151a <printf+0x26a>

0000000000001554 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1554:	1141                	addi	sp,sp,-16
    1556:	e406                	sd	ra,8(sp)
    puts(m);
    1558:	d37ff0ef          	jal	ra,128e <puts>
    exit(-100);
}
    155c:	60a2                	ld	ra,8(sp)
    exit(-100);
    155e:	f9c00513          	li	a0,-100
}
    1562:	0141                	addi	sp,sp,16
    exit(-100);
    1564:	0530006f          	j	1db6 <exit>

0000000000001568 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1568:	02000793          	li	a5,32
    156c:	00f50663          	beq	a0,a5,1578 <isspace+0x10>
    1570:	355d                	addiw	a0,a0,-9
    1572:	00553513          	sltiu	a0,a0,5
    1576:	8082                	ret
    1578:	4505                	li	a0,1
}
    157a:	8082                	ret

000000000000157c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    157c:	fd05051b          	addiw	a0,a0,-48
}
    1580:	00a53513          	sltiu	a0,a0,10
    1584:	8082                	ret

0000000000001586 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1586:	02000613          	li	a2,32
    158a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    158c:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1590:	0007079b          	sext.w	a5,a4
    1594:	ff77869b          	addiw	a3,a5,-9
    1598:	04c70b63          	beq	a4,a2,15ee <atoi+0x68>
    159c:	04d5f963          	bleu	a3,a1,15ee <atoi+0x68>
        s++;
    switch (*s)
    15a0:	02b00693          	li	a3,43
    15a4:	04d70a63          	beq	a4,a3,15f8 <atoi+0x72>
    15a8:	02d00693          	li	a3,45
    15ac:	06d70463          	beq	a4,a3,1614 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15b0:	fd07859b          	addiw	a1,a5,-48
    15b4:	4625                	li	a2,9
    15b6:	873e                	mv	a4,a5
    15b8:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15ba:	4e01                	li	t3,0
    while (isdigit(*s))
    15bc:	04b66a63          	bltu	a2,a1,1610 <atoi+0x8a>
    int n = 0, neg = 0;
    15c0:	4501                	li	a0,0
    while (isdigit(*s))
    15c2:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15c4:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15c6:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15ca:	0025179b          	slliw	a5,a0,0x2
    15ce:	9d3d                	addw	a0,a0,a5
    15d0:	fd07031b          	addiw	t1,a4,-48
    15d4:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15d8:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15dc:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15e0:	0006071b          	sext.w	a4,a2
    15e4:	feb870e3          	bleu	a1,a6,15c4 <atoi+0x3e>
    return neg ? n : -n;
    15e8:	000e0563          	beqz	t3,15f2 <atoi+0x6c>
}
    15ec:	8082                	ret
        s++;
    15ee:	0505                	addi	a0,a0,1
    15f0:	bf71                	j	158c <atoi+0x6>
    15f2:	4113053b          	subw	a0,t1,a7
    15f6:	8082                	ret
    while (isdigit(*s))
    15f8:	00154783          	lbu	a5,1(a0)
    15fc:	4625                	li	a2,9
        s++;
    15fe:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1602:	fd07859b          	addiw	a1,a5,-48
    1606:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    160a:	4e01                	li	t3,0
    while (isdigit(*s))
    160c:	fab67ae3          	bleu	a1,a2,15c0 <atoi+0x3a>
    1610:	4501                	li	a0,0
}
    1612:	8082                	ret
    while (isdigit(*s))
    1614:	00154783          	lbu	a5,1(a0)
    1618:	4625                	li	a2,9
        s++;
    161a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    161e:	fd07859b          	addiw	a1,a5,-48
    1622:	0007871b          	sext.w	a4,a5
    1626:	feb665e3          	bltu	a2,a1,1610 <atoi+0x8a>
        neg = 1;
    162a:	4e05                	li	t3,1
    162c:	bf51                	j	15c0 <atoi+0x3a>

000000000000162e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    162e:	16060d63          	beqz	a2,17a8 <memset+0x17a>
    1632:	40a007b3          	neg	a5,a0
    1636:	8b9d                	andi	a5,a5,7
    1638:	00778713          	addi	a4,a5,7
    163c:	482d                	li	a6,11
    163e:	0ff5f593          	andi	a1,a1,255
    1642:	fff60693          	addi	a3,a2,-1
    1646:	17076263          	bltu	a4,a6,17aa <memset+0x17c>
    164a:	16e6ea63          	bltu	a3,a4,17be <memset+0x190>
    164e:	16078563          	beqz	a5,17b8 <memset+0x18a>
    1652:	00b50023          	sb	a1,0(a0)
    1656:	4705                	li	a4,1
    1658:	00150e93          	addi	t4,a0,1
    165c:	14e78c63          	beq	a5,a4,17b4 <memset+0x186>
    1660:	00b500a3          	sb	a1,1(a0)
    1664:	4709                	li	a4,2
    1666:	00250e93          	addi	t4,a0,2
    166a:	14e78d63          	beq	a5,a4,17c4 <memset+0x196>
    166e:	00b50123          	sb	a1,2(a0)
    1672:	470d                	li	a4,3
    1674:	00350e93          	addi	t4,a0,3
    1678:	12e78b63          	beq	a5,a4,17ae <memset+0x180>
    167c:	00b501a3          	sb	a1,3(a0)
    1680:	4711                	li	a4,4
    1682:	00450e93          	addi	t4,a0,4
    1686:	14e78163          	beq	a5,a4,17c8 <memset+0x19a>
    168a:	00b50223          	sb	a1,4(a0)
    168e:	4715                	li	a4,5
    1690:	00550e93          	addi	t4,a0,5
    1694:	12e78c63          	beq	a5,a4,17cc <memset+0x19e>
    1698:	00b502a3          	sb	a1,5(a0)
    169c:	471d                	li	a4,7
    169e:	00650e93          	addi	t4,a0,6
    16a2:	12e79763          	bne	a5,a4,17d0 <memset+0x1a2>
    16a6:	00750e93          	addi	t4,a0,7
    16aa:	00b50323          	sb	a1,6(a0)
    16ae:	4f1d                	li	t5,7
    16b0:	00859713          	slli	a4,a1,0x8
    16b4:	8f4d                	or	a4,a4,a1
    16b6:	01059e13          	slli	t3,a1,0x10
    16ba:	01c76e33          	or	t3,a4,t3
    16be:	01859313          	slli	t1,a1,0x18
    16c2:	006e6333          	or	t1,t3,t1
    16c6:	02059893          	slli	a7,a1,0x20
    16ca:	011368b3          	or	a7,t1,a7
    16ce:	02859813          	slli	a6,a1,0x28
    16d2:	40f60333          	sub	t1,a2,a5
    16d6:	0108e833          	or	a6,a7,a6
    16da:	03059693          	slli	a3,a1,0x30
    16de:	00d866b3          	or	a3,a6,a3
    16e2:	03859713          	slli	a4,a1,0x38
    16e6:	97aa                	add	a5,a5,a0
    16e8:	ff837813          	andi	a6,t1,-8
    16ec:	8f55                	or	a4,a4,a3
    16ee:	00f806b3          	add	a3,a6,a5
    16f2:	e398                	sd	a4,0(a5)
    16f4:	07a1                	addi	a5,a5,8
    16f6:	fed79ee3          	bne	a5,a3,16f2 <memset+0xc4>
    16fa:	ff837693          	andi	a3,t1,-8
    16fe:	00de87b3          	add	a5,t4,a3
    1702:	01e6873b          	addw	a4,a3,t5
    1706:	0ad30663          	beq	t1,a3,17b2 <memset+0x184>
    170a:	00b78023          	sb	a1,0(a5)
    170e:	0017069b          	addiw	a3,a4,1
    1712:	08c6fb63          	bleu	a2,a3,17a8 <memset+0x17a>
    1716:	00b780a3          	sb	a1,1(a5)
    171a:	0027069b          	addiw	a3,a4,2
    171e:	08c6f563          	bleu	a2,a3,17a8 <memset+0x17a>
    1722:	00b78123          	sb	a1,2(a5)
    1726:	0037069b          	addiw	a3,a4,3
    172a:	06c6ff63          	bleu	a2,a3,17a8 <memset+0x17a>
    172e:	00b781a3          	sb	a1,3(a5)
    1732:	0047069b          	addiw	a3,a4,4
    1736:	06c6f963          	bleu	a2,a3,17a8 <memset+0x17a>
    173a:	00b78223          	sb	a1,4(a5)
    173e:	0057069b          	addiw	a3,a4,5
    1742:	06c6f363          	bleu	a2,a3,17a8 <memset+0x17a>
    1746:	00b782a3          	sb	a1,5(a5)
    174a:	0067069b          	addiw	a3,a4,6
    174e:	04c6fd63          	bleu	a2,a3,17a8 <memset+0x17a>
    1752:	00b78323          	sb	a1,6(a5)
    1756:	0077069b          	addiw	a3,a4,7
    175a:	04c6f763          	bleu	a2,a3,17a8 <memset+0x17a>
    175e:	00b783a3          	sb	a1,7(a5)
    1762:	0087069b          	addiw	a3,a4,8
    1766:	04c6f163          	bleu	a2,a3,17a8 <memset+0x17a>
    176a:	00b78423          	sb	a1,8(a5)
    176e:	0097069b          	addiw	a3,a4,9
    1772:	02c6fb63          	bleu	a2,a3,17a8 <memset+0x17a>
    1776:	00b784a3          	sb	a1,9(a5)
    177a:	00a7069b          	addiw	a3,a4,10
    177e:	02c6f563          	bleu	a2,a3,17a8 <memset+0x17a>
    1782:	00b78523          	sb	a1,10(a5)
    1786:	00b7069b          	addiw	a3,a4,11
    178a:	00c6ff63          	bleu	a2,a3,17a8 <memset+0x17a>
    178e:	00b785a3          	sb	a1,11(a5)
    1792:	00c7069b          	addiw	a3,a4,12
    1796:	00c6f963          	bleu	a2,a3,17a8 <memset+0x17a>
    179a:	00b78623          	sb	a1,12(a5)
    179e:	2735                	addiw	a4,a4,13
    17a0:	00c77463          	bleu	a2,a4,17a8 <memset+0x17a>
    17a4:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17a8:	8082                	ret
    17aa:	472d                	li	a4,11
    17ac:	bd79                	j	164a <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ae:	4f0d                	li	t5,3
    17b0:	b701                	j	16b0 <memset+0x82>
    17b2:	8082                	ret
    17b4:	4f05                	li	t5,1
    17b6:	bded                	j	16b0 <memset+0x82>
    17b8:	8eaa                	mv	t4,a0
    17ba:	4f01                	li	t5,0
    17bc:	bdd5                	j	16b0 <memset+0x82>
    17be:	87aa                	mv	a5,a0
    17c0:	4701                	li	a4,0
    17c2:	b7a1                	j	170a <memset+0xdc>
    17c4:	4f09                	li	t5,2
    17c6:	b5ed                	j	16b0 <memset+0x82>
    17c8:	4f11                	li	t5,4
    17ca:	b5dd                	j	16b0 <memset+0x82>
    17cc:	4f15                	li	t5,5
    17ce:	b5cd                	j	16b0 <memset+0x82>
    17d0:	4f19                	li	t5,6
    17d2:	bdf9                	j	16b0 <memset+0x82>

00000000000017d4 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17d4:	00054703          	lbu	a4,0(a0)
    17d8:	0005c783          	lbu	a5,0(a1)
    17dc:	00e79b63          	bne	a5,a4,17f2 <strcmp+0x1e>
    17e0:	cf89                	beqz	a5,17fa <strcmp+0x26>
    17e2:	0505                	addi	a0,a0,1
    17e4:	0585                	addi	a1,a1,1
    17e6:	0005c783          	lbu	a5,0(a1)
    17ea:	00054703          	lbu	a4,0(a0)
    17ee:	fef709e3          	beq	a4,a5,17e0 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    17f2:	0007051b          	sext.w	a0,a4
}
    17f6:	9d1d                	subw	a0,a0,a5
    17f8:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    17fa:	4501                	li	a0,0
}
    17fc:	9d1d                	subw	a0,a0,a5
    17fe:	8082                	ret

0000000000001800 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1800:	c231                	beqz	a2,1844 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1802:	00054783          	lbu	a5,0(a0)
    1806:	0005c683          	lbu	a3,0(a1)
    180a:	c795                	beqz	a5,1836 <strncmp+0x36>
    180c:	ca85                	beqz	a3,183c <strncmp+0x3c>
    if (!n--)
    180e:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1810:	c615                	beqz	a2,183c <strncmp+0x3c>
    1812:	00150713          	addi	a4,a0,1
    1816:	9532                	add	a0,a0,a2
    1818:	00d78963          	beq	a5,a3,182a <strncmp+0x2a>
    181c:	a005                	j	183c <strncmp+0x3c>
    181e:	ce99                	beqz	a3,183c <strncmp+0x3c>
    1820:	00e50e63          	beq	a0,a4,183c <strncmp+0x3c>
    1824:	0705                	addi	a4,a4,1
    1826:	00d79b63          	bne	a5,a3,183c <strncmp+0x3c>
    182a:	00074783          	lbu	a5,0(a4)
    182e:	0585                	addi	a1,a1,1
    1830:	0005c683          	lbu	a3,0(a1)
    1834:	f7ed                	bnez	a5,181e <strncmp+0x1e>
    1836:	4501                	li	a0,0
        ;
    return *l - *r;
    1838:	9d15                	subw	a0,a0,a3
    183a:	8082                	ret
    183c:	0007851b          	sext.w	a0,a5
    1840:	9d15                	subw	a0,a0,a3
    1842:	8082                	ret
        return 0;
    1844:	4501                	li	a0,0
}
    1846:	8082                	ret

0000000000001848 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1848:	00757793          	andi	a5,a0,7
    184c:	cfa1                	beqz	a5,18a4 <strlen+0x5c>
        if (!*s)
    184e:	00054783          	lbu	a5,0(a0)
    1852:	cbb9                	beqz	a5,18a8 <strlen+0x60>
    1854:	87aa                	mv	a5,a0
    1856:	a021                	j	185e <strlen+0x16>
    1858:	0007c703          	lbu	a4,0(a5)
    185c:	c329                	beqz	a4,189e <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    185e:	0785                	addi	a5,a5,1
    1860:	0077f713          	andi	a4,a5,7
    1864:	fb75                	bnez	a4,1858 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    1866:	00000717          	auipc	a4,0x0
    186a:	7e270713          	addi	a4,a4,2018 # 2048 <__clone+0xaa>
    186e:	630c                	ld	a1,0(a4)
    1870:	00000717          	auipc	a4,0x0
    1874:	7e070713          	addi	a4,a4,2016 # 2050 <__clone+0xb2>
    1878:	6394                	ld	a3,0(a5)
    187a:	6310                	ld	a2,0(a4)
    187c:	a019                	j	1882 <strlen+0x3a>
    187e:	07a1                	addi	a5,a5,8
    1880:	6394                	ld	a3,0(a5)
    1882:	00b68733          	add	a4,a3,a1
    1886:	fff6c693          	not	a3,a3
    188a:	8f75                	and	a4,a4,a3
    188c:	8f71                	and	a4,a4,a2
    188e:	db65                	beqz	a4,187e <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    1890:	0007c703          	lbu	a4,0(a5)
    1894:	c709                	beqz	a4,189e <strlen+0x56>
    1896:	0785                	addi	a5,a5,1
    1898:	0007c703          	lbu	a4,0(a5)
    189c:	ff6d                	bnez	a4,1896 <strlen+0x4e>
        ;
    return s - a;
    189e:	40a78533          	sub	a0,a5,a0
}
    18a2:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18a4:	87aa                	mv	a5,a0
    18a6:	b7c1                	j	1866 <strlen+0x1e>
        if (!*s)
    18a8:	4501                	li	a0,0
            return s - a;
    18aa:	8082                	ret

00000000000018ac <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18ac:	00757793          	andi	a5,a0,7
    18b0:	0ff5f593          	andi	a1,a1,255
    18b4:	cb99                	beqz	a5,18ca <memchr+0x1e>
    18b6:	c655                	beqz	a2,1962 <memchr+0xb6>
    18b8:	00054783          	lbu	a5,0(a0)
    18bc:	0ab78663          	beq	a5,a1,1968 <memchr+0xbc>
    18c0:	0505                	addi	a0,a0,1
    18c2:	00757793          	andi	a5,a0,7
    18c6:	167d                	addi	a2,a2,-1
    18c8:	f7fd                	bnez	a5,18b6 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18ca:	4701                	li	a4,0
    if (n && *s != c)
    18cc:	ca49                	beqz	a2,195e <memchr+0xb2>
    18ce:	00054783          	lbu	a5,0(a0)
    18d2:	08b78b63          	beq	a5,a1,1968 <memchr+0xbc>
        size_t k = ONES * c;
    18d6:	00000797          	auipc	a5,0x0
    18da:	78278793          	addi	a5,a5,1922 # 2058 <__clone+0xba>
    18de:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18e0:	479d                	li	a5,7
        size_t k = ONES * c;
    18e2:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18e6:	08c7f863          	bleu	a2,a5,1976 <memchr+0xca>
    18ea:	611c                	ld	a5,0(a0)
    18ec:	00000317          	auipc	t1,0x0
    18f0:	76430313          	addi	t1,t1,1892 # 2050 <__clone+0xb2>
    18f4:	00033803          	ld	a6,0(t1)
    18f8:	00f8c7b3          	xor	a5,a7,a5
    18fc:	fff7c713          	not	a4,a5
    1900:	8f95                	sub	a5,a5,a3
    1902:	8ff9                	and	a5,a5,a4
    1904:	0107f7b3          	and	a5,a5,a6
    1908:	e7bd                	bnez	a5,1976 <memchr+0xca>
    190a:	4e1d                	li	t3,7
    190c:	00000e97          	auipc	t4,0x0
    1910:	73ce8e93          	addi	t4,t4,1852 # 2048 <__clone+0xaa>
    1914:	a005                	j	1934 <memchr+0x88>
    1916:	6514                	ld	a3,8(a0)
    1918:	000eb783          	ld	a5,0(t4)
    191c:	00033803          	ld	a6,0(t1)
    1920:	00d8c6b3          	xor	a3,a7,a3
    1924:	97b6                	add	a5,a5,a3
    1926:	fff6c693          	not	a3,a3
    192a:	8ff5                	and	a5,a5,a3
    192c:	0107f7b3          	and	a5,a5,a6
    1930:	e3a1                	bnez	a5,1970 <memchr+0xc4>
    1932:	853a                	mv	a0,a4
    1934:	1661                	addi	a2,a2,-8
    1936:	00850713          	addi	a4,a0,8
    193a:	fcce6ee3          	bltu	t3,a2,1916 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    193e:	c215                	beqz	a2,1962 <memchr+0xb6>
    1940:	00074783          	lbu	a5,0(a4)
    1944:	00f58d63          	beq	a1,a5,195e <memchr+0xb2>
    1948:	00170793          	addi	a5,a4,1
    194c:	963a                	add	a2,a2,a4
    194e:	873e                	mv	a4,a5
    1950:	00f60963          	beq	a2,a5,1962 <memchr+0xb6>
    1954:	0007c683          	lbu	a3,0(a5)
    1958:	0785                	addi	a5,a5,1
    195a:	feb69ae3          	bne	a3,a1,194e <memchr+0xa2>
}
    195e:	853a                	mv	a0,a4
    1960:	8082                	ret
    return n ? (void *)s : 0;
    1962:	4701                	li	a4,0
}
    1964:	853a                	mv	a0,a4
    1966:	8082                	ret
    1968:	872a                	mv	a4,a0
    196a:	00074783          	lbu	a5,0(a4)
    196e:	bfd9                	j	1944 <memchr+0x98>
    1970:	00854783          	lbu	a5,8(a0)
    1974:	bfc1                	j	1944 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1976:	872a                	mv	a4,a0
    1978:	bfc1                	j	1948 <memchr+0x9c>

000000000000197a <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    197a:	00757793          	andi	a5,a0,7
    197e:	cfc5                	beqz	a5,1a36 <strnlen+0xbc>
    1980:	c1c5                	beqz	a1,1a20 <strnlen+0xa6>
    1982:	00054783          	lbu	a5,0(a0)
    1986:	cfd9                	beqz	a5,1a24 <strnlen+0xaa>
    1988:	87ae                	mv	a5,a1
    198a:	86aa                	mv	a3,a0
    198c:	a029                	j	1996 <strnlen+0x1c>
    198e:	cbc9                	beqz	a5,1a20 <strnlen+0xa6>
    1990:	0006c703          	lbu	a4,0(a3)
    1994:	cb51                	beqz	a4,1a28 <strnlen+0xae>
    1996:	0685                	addi	a3,a3,1
    1998:	0076f713          	andi	a4,a3,7
    199c:	17fd                	addi	a5,a5,-1
    199e:	fb65                	bnez	a4,198e <strnlen+0x14>
    if (n && *s != c)
    19a0:	c3c1                	beqz	a5,1a20 <strnlen+0xa6>
    19a2:	0006c703          	lbu	a4,0(a3)
    19a6:	c349                	beqz	a4,1a28 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19a8:	471d                	li	a4,7
    19aa:	08f77a63          	bleu	a5,a4,1a3e <strnlen+0xc4>
    19ae:	00000e17          	auipc	t3,0x0
    19b2:	69ae0e13          	addi	t3,t3,1690 # 2048 <__clone+0xaa>
    19b6:	6290                	ld	a2,0(a3)
    19b8:	000e3703          	ld	a4,0(t3)
    19bc:	00000e97          	auipc	t4,0x0
    19c0:	694e8e93          	addi	t4,t4,1684 # 2050 <__clone+0xb2>
    19c4:	000eb803          	ld	a6,0(t4)
    19c8:	9732                	add	a4,a4,a2
    19ca:	fff64613          	not	a2,a2
    19ce:	8f71                	and	a4,a4,a2
    19d0:	01077733          	and	a4,a4,a6
    19d4:	e72d                	bnez	a4,1a3e <strnlen+0xc4>
    19d6:	4f1d                	li	t5,7
    19d8:	a839                	j	19f6 <strnlen+0x7c>
    19da:	6698                	ld	a4,8(a3)
    19dc:	000e3303          	ld	t1,0(t3)
    19e0:	000eb803          	ld	a6,0(t4)
    19e4:	fff74893          	not	a7,a4
    19e8:	971a                	add	a4,a4,t1
    19ea:	01177733          	and	a4,a4,a7
    19ee:	01077733          	and	a4,a4,a6
    19f2:	ef1d                	bnez	a4,1a30 <strnlen+0xb6>
    19f4:	86b2                	mv	a3,a2
    19f6:	17e1                	addi	a5,a5,-8
    19f8:	00868613          	addi	a2,a3,8
    19fc:	fcff6fe3          	bltu	t5,a5,19da <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a00:	c385                	beqz	a5,1a20 <strnlen+0xa6>
    1a02:	00064703          	lbu	a4,0(a2)
    1a06:	cb19                	beqz	a4,1a1c <strnlen+0xa2>
    1a08:	00160713          	addi	a4,a2,1
    1a0c:	97b2                	add	a5,a5,a2
    1a0e:	863a                	mv	a2,a4
    1a10:	00e78863          	beq	a5,a4,1a20 <strnlen+0xa6>
    1a14:	0705                	addi	a4,a4,1
    1a16:	fff74683          	lbu	a3,-1(a4)
    1a1a:	faf5                	bnez	a3,1a0e <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a1c:	40a605b3          	sub	a1,a2,a0
}
    1a20:	852e                	mv	a0,a1
    1a22:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a24:	87ae                	mv	a5,a1
    1a26:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a28:	8636                	mv	a2,a3
    1a2a:	00064703          	lbu	a4,0(a2)
    1a2e:	bfe1                	j	1a06 <strnlen+0x8c>
    1a30:	0086c703          	lbu	a4,8(a3)
    1a34:	bfc9                	j	1a06 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a36:	87ae                	mv	a5,a1
    1a38:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a3a:	f7a5                	bnez	a5,19a2 <strnlen+0x28>
    1a3c:	b7d5                	j	1a20 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a3e:	8636                	mv	a2,a3
    1a40:	b7e1                	j	1a08 <strnlen+0x8e>

0000000000001a42 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a42:	00b547b3          	xor	a5,a0,a1
    1a46:	8b9d                	andi	a5,a5,7
    1a48:	efa9                	bnez	a5,1aa2 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a4a:	0075f793          	andi	a5,a1,7
    1a4e:	c38d                	beqz	a5,1a70 <strcpy+0x2e>
            if (!(*d = *s))
    1a50:	0005c783          	lbu	a5,0(a1)
    1a54:	00f50023          	sb	a5,0(a0)
    1a58:	e799                	bnez	a5,1a66 <strcpy+0x24>
    1a5a:	a095                	j	1abe <strcpy+0x7c>
    1a5c:	0005c783          	lbu	a5,0(a1)
    1a60:	00f50023          	sb	a5,0(a0)
    1a64:	cbb9                	beqz	a5,1aba <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a66:	0585                	addi	a1,a1,1
    1a68:	0075f793          	andi	a5,a1,7
    1a6c:	0505                	addi	a0,a0,1
    1a6e:	f7fd                	bnez	a5,1a5c <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a70:	00000797          	auipc	a5,0x0
    1a74:	5d878793          	addi	a5,a5,1496 # 2048 <__clone+0xaa>
    1a78:	0007b803          	ld	a6,0(a5)
    1a7c:	00000797          	auipc	a5,0x0
    1a80:	5d478793          	addi	a5,a5,1492 # 2050 <__clone+0xb2>
    1a84:	6198                	ld	a4,0(a1)
    1a86:	6390                	ld	a2,0(a5)
    1a88:	a031                	j	1a94 <strcpy+0x52>
    1a8a:	0521                	addi	a0,a0,8
    1a8c:	05a1                	addi	a1,a1,8
    1a8e:	fee53c23          	sd	a4,-8(a0)
    1a92:	6198                	ld	a4,0(a1)
    1a94:	010707b3          	add	a5,a4,a6
    1a98:	fff74693          	not	a3,a4
    1a9c:	8ff5                	and	a5,a5,a3
    1a9e:	8ff1                	and	a5,a5,a2
    1aa0:	d7ed                	beqz	a5,1a8a <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1aa2:	0005c783          	lbu	a5,0(a1)
    1aa6:	00f50023          	sb	a5,0(a0)
    1aaa:	cb89                	beqz	a5,1abc <strcpy+0x7a>
    1aac:	0585                	addi	a1,a1,1
    1aae:	0005c783          	lbu	a5,0(a1)
    1ab2:	0505                	addi	a0,a0,1
    1ab4:	00f50023          	sb	a5,0(a0)
    1ab8:	fbf5                	bnez	a5,1aac <strcpy+0x6a>
        ;
    return d;
}
    1aba:	8082                	ret
    1abc:	8082                	ret
    1abe:	8082                	ret

0000000000001ac0 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ac0:	00b547b3          	xor	a5,a0,a1
    1ac4:	8b9d                	andi	a5,a5,7
    1ac6:	ebc1                	bnez	a5,1b56 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ac8:	0075f793          	andi	a5,a1,7
    1acc:	cf91                	beqz	a5,1ae8 <strncpy+0x28>
    1ace:	20060e63          	beqz	a2,1cea <strncpy+0x22a>
    1ad2:	0005c783          	lbu	a5,0(a1)
    1ad6:	00f50023          	sb	a5,0(a0)
    1ada:	c3d5                	beqz	a5,1b7e <strncpy+0xbe>
    1adc:	0585                	addi	a1,a1,1
    1ade:	0075f793          	andi	a5,a1,7
    1ae2:	167d                	addi	a2,a2,-1
    1ae4:	0505                	addi	a0,a0,1
    1ae6:	f7e5                	bnez	a5,1ace <strncpy+0xe>
            ;
        if (!n || !*s)
    1ae8:	20060163          	beqz	a2,1cea <strncpy+0x22a>
    1aec:	0005c683          	lbu	a3,0(a1)
    1af0:	c6d9                	beqz	a3,1b7e <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1af2:	479d                	li	a5,7
    1af4:	22c7f563          	bleu	a2,a5,1d1e <strncpy+0x25e>
    1af8:	00000317          	auipc	t1,0x0
    1afc:	55030313          	addi	t1,t1,1360 # 2048 <__clone+0xaa>
    1b00:	6198                	ld	a4,0(a1)
    1b02:	00033783          	ld	a5,0(t1)
    1b06:	00000e17          	auipc	t3,0x0
    1b0a:	54ae0e13          	addi	t3,t3,1354 # 2050 <__clone+0xb2>
    1b0e:	000e3803          	ld	a6,0(t3)
    1b12:	97ba                	add	a5,a5,a4
    1b14:	fff74893          	not	a7,a4
    1b18:	0117f7b3          	and	a5,a5,a7
    1b1c:	0107f7b3          	and	a5,a5,a6
    1b20:	1e079f63          	bnez	a5,1d1e <strncpy+0x25e>
    1b24:	4e9d                	li	t4,7
    1b26:	a005                	j	1b46 <strncpy+0x86>
    1b28:	6598                	ld	a4,8(a1)
    1b2a:	00033783          	ld	a5,0(t1)
    1b2e:	000e3803          	ld	a6,0(t3)
    1b32:	fff74893          	not	a7,a4
    1b36:	97ba                	add	a5,a5,a4
    1b38:	0117f7b3          	and	a5,a5,a7
    1b3c:	0107f7b3          	and	a5,a5,a6
    1b40:	1a079f63          	bnez	a5,1cfe <strncpy+0x23e>
    1b44:	85b6                	mv	a1,a3
            *wd = *ws;
    1b46:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b48:	1661                	addi	a2,a2,-8
    1b4a:	00858693          	addi	a3,a1,8
    1b4e:	0521                	addi	a0,a0,8
    1b50:	fcceece3          	bltu	t4,a2,1b28 <strncpy+0x68>
    1b54:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b56:	18060a63          	beqz	a2,1cea <strncpy+0x22a>
    1b5a:	0005c783          	lbu	a5,0(a1)
    1b5e:	872a                	mv	a4,a0
    1b60:	00f50023          	sb	a5,0(a0)
    1b64:	e799                	bnez	a5,1b72 <strncpy+0xb2>
    1b66:	a829                	j	1b80 <strncpy+0xc0>
    1b68:	0005c783          	lbu	a5,0(a1)
    1b6c:	00f70023          	sb	a5,0(a4)
    1b70:	cb81                	beqz	a5,1b80 <strncpy+0xc0>
    1b72:	167d                	addi	a2,a2,-1
    1b74:	0585                	addi	a1,a1,1
    1b76:	0705                	addi	a4,a4,1
    1b78:	fa65                	bnez	a2,1b68 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b7a:	853a                	mv	a0,a4
    1b7c:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1b7e:	872a                	mv	a4,a0
    1b80:	4805                	li	a6,1
    1b82:	14061c63          	bnez	a2,1cda <strncpy+0x21a>
    1b86:	40e007b3          	neg	a5,a4
    1b8a:	8b9d                	andi	a5,a5,7
    1b8c:	4581                	li	a1,0
    1b8e:	12061e63          	bnez	a2,1cca <strncpy+0x20a>
    1b92:	00778693          	addi	a3,a5,7
    1b96:	452d                	li	a0,11
    1b98:	12a6e763          	bltu	a3,a0,1cc6 <strncpy+0x206>
    1b9c:	16d5e663          	bltu	a1,a3,1d08 <strncpy+0x248>
    1ba0:	14078c63          	beqz	a5,1cf8 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ba4:	00070023          	sb	zero,0(a4)
    1ba8:	4585                	li	a1,1
    1baa:	00170693          	addi	a3,a4,1
    1bae:	14b78363          	beq	a5,a1,1cf4 <strncpy+0x234>
    1bb2:	000700a3          	sb	zero,1(a4)
    1bb6:	4589                	li	a1,2
    1bb8:	00270693          	addi	a3,a4,2
    1bbc:	14b78963          	beq	a5,a1,1d0e <strncpy+0x24e>
    1bc0:	00070123          	sb	zero,2(a4)
    1bc4:	458d                	li	a1,3
    1bc6:	00370693          	addi	a3,a4,3
    1bca:	12b78363          	beq	a5,a1,1cf0 <strncpy+0x230>
    1bce:	000701a3          	sb	zero,3(a4)
    1bd2:	4591                	li	a1,4
    1bd4:	00470693          	addi	a3,a4,4
    1bd8:	12b78d63          	beq	a5,a1,1d12 <strncpy+0x252>
    1bdc:	00070223          	sb	zero,4(a4)
    1be0:	4595                	li	a1,5
    1be2:	00570693          	addi	a3,a4,5
    1be6:	12b78863          	beq	a5,a1,1d16 <strncpy+0x256>
    1bea:	000702a3          	sb	zero,5(a4)
    1bee:	459d                	li	a1,7
    1bf0:	00670693          	addi	a3,a4,6
    1bf4:	12b79363          	bne	a5,a1,1d1a <strncpy+0x25a>
    1bf8:	00770693          	addi	a3,a4,7
    1bfc:	00070323          	sb	zero,6(a4)
    1c00:	40f80833          	sub	a6,a6,a5
    1c04:	ff887513          	andi	a0,a6,-8
    1c08:	97ba                	add	a5,a5,a4
    1c0a:	953e                	add	a0,a0,a5
    1c0c:	0007b023          	sd	zero,0(a5)
    1c10:	07a1                	addi	a5,a5,8
    1c12:	fea79de3          	bne	a5,a0,1c0c <strncpy+0x14c>
    1c16:	ff887513          	andi	a0,a6,-8
    1c1a:	9da9                	addw	a1,a1,a0
    1c1c:	00a687b3          	add	a5,a3,a0
    1c20:	f4a80de3          	beq	a6,a0,1b7a <strncpy+0xba>
    1c24:	00078023          	sb	zero,0(a5)
    1c28:	0015869b          	addiw	a3,a1,1
    1c2c:	f4c6f7e3          	bleu	a2,a3,1b7a <strncpy+0xba>
    1c30:	000780a3          	sb	zero,1(a5)
    1c34:	0025869b          	addiw	a3,a1,2
    1c38:	f4c6f1e3          	bleu	a2,a3,1b7a <strncpy+0xba>
    1c3c:	00078123          	sb	zero,2(a5)
    1c40:	0035869b          	addiw	a3,a1,3
    1c44:	f2c6fbe3          	bleu	a2,a3,1b7a <strncpy+0xba>
    1c48:	000781a3          	sb	zero,3(a5)
    1c4c:	0045869b          	addiw	a3,a1,4
    1c50:	f2c6f5e3          	bleu	a2,a3,1b7a <strncpy+0xba>
    1c54:	00078223          	sb	zero,4(a5)
    1c58:	0055869b          	addiw	a3,a1,5
    1c5c:	f0c6ffe3          	bleu	a2,a3,1b7a <strncpy+0xba>
    1c60:	000782a3          	sb	zero,5(a5)
    1c64:	0065869b          	addiw	a3,a1,6
    1c68:	f0c6f9e3          	bleu	a2,a3,1b7a <strncpy+0xba>
    1c6c:	00078323          	sb	zero,6(a5)
    1c70:	0075869b          	addiw	a3,a1,7
    1c74:	f0c6f3e3          	bleu	a2,a3,1b7a <strncpy+0xba>
    1c78:	000783a3          	sb	zero,7(a5)
    1c7c:	0085869b          	addiw	a3,a1,8
    1c80:	eec6fde3          	bleu	a2,a3,1b7a <strncpy+0xba>
    1c84:	00078423          	sb	zero,8(a5)
    1c88:	0095869b          	addiw	a3,a1,9
    1c8c:	eec6f7e3          	bleu	a2,a3,1b7a <strncpy+0xba>
    1c90:	000784a3          	sb	zero,9(a5)
    1c94:	00a5869b          	addiw	a3,a1,10
    1c98:	eec6f1e3          	bleu	a2,a3,1b7a <strncpy+0xba>
    1c9c:	00078523          	sb	zero,10(a5)
    1ca0:	00b5869b          	addiw	a3,a1,11
    1ca4:	ecc6fbe3          	bleu	a2,a3,1b7a <strncpy+0xba>
    1ca8:	000785a3          	sb	zero,11(a5)
    1cac:	00c5869b          	addiw	a3,a1,12
    1cb0:	ecc6f5e3          	bleu	a2,a3,1b7a <strncpy+0xba>
    1cb4:	00078623          	sb	zero,12(a5)
    1cb8:	25b5                	addiw	a1,a1,13
    1cba:	ecc5f0e3          	bleu	a2,a1,1b7a <strncpy+0xba>
    1cbe:	000786a3          	sb	zero,13(a5)
}
    1cc2:	853a                	mv	a0,a4
    1cc4:	8082                	ret
    1cc6:	46ad                	li	a3,11
    1cc8:	bdd1                	j	1b9c <strncpy+0xdc>
    1cca:	00778693          	addi	a3,a5,7
    1cce:	452d                	li	a0,11
    1cd0:	fff60593          	addi	a1,a2,-1
    1cd4:	eca6f4e3          	bleu	a0,a3,1b9c <strncpy+0xdc>
    1cd8:	b7fd                	j	1cc6 <strncpy+0x206>
    1cda:	40e007b3          	neg	a5,a4
    1cde:	8832                	mv	a6,a2
    1ce0:	8b9d                	andi	a5,a5,7
    1ce2:	4581                	li	a1,0
    1ce4:	ea0607e3          	beqz	a2,1b92 <strncpy+0xd2>
    1ce8:	b7cd                	j	1cca <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1cea:	872a                	mv	a4,a0
}
    1cec:	853a                	mv	a0,a4
    1cee:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cf0:	458d                	li	a1,3
    1cf2:	b739                	j	1c00 <strncpy+0x140>
    1cf4:	4585                	li	a1,1
    1cf6:	b729                	j	1c00 <strncpy+0x140>
    1cf8:	86ba                	mv	a3,a4
    1cfa:	4581                	li	a1,0
    1cfc:	b711                	j	1c00 <strncpy+0x140>
    1cfe:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d02:	872a                	mv	a4,a0
    1d04:	85b6                	mv	a1,a3
    1d06:	bda9                	j	1b60 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d08:	87ba                	mv	a5,a4
    1d0a:	4581                	li	a1,0
    1d0c:	bf21                	j	1c24 <strncpy+0x164>
    1d0e:	4589                	li	a1,2
    1d10:	bdc5                	j	1c00 <strncpy+0x140>
    1d12:	4591                	li	a1,4
    1d14:	b5f5                	j	1c00 <strncpy+0x140>
    1d16:	4595                	li	a1,5
    1d18:	b5e5                	j	1c00 <strncpy+0x140>
    1d1a:	4599                	li	a1,6
    1d1c:	b5d5                	j	1c00 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d1e:	00d50023          	sb	a3,0(a0)
    1d22:	872a                	mv	a4,a0
    1d24:	b5b9                	j	1b72 <strncpy+0xb2>

0000000000001d26 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d26:	87aa                	mv	a5,a0
    1d28:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d2a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d2e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d32:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d34:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d36:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d3a:	2501                	sext.w	a0,a0
    1d3c:	8082                	ret

0000000000001d3e <openat>:
    register long a7 __asm__("a7") = n;
    1d3e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d42:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d46:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d4a:	2501                	sext.w	a0,a0
    1d4c:	8082                	ret

0000000000001d4e <close>:
    register long a7 __asm__("a7") = n;
    1d4e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d52:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d56:	2501                	sext.w	a0,a0
    1d58:	8082                	ret

0000000000001d5a <read>:
    register long a7 __asm__("a7") = n;
    1d5a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d5e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d62:	8082                	ret

0000000000001d64 <write>:
    register long a7 __asm__("a7") = n;
    1d64:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d68:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d6c:	8082                	ret

0000000000001d6e <getpid>:
    register long a7 __asm__("a7") = n;
    1d6e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d72:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <getppid>:
    register long a7 __asm__("a7") = n;
    1d7a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d7e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d86:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d8a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <fork>:
    register long a7 __asm__("a7") = n;
    1d92:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d96:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d98:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d9a:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1da2:	85b2                	mv	a1,a2
    1da4:	863a                	mv	a2,a4
    if (stack)
    1da6:	c191                	beqz	a1,1daa <clone+0x8>
	stack += stack_size;
    1da8:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1daa:	4781                	li	a5,0
    1dac:	4701                	li	a4,0
    1dae:	4681                	li	a3,0
    1db0:	2601                	sext.w	a2,a2
    1db2:	1ec0006f          	j	1f9e <__clone>

0000000000001db6 <exit>:
    register long a7 __asm__("a7") = n;
    1db6:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dba:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dbe:	8082                	ret

0000000000001dc0 <waitpid>:
    register long a7 __asm__("a7") = n;
    1dc0:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1dc4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dc6:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1dca:	2501                	sext.w	a0,a0
    1dcc:	8082                	ret

0000000000001dce <exec>:
    register long a7 __asm__("a7") = n;
    1dce:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1dd2:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <execve>:
    register long a7 __asm__("a7") = n;
    1dda:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dde:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <times>:
    register long a7 __asm__("a7") = n;
    1de6:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1dea:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <get_time>:

int64 get_time()
{
    1df2:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1df4:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1df8:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1dfa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dfc:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e00:	2501                	sext.w	a0,a0
    1e02:	ed09                	bnez	a0,1e1c <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e04:	67a2                	ld	a5,8(sp)
    1e06:	3e800713          	li	a4,1000
    1e0a:	00015503          	lhu	a0,0(sp)
    1e0e:	02e7d7b3          	divu	a5,a5,a4
    1e12:	02e50533          	mul	a0,a0,a4
    1e16:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e18:	0141                	addi	sp,sp,16
    1e1a:	8082                	ret
        return -1;
    1e1c:	557d                	li	a0,-1
    1e1e:	bfed                	j	1e18 <get_time+0x26>

0000000000001e20 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e20:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e24:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e28:	2501                	sext.w	a0,a0
    1e2a:	8082                	ret

0000000000001e2c <time>:
    register long a7 __asm__("a7") = n;
    1e2c:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e30:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <sleep>:

int sleep(unsigned long long time)
{
    1e38:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e3a:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e3c:	850a                	mv	a0,sp
    1e3e:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e40:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e44:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e46:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e4a:	e501                	bnez	a0,1e52 <sleep+0x1a>
    return 0;
    1e4c:	4501                	li	a0,0
}
    1e4e:	0141                	addi	sp,sp,16
    1e50:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e52:	4502                	lw	a0,0(sp)
}
    1e54:	0141                	addi	sp,sp,16
    1e56:	8082                	ret

0000000000001e58 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e58:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e5c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e60:	2501                	sext.w	a0,a0
    1e62:	8082                	ret

0000000000001e64 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e64:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e68:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e6c:	8082                	ret

0000000000001e6e <munmap>:
    register long a7 __asm__("a7") = n;
    1e6e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e72:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e76:	2501                	sext.w	a0,a0
    1e78:	8082                	ret

0000000000001e7a <wait>:

int wait(int *code)
{
    1e7a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e7c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e80:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e82:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e84:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e86:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <spawn>:
    register long a7 __asm__("a7") = n;
    1e8e:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e92:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <mailread>:
    register long a7 __asm__("a7") = n;
    1e9a:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9e:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	8082                	ret

0000000000001ea6 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ea6:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eaa:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <fstat>:
    register long a7 __asm__("a7") = n;
    1eb2:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb6:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ebe:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ec0:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ec4:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ec6:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ece:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ed0:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ed4:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed6:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1eda:	2501                	sext.w	a0,a0
    1edc:	8082                	ret

0000000000001ede <link>:

int link(char *old_path, char *new_path)
{
    1ede:	87aa                	mv	a5,a0
    1ee0:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1ee2:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1ee6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eea:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1eec:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1ef0:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ef2:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1ef6:	2501                	sext.w	a0,a0
    1ef8:	8082                	ret

0000000000001efa <unlink>:

int unlink(char *path)
{
    1efa:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1efc:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f00:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f04:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f06:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f0a:	2501                	sext.w	a0,a0
    1f0c:	8082                	ret

0000000000001f0e <uname>:
    register long a7 __asm__("a7") = n;
    1f0e:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f12:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f16:	2501                	sext.w	a0,a0
    1f18:	8082                	ret

0000000000001f1a <brk>:
    register long a7 __asm__("a7") = n;
    1f1a:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f1e:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f22:	2501                	sext.w	a0,a0
    1f24:	8082                	ret

0000000000001f26 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f26:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f28:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f2c:	8082                	ret

0000000000001f2e <chdir>:
    register long a7 __asm__("a7") = n;
    1f2e:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f32:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f36:	2501                	sext.w	a0,a0
    1f38:	8082                	ret

0000000000001f3a <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f3a:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f3c:	02059613          	slli	a2,a1,0x20
    1f40:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f42:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f46:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f4a:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f4c:	00000073          	ecall
}
    1f50:	2501                	sext.w	a0,a0
    1f52:	8082                	ret

0000000000001f54 <getdents>:
    register long a7 __asm__("a7") = n;
    1f54:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f58:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f5c:	2501                	sext.w	a0,a0
    1f5e:	8082                	ret

0000000000001f60 <pipe>:
    register long a7 __asm__("a7") = n;
    1f60:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f64:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f66:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f6a:	2501                	sext.w	a0,a0
    1f6c:	8082                	ret

0000000000001f6e <dup>:
    register long a7 __asm__("a7") = n;
    1f6e:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f70:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f74:	2501                	sext.w	a0,a0
    1f76:	8082                	ret

0000000000001f78 <dup2>:
    register long a7 __asm__("a7") = n;
    1f78:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f7a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f7c:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f80:	2501                	sext.w	a0,a0
    1f82:	8082                	ret

0000000000001f84 <mount>:
    register long a7 __asm__("a7") = n;
    1f84:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f88:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f8c:	2501                	sext.w	a0,a0
    1f8e:	8082                	ret

0000000000001f90 <umount>:
    register long a7 __asm__("a7") = n;
    1f90:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f94:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f96:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f9a:	2501                	sext.w	a0,a0
    1f9c:	8082                	ret

0000000000001f9e <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f9e:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fa0:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fa2:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fa4:	8532                	mv	a0,a2
	mv a2, a4
    1fa6:	863a                	mv	a2,a4
	mv a3, a5
    1fa8:	86be                	mv	a3,a5
	mv a4, a6
    1faa:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fac:	0dc00893          	li	a7,220
	ecall
    1fb0:	00000073          	ecall

	beqz a0, 1f
    1fb4:	c111                	beqz	a0,1fb8 <__clone+0x1a>
	# Parent
	ret
    1fb6:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fb8:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fba:	6522                	ld	a0,8(sp)
	jalr a1
    1fbc:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fbe:	05d00893          	li	a7,93
	ecall
    1fc2:	00000073          	ecall
