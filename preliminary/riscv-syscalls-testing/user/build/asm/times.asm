
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/times:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	09e0006f          	j	10a0 <__start_main>

0000000000001006 <test_times>:
	long tms_cstime; 
};

struct tms mytimes;

void test_times() {
    1006:	1141                	addi	sp,sp,-16
	TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	fd050513          	addi	a0,a0,-48 # 1fd8 <__clone+0x28>
void test_times() {
    1010:	e406                	sd	ra,8(sp)
	TEST_START(__func__);
    1012:	28e000ef          	jal	ra,12a0 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	0aa50513          	addi	a0,a0,170 # 20c0 <__func__.1191>
    101e:	282000ef          	jal	ra,12a0 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	fce50513          	addi	a0,a0,-50 # 1ff0 <__clone+0x40>
    102a:	276000ef          	jal	ra,12a0 <puts>

	int test_ret = times(&mytimes);
    102e:	00001517          	auipc	a0,0x1
    1032:	07250513          	addi	a0,a0,114 # 20a0 <mytimes>
    1036:	5c3000ef          	jal	ra,1df8 <times>
	assert(test_ret >= 0);
    103a:	04054463          	bltz	a0,1082 <test_times+0x7c>

	printf("mytimes success\n{tms_utime:%d, tms_stime:%d, tms_cutime:%d, tms_cstime:%d}\n",
    103e:	00001797          	auipc	a5,0x1
    1042:	06278793          	addi	a5,a5,98 # 20a0 <mytimes>
    1046:	6f98                	ld	a4,24(a5)
    1048:	6b94                	ld	a3,16(a5)
    104a:	6790                	ld	a2,8(a5)
    104c:	638c                	ld	a1,0(a5)
    104e:	00001517          	auipc	a0,0x1
    1052:	fd250513          	addi	a0,a0,-46 # 2020 <__clone+0x70>
    1056:	26c000ef          	jal	ra,12c2 <printf>
		mytimes.tms_utime, mytimes.tms_stime, mytimes.tms_cutime, mytimes.tms_cstime);
	TEST_END(__func__);
    105a:	00001517          	auipc	a0,0x1
    105e:	01650513          	addi	a0,a0,22 # 2070 <__clone+0xc0>
    1062:	23e000ef          	jal	ra,12a0 <puts>
    1066:	00001517          	auipc	a0,0x1
    106a:	05a50513          	addi	a0,a0,90 # 20c0 <__func__.1191>
    106e:	232000ef          	jal	ra,12a0 <puts>
}
    1072:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    1074:	00001517          	auipc	a0,0x1
    1078:	f7c50513          	addi	a0,a0,-132 # 1ff0 <__clone+0x40>
}
    107c:	0141                	addi	sp,sp,16
	TEST_END(__func__);
    107e:	2220006f          	j	12a0 <puts>
	assert(test_ret >= 0);
    1082:	00001517          	auipc	a0,0x1
    1086:	f7e50513          	addi	a0,a0,-130 # 2000 <__clone+0x50>
    108a:	4dc000ef          	jal	ra,1566 <panic>
    108e:	bf45                	j	103e <test_times+0x38>

0000000000001090 <main>:

int main(void) {
    1090:	1141                	addi	sp,sp,-16
    1092:	e406                	sd	ra,8(sp)
	test_times();
    1094:	f73ff0ef          	jal	ra,1006 <test_times>
	return 0;
}
    1098:	60a2                	ld	ra,8(sp)
    109a:	4501                	li	a0,0
    109c:	0141                	addi	sp,sp,16
    109e:	8082                	ret

00000000000010a0 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10a0:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10a2:	4108                	lw	a0,0(a0)
{
    10a4:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10a6:	05a1                	addi	a1,a1,8
{
    10a8:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10aa:	fe7ff0ef          	jal	ra,1090 <main>
    10ae:	51b000ef          	jal	ra,1dc8 <exit>
	return 0;
}
    10b2:	60a2                	ld	ra,8(sp)
    10b4:	4501                	li	a0,0
    10b6:	0141                	addi	sp,sp,16
    10b8:	8082                	ret

00000000000010ba <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ba:	7179                	addi	sp,sp,-48
    10bc:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10be:	12054e63          	bltz	a0,11fa <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10c2:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10c6:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10c8:	02b7f6bb          	remuw	a3,a5,a1
    10cc:	00001717          	auipc	a4,0x1
    10d0:	00470713          	addi	a4,a4,4 # 20d0 <digits>
    buf[16] = 0;
    10d4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10d8:	1682                	slli	a3,a3,0x20
    10da:	9281                	srli	a3,a3,0x20
    10dc:	96ba                	add	a3,a3,a4
    10de:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    10e2:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    10e6:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10ea:	16b7e363          	bltu	a5,a1,1250 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    10ee:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    10f2:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    10f6:	1602                	slli	a2,a2,0x20
    10f8:	9201                	srli	a2,a2,0x20
    10fa:	963a                	add	a2,a2,a4
    10fc:	00064603          	lbu	a2,0(a2)
    1100:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1104:	0007861b          	sext.w	a2,a5
    1108:	12b6e863          	bltu	a3,a1,1238 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    110c:	02b7f6bb          	remuw	a3,a5,a1
    1110:	1682                	slli	a3,a3,0x20
    1112:	9281                	srli	a3,a3,0x20
    1114:	96ba                	add	a3,a3,a4
    1116:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    111a:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    111e:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1122:	10b66e63          	bltu	a2,a1,123e <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1126:	02b876bb          	remuw	a3,a6,a1
    112a:	1682                	slli	a3,a3,0x20
    112c:	9281                	srli	a3,a3,0x20
    112e:	96ba                	add	a3,a3,a4
    1130:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1134:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1138:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    113c:	10b86463          	bltu	a6,a1,1244 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1140:	02b676bb          	remuw	a3,a2,a1
    1144:	1682                	slli	a3,a3,0x20
    1146:	9281                	srli	a3,a3,0x20
    1148:	96ba                	add	a3,a3,a4
    114a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    114e:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1152:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1156:	0eb66a63          	bltu	a2,a1,124a <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    115a:	02b876bb          	remuw	a3,a6,a1
    115e:	1682                	slli	a3,a3,0x20
    1160:	9281                	srli	a3,a3,0x20
    1162:	96ba                	add	a3,a3,a4
    1164:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1168:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    116c:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1170:	0cb86163          	bltu	a6,a1,1232 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    1174:	02b676bb          	remuw	a3,a2,a1
    1178:	1682                	slli	a3,a3,0x20
    117a:	9281                	srli	a3,a3,0x20
    117c:	96ba                	add	a3,a3,a4
    117e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1182:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1186:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    118a:	0cb66563          	bltu	a2,a1,1254 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    118e:	02b876bb          	remuw	a3,a6,a1
    1192:	1682                	slli	a3,a3,0x20
    1194:	9281                	srli	a3,a3,0x20
    1196:	96ba                	add	a3,a3,a4
    1198:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    119c:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11a0:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11a4:	0ab86b63          	bltu	a6,a1,125a <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11a8:	02b676bb          	remuw	a3,a2,a1
    11ac:	1682                	slli	a3,a3,0x20
    11ae:	9281                	srli	a3,a3,0x20
    11b0:	96ba                	add	a3,a3,a4
    11b2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b6:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11ba:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11be:	0ab66163          	bltu	a2,a1,1260 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11c2:	1782                	slli	a5,a5,0x20
    11c4:	9381                	srli	a5,a5,0x20
    11c6:	97ba                	add	a5,a5,a4
    11c8:	0007c703          	lbu	a4,0(a5)
    11cc:	4599                	li	a1,6
    11ce:	4795                	li	a5,5
    11d0:	00e10723          	sb	a4,14(sp)

    if (sign)
    11d4:	00055963          	bgez	a0,11e6 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11d8:	1018                	addi	a4,sp,32
    11da:	973e                	add	a4,a4,a5
    11dc:	02d00693          	li	a3,45
    11e0:	fed70423          	sb	a3,-24(a4)
    11e4:	85be                	mv	a1,a5
    write(f, s, l);
    11e6:	003c                	addi	a5,sp,8
    11e8:	4641                	li	a2,16
    11ea:	9e0d                	subw	a2,a2,a1
    11ec:	4505                	li	a0,1
    11ee:	95be                	add	a1,a1,a5
    11f0:	387000ef          	jal	ra,1d76 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11f4:	70a2                	ld	ra,40(sp)
    11f6:	6145                	addi	sp,sp,48
    11f8:	8082                	ret
        x = -xx;
    11fa:	40a0063b          	negw	a2,a0
    11fe:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1200:	02b677bb          	remuw	a5,a2,a1
    1204:	00001717          	auipc	a4,0x1
    1208:	ecc70713          	addi	a4,a4,-308 # 20d0 <digits>
    buf[16] = 0;
    120c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1210:	1782                	slli	a5,a5,0x20
    1212:	9381                	srli	a5,a5,0x20
    1214:	97ba                	add	a5,a5,a4
    1216:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    121a:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    121e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1222:	ecb676e3          	bleu	a1,a2,10ee <printint.constprop.0+0x34>
        buf[i--] = '-';
    1226:	02d00793          	li	a5,45
    122a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    122e:	45b9                	li	a1,14
    1230:	bf5d                	j	11e6 <printint.constprop.0+0x12c>
    1232:	47a5                	li	a5,9
    1234:	45a9                	li	a1,10
    1236:	bf79                	j	11d4 <printint.constprop.0+0x11a>
    1238:	47b5                	li	a5,13
    123a:	45b9                	li	a1,14
    123c:	bf61                	j	11d4 <printint.constprop.0+0x11a>
    123e:	47b1                	li	a5,12
    1240:	45b5                	li	a1,13
    1242:	bf49                	j	11d4 <printint.constprop.0+0x11a>
    1244:	47ad                	li	a5,11
    1246:	45b1                	li	a1,12
    1248:	b771                	j	11d4 <printint.constprop.0+0x11a>
    124a:	47a9                	li	a5,10
    124c:	45ad                	li	a1,11
    124e:	b759                	j	11d4 <printint.constprop.0+0x11a>
    i = 15;
    1250:	45bd                	li	a1,15
    1252:	bf51                	j	11e6 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1254:	47a1                	li	a5,8
    1256:	45a5                	li	a1,9
    1258:	bfb5                	j	11d4 <printint.constprop.0+0x11a>
    125a:	479d                	li	a5,7
    125c:	45a1                	li	a1,8
    125e:	bf9d                	j	11d4 <printint.constprop.0+0x11a>
    1260:	4799                	li	a5,6
    1262:	459d                	li	a1,7
    1264:	bf85                	j	11d4 <printint.constprop.0+0x11a>

0000000000001266 <getchar>:
{
    1266:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1268:	00f10593          	addi	a1,sp,15
    126c:	4605                	li	a2,1
    126e:	4501                	li	a0,0
{
    1270:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1272:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1276:	2f7000ef          	jal	ra,1d6c <read>
}
    127a:	60e2                	ld	ra,24(sp)
    127c:	00f14503          	lbu	a0,15(sp)
    1280:	6105                	addi	sp,sp,32
    1282:	8082                	ret

0000000000001284 <putchar>:
{
    1284:	1101                	addi	sp,sp,-32
    char byte = c;
    1286:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    128a:	00f10593          	addi	a1,sp,15
    128e:	4605                	li	a2,1
    1290:	4505                	li	a0,1
{
    1292:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    1294:	2e3000ef          	jal	ra,1d76 <write>
}
    1298:	60e2                	ld	ra,24(sp)
    129a:	2501                	sext.w	a0,a0
    129c:	6105                	addi	sp,sp,32
    129e:	8082                	ret

00000000000012a0 <puts>:
{
    12a0:	1141                	addi	sp,sp,-16
    12a2:	e406                	sd	ra,8(sp)
    12a4:	e022                	sd	s0,0(sp)
    12a6:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12a8:	5b2000ef          	jal	ra,185a <strlen>
    12ac:	862a                	mv	a2,a0
    12ae:	85a2                	mv	a1,s0
    12b0:	4505                	li	a0,1
    12b2:	2c5000ef          	jal	ra,1d76 <write>
}
    12b6:	60a2                	ld	ra,8(sp)
    12b8:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12ba:	957d                	srai	a0,a0,0x3f
    return r;
    12bc:	2501                	sext.w	a0,a0
}
    12be:	0141                	addi	sp,sp,16
    12c0:	8082                	ret

00000000000012c2 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12c2:	7131                	addi	sp,sp,-192
    12c4:	e0da                	sd	s6,64(sp)
    12c6:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12c8:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12ca:	013c                	addi	a5,sp,136
{
    12cc:	f0ca                	sd	s2,96(sp)
    12ce:	ecce                	sd	s3,88(sp)
    12d0:	e8d2                	sd	s4,80(sp)
    12d2:	e4d6                	sd	s5,72(sp)
    12d4:	fc5e                	sd	s7,56(sp)
    12d6:	fc86                	sd	ra,120(sp)
    12d8:	f8a2                	sd	s0,112(sp)
    12da:	f4a6                	sd	s1,104(sp)
    12dc:	89aa                	mv	s3,a0
    12de:	e52e                	sd	a1,136(sp)
    12e0:	e932                	sd	a2,144(sp)
    12e2:	ed36                	sd	a3,152(sp)
    12e4:	f13a                	sd	a4,160(sp)
    12e6:	f942                	sd	a6,176(sp)
    12e8:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12ea:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12ec:	02500913          	li	s2,37
    12f0:	07000a93          	li	s5,112
    buf[i++] = '0';
    12f4:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12f8:	00001a17          	auipc	s4,0x1
    12fc:	dd8a0a13          	addi	s4,s4,-552 # 20d0 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1300:	00001b97          	auipc	s7,0x1
    1304:	d80b8b93          	addi	s7,s7,-640 # 2080 <__clone+0xd0>
        if (!*s)
    1308:	0009c783          	lbu	a5,0(s3)
    130c:	cfb9                	beqz	a5,136a <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    130e:	23278d63          	beq	a5,s2,1548 <printf+0x286>
    1312:	864e                	mv	a2,s3
    1314:	a019                	j	131a <printf+0x58>
    1316:	07278563          	beq	a5,s2,1380 <printf+0xbe>
    131a:	0605                	addi	a2,a2,1
    131c:	00064783          	lbu	a5,0(a2)
    1320:	fbfd                	bnez	a5,1316 <printf+0x54>
    1322:	84b2                	mv	s1,a2
        l = z - a;
    1324:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1328:	8622                	mv	a2,s0
    132a:	85ce                	mv	a1,s3
    132c:	4505                	li	a0,1
    132e:	249000ef          	jal	ra,1d76 <write>
        if (l)
    1332:	ec3d                	bnez	s0,13b0 <printf+0xee>
        if (s[1] == 0)
    1334:	0014c783          	lbu	a5,1(s1)
    1338:	cb8d                	beqz	a5,136a <printf+0xa8>
        switch (s[1])
    133a:	09578b63          	beq	a5,s5,13d0 <printf+0x10e>
    133e:	06fafb63          	bleu	a5,s5,13b4 <printf+0xf2>
    1342:	07300713          	li	a4,115
    1346:	1ce78e63          	beq	a5,a4,1522 <printf+0x260>
    134a:	07800713          	li	a4,120
    134e:	1ae79563          	bne	a5,a4,14f8 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1352:	6782                	ld	a5,0(sp)
    1354:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1356:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    135a:	4388                	lw	a0,0(a5)
    135c:	07a1                	addi	a5,a5,8
    135e:	e03e                	sd	a5,0(sp)
    1360:	d5bff0ef          	jal	ra,10ba <printint.constprop.0>
        if (!*s)
    1364:	0009c783          	lbu	a5,0(s3)
    1368:	f3dd                	bnez	a5,130e <printf+0x4c>
    }
    va_end(ap);
}
    136a:	70e6                	ld	ra,120(sp)
    136c:	7446                	ld	s0,112(sp)
    136e:	74a6                	ld	s1,104(sp)
    1370:	7906                	ld	s2,96(sp)
    1372:	69e6                	ld	s3,88(sp)
    1374:	6a46                	ld	s4,80(sp)
    1376:	6aa6                	ld	s5,72(sp)
    1378:	6b06                	ld	s6,64(sp)
    137a:	7be2                	ld	s7,56(sp)
    137c:	6129                	addi	sp,sp,192
    137e:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1380:	00164783          	lbu	a5,1(a2)
    1384:	84b2                	mv	s1,a2
    1386:	01278763          	beq	a5,s2,1394 <printf+0xd2>
    138a:	bf69                	j	1324 <printf+0x62>
    138c:	0014c783          	lbu	a5,1(s1)
    1390:	f9279ae3          	bne	a5,s2,1324 <printf+0x62>
    1394:	0489                	addi	s1,s1,2
    1396:	0004c783          	lbu	a5,0(s1)
    139a:	0605                	addi	a2,a2,1
    139c:	ff2788e3          	beq	a5,s2,138c <printf+0xca>
        l = z - a;
    13a0:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13a4:	8622                	mv	a2,s0
    13a6:	85ce                	mv	a1,s3
    13a8:	4505                	li	a0,1
    13aa:	1cd000ef          	jal	ra,1d76 <write>
        if (l)
    13ae:	d059                	beqz	s0,1334 <printf+0x72>
    13b0:	89a6                	mv	s3,s1
    13b2:	bf99                	j	1308 <printf+0x46>
    13b4:	06400713          	li	a4,100
    13b8:	14e79063          	bne	a5,a4,14f8 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13bc:	6782                	ld	a5,0(sp)
    13be:	45a9                	li	a1,10
        s += 2;
    13c0:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13c4:	4388                	lw	a0,0(a5)
    13c6:	07a1                	addi	a5,a5,8
    13c8:	e03e                	sd	a5,0(sp)
    13ca:	cf1ff0ef          	jal	ra,10ba <printint.constprop.0>
        s += 2;
    13ce:	bf59                	j	1364 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13d0:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13d2:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13d6:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13d8:	631c                	ld	a5,0(a4)
    13da:	0721                	addi	a4,a4,8
    13dc:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13de:	00479293          	slli	t0,a5,0x4
    13e2:	00879f93          	slli	t6,a5,0x8
    13e6:	00c79f13          	slli	t5,a5,0xc
    13ea:	01079e93          	slli	t4,a5,0x10
    13ee:	01479e13          	slli	t3,a5,0x14
    13f2:	01879313          	slli	t1,a5,0x18
    13f6:	01c79893          	slli	a7,a5,0x1c
    13fa:	02479813          	slli	a6,a5,0x24
    13fe:	02879513          	slli	a0,a5,0x28
    1402:	02c79593          	slli	a1,a5,0x2c
    1406:	03079693          	slli	a3,a5,0x30
    140a:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    140e:	03c7d413          	srli	s0,a5,0x3c
    1412:	01c7d39b          	srliw	t2,a5,0x1c
    1416:	03c2d293          	srli	t0,t0,0x3c
    141a:	03cfdf93          	srli	t6,t6,0x3c
    141e:	03cf5f13          	srli	t5,t5,0x3c
    1422:	03cede93          	srli	t4,t4,0x3c
    1426:	03ce5e13          	srli	t3,t3,0x3c
    142a:	03c35313          	srli	t1,t1,0x3c
    142e:	03c8d893          	srli	a7,a7,0x3c
    1432:	03c85813          	srli	a6,a6,0x3c
    1436:	9171                	srli	a0,a0,0x3c
    1438:	91f1                	srli	a1,a1,0x3c
    143a:	92f1                	srli	a3,a3,0x3c
    143c:	9371                	srli	a4,a4,0x3c
    143e:	96d2                	add	a3,a3,s4
    1440:	9752                	add	a4,a4,s4
    1442:	9452                	add	s0,s0,s4
    1444:	92d2                	add	t0,t0,s4
    1446:	9fd2                	add	t6,t6,s4
    1448:	9f52                	add	t5,t5,s4
    144a:	9ed2                	add	t4,t4,s4
    144c:	9e52                	add	t3,t3,s4
    144e:	9352                	add	t1,t1,s4
    1450:	98d2                	add	a7,a7,s4
    1452:	93d2                	add	t2,t2,s4
    1454:	9852                	add	a6,a6,s4
    1456:	9552                	add	a0,a0,s4
    1458:	95d2                	add	a1,a1,s4
    145a:	0006c983          	lbu	s3,0(a3)
    145e:	0002c283          	lbu	t0,0(t0)
    1462:	00074683          	lbu	a3,0(a4)
    1466:	000fcf83          	lbu	t6,0(t6)
    146a:	000f4f03          	lbu	t5,0(t5)
    146e:	000ece83          	lbu	t4,0(t4)
    1472:	000e4e03          	lbu	t3,0(t3)
    1476:	00034303          	lbu	t1,0(t1)
    147a:	0008c883          	lbu	a7,0(a7)
    147e:	0003c383          	lbu	t2,0(t2)
    1482:	00084803          	lbu	a6,0(a6)
    1486:	00054503          	lbu	a0,0(a0)
    148a:	0005c583          	lbu	a1,0(a1)
    148e:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1492:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1496:	9371                	srli	a4,a4,0x3c
    1498:	8bbd                	andi	a5,a5,15
    149a:	9752                	add	a4,a4,s4
    149c:	97d2                	add	a5,a5,s4
    149e:	005105a3          	sb	t0,11(sp)
    14a2:	01f10623          	sb	t6,12(sp)
    14a6:	01e106a3          	sb	t5,13(sp)
    14aa:	01d10723          	sb	t4,14(sp)
    14ae:	01c107a3          	sb	t3,15(sp)
    14b2:	00610823          	sb	t1,16(sp)
    14b6:	011108a3          	sb	a7,17(sp)
    14ba:	00710923          	sb	t2,18(sp)
    14be:	010109a3          	sb	a6,19(sp)
    14c2:	00a10a23          	sb	a0,20(sp)
    14c6:	00b10aa3          	sb	a1,21(sp)
    14ca:	01310b23          	sb	s3,22(sp)
    14ce:	00d10ba3          	sb	a3,23(sp)
    14d2:	00810523          	sb	s0,10(sp)
    14d6:	00074703          	lbu	a4,0(a4)
    14da:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14de:	002c                	addi	a1,sp,8
    14e0:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14e2:	00e10c23          	sb	a4,24(sp)
    14e6:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14ea:	00010d23          	sb	zero,26(sp)
        s += 2;
    14ee:	00248993          	addi	s3,s1,2
    write(f, s, l);
    14f2:	085000ef          	jal	ra,1d76 <write>
        s += 2;
    14f6:	b5bd                	j	1364 <printf+0xa2>
    char byte = c;
    14f8:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    14fc:	4605                	li	a2,1
    14fe:	002c                	addi	a1,sp,8
    1500:	4505                	li	a0,1
    char byte = c;
    1502:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1506:	071000ef          	jal	ra,1d76 <write>
    char byte = c;
    150a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    150e:	4605                	li	a2,1
    1510:	002c                	addi	a1,sp,8
    1512:	4505                	li	a0,1
    char byte = c;
    1514:	00f10423          	sb	a5,8(sp)
        s += 2;
    1518:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    151c:	05b000ef          	jal	ra,1d76 <write>
        s += 2;
    1520:	b591                	j	1364 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1522:	6782                	ld	a5,0(sp)
    1524:	6380                	ld	s0,0(a5)
    1526:	07a1                	addi	a5,a5,8
    1528:	e03e                	sd	a5,0(sp)
    152a:	cc05                	beqz	s0,1562 <printf+0x2a0>
            l = strnlen(a, 200);
    152c:	0c800593          	li	a1,200
    1530:	8522                	mv	a0,s0
    1532:	45a000ef          	jal	ra,198c <strnlen>
    write(f, s, l);
    1536:	0005061b          	sext.w	a2,a0
    153a:	85a2                	mv	a1,s0
    153c:	4505                	li	a0,1
    153e:	039000ef          	jal	ra,1d76 <write>
        s += 2;
    1542:	00248993          	addi	s3,s1,2
    1546:	bd39                	j	1364 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1548:	0019c783          	lbu	a5,1(s3)
    154c:	84ce                	mv	s1,s3
    154e:	864e                	mv	a2,s3
    1550:	e52782e3          	beq	a5,s2,1394 <printf+0xd2>
    write(f, s, l);
    1554:	4601                	li	a2,0
    1556:	85ce                	mv	a1,s3
    1558:	4505                	li	a0,1
    155a:	01d000ef          	jal	ra,1d76 <write>
    155e:	84ce                	mv	s1,s3
    1560:	bbd1                	j	1334 <printf+0x72>
                a = "(null)";
    1562:	845e                	mv	s0,s7
    1564:	b7e1                	j	152c <printf+0x26a>

0000000000001566 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1566:	1141                	addi	sp,sp,-16
    1568:	e406                	sd	ra,8(sp)
    puts(m);
    156a:	d37ff0ef          	jal	ra,12a0 <puts>
    exit(-100);
}
    156e:	60a2                	ld	ra,8(sp)
    exit(-100);
    1570:	f9c00513          	li	a0,-100
}
    1574:	0141                	addi	sp,sp,16
    exit(-100);
    1576:	0530006f          	j	1dc8 <exit>

000000000000157a <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    157a:	02000793          	li	a5,32
    157e:	00f50663          	beq	a0,a5,158a <isspace+0x10>
    1582:	355d                	addiw	a0,a0,-9
    1584:	00553513          	sltiu	a0,a0,5
    1588:	8082                	ret
    158a:	4505                	li	a0,1
}
    158c:	8082                	ret

000000000000158e <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    158e:	fd05051b          	addiw	a0,a0,-48
}
    1592:	00a53513          	sltiu	a0,a0,10
    1596:	8082                	ret

0000000000001598 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1598:	02000613          	li	a2,32
    159c:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    159e:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a2:	0007079b          	sext.w	a5,a4
    15a6:	ff77869b          	addiw	a3,a5,-9
    15aa:	04c70b63          	beq	a4,a2,1600 <atoi+0x68>
    15ae:	04d5f963          	bleu	a3,a1,1600 <atoi+0x68>
        s++;
    switch (*s)
    15b2:	02b00693          	li	a3,43
    15b6:	04d70a63          	beq	a4,a3,160a <atoi+0x72>
    15ba:	02d00693          	li	a3,45
    15be:	06d70463          	beq	a4,a3,1626 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15c2:	fd07859b          	addiw	a1,a5,-48
    15c6:	4625                	li	a2,9
    15c8:	873e                	mv	a4,a5
    15ca:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15cc:	4e01                	li	t3,0
    while (isdigit(*s))
    15ce:	04b66a63          	bltu	a2,a1,1622 <atoi+0x8a>
    int n = 0, neg = 0;
    15d2:	4501                	li	a0,0
    while (isdigit(*s))
    15d4:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15d6:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15d8:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15dc:	0025179b          	slliw	a5,a0,0x2
    15e0:	9d3d                	addw	a0,a0,a5
    15e2:	fd07031b          	addiw	t1,a4,-48
    15e6:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15ea:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15ee:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15f2:	0006071b          	sext.w	a4,a2
    15f6:	feb870e3          	bleu	a1,a6,15d6 <atoi+0x3e>
    return neg ? n : -n;
    15fa:	000e0563          	beqz	t3,1604 <atoi+0x6c>
}
    15fe:	8082                	ret
        s++;
    1600:	0505                	addi	a0,a0,1
    1602:	bf71                	j	159e <atoi+0x6>
    1604:	4113053b          	subw	a0,t1,a7
    1608:	8082                	ret
    while (isdigit(*s))
    160a:	00154783          	lbu	a5,1(a0)
    160e:	4625                	li	a2,9
        s++;
    1610:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1614:	fd07859b          	addiw	a1,a5,-48
    1618:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    161c:	4e01                	li	t3,0
    while (isdigit(*s))
    161e:	fab67ae3          	bleu	a1,a2,15d2 <atoi+0x3a>
    1622:	4501                	li	a0,0
}
    1624:	8082                	ret
    while (isdigit(*s))
    1626:	00154783          	lbu	a5,1(a0)
    162a:	4625                	li	a2,9
        s++;
    162c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1630:	fd07859b          	addiw	a1,a5,-48
    1634:	0007871b          	sext.w	a4,a5
    1638:	feb665e3          	bltu	a2,a1,1622 <atoi+0x8a>
        neg = 1;
    163c:	4e05                	li	t3,1
    163e:	bf51                	j	15d2 <atoi+0x3a>

0000000000001640 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1640:	16060d63          	beqz	a2,17ba <memset+0x17a>
    1644:	40a007b3          	neg	a5,a0
    1648:	8b9d                	andi	a5,a5,7
    164a:	00778713          	addi	a4,a5,7
    164e:	482d                	li	a6,11
    1650:	0ff5f593          	andi	a1,a1,255
    1654:	fff60693          	addi	a3,a2,-1
    1658:	17076263          	bltu	a4,a6,17bc <memset+0x17c>
    165c:	16e6ea63          	bltu	a3,a4,17d0 <memset+0x190>
    1660:	16078563          	beqz	a5,17ca <memset+0x18a>
    1664:	00b50023          	sb	a1,0(a0)
    1668:	4705                	li	a4,1
    166a:	00150e93          	addi	t4,a0,1
    166e:	14e78c63          	beq	a5,a4,17c6 <memset+0x186>
    1672:	00b500a3          	sb	a1,1(a0)
    1676:	4709                	li	a4,2
    1678:	00250e93          	addi	t4,a0,2
    167c:	14e78d63          	beq	a5,a4,17d6 <memset+0x196>
    1680:	00b50123          	sb	a1,2(a0)
    1684:	470d                	li	a4,3
    1686:	00350e93          	addi	t4,a0,3
    168a:	12e78b63          	beq	a5,a4,17c0 <memset+0x180>
    168e:	00b501a3          	sb	a1,3(a0)
    1692:	4711                	li	a4,4
    1694:	00450e93          	addi	t4,a0,4
    1698:	14e78163          	beq	a5,a4,17da <memset+0x19a>
    169c:	00b50223          	sb	a1,4(a0)
    16a0:	4715                	li	a4,5
    16a2:	00550e93          	addi	t4,a0,5
    16a6:	12e78c63          	beq	a5,a4,17de <memset+0x19e>
    16aa:	00b502a3          	sb	a1,5(a0)
    16ae:	471d                	li	a4,7
    16b0:	00650e93          	addi	t4,a0,6
    16b4:	12e79763          	bne	a5,a4,17e2 <memset+0x1a2>
    16b8:	00750e93          	addi	t4,a0,7
    16bc:	00b50323          	sb	a1,6(a0)
    16c0:	4f1d                	li	t5,7
    16c2:	00859713          	slli	a4,a1,0x8
    16c6:	8f4d                	or	a4,a4,a1
    16c8:	01059e13          	slli	t3,a1,0x10
    16cc:	01c76e33          	or	t3,a4,t3
    16d0:	01859313          	slli	t1,a1,0x18
    16d4:	006e6333          	or	t1,t3,t1
    16d8:	02059893          	slli	a7,a1,0x20
    16dc:	011368b3          	or	a7,t1,a7
    16e0:	02859813          	slli	a6,a1,0x28
    16e4:	40f60333          	sub	t1,a2,a5
    16e8:	0108e833          	or	a6,a7,a6
    16ec:	03059693          	slli	a3,a1,0x30
    16f0:	00d866b3          	or	a3,a6,a3
    16f4:	03859713          	slli	a4,a1,0x38
    16f8:	97aa                	add	a5,a5,a0
    16fa:	ff837813          	andi	a6,t1,-8
    16fe:	8f55                	or	a4,a4,a3
    1700:	00f806b3          	add	a3,a6,a5
    1704:	e398                	sd	a4,0(a5)
    1706:	07a1                	addi	a5,a5,8
    1708:	fed79ee3          	bne	a5,a3,1704 <memset+0xc4>
    170c:	ff837693          	andi	a3,t1,-8
    1710:	00de87b3          	add	a5,t4,a3
    1714:	01e6873b          	addw	a4,a3,t5
    1718:	0ad30663          	beq	t1,a3,17c4 <memset+0x184>
    171c:	00b78023          	sb	a1,0(a5)
    1720:	0017069b          	addiw	a3,a4,1
    1724:	08c6fb63          	bleu	a2,a3,17ba <memset+0x17a>
    1728:	00b780a3          	sb	a1,1(a5)
    172c:	0027069b          	addiw	a3,a4,2
    1730:	08c6f563          	bleu	a2,a3,17ba <memset+0x17a>
    1734:	00b78123          	sb	a1,2(a5)
    1738:	0037069b          	addiw	a3,a4,3
    173c:	06c6ff63          	bleu	a2,a3,17ba <memset+0x17a>
    1740:	00b781a3          	sb	a1,3(a5)
    1744:	0047069b          	addiw	a3,a4,4
    1748:	06c6f963          	bleu	a2,a3,17ba <memset+0x17a>
    174c:	00b78223          	sb	a1,4(a5)
    1750:	0057069b          	addiw	a3,a4,5
    1754:	06c6f363          	bleu	a2,a3,17ba <memset+0x17a>
    1758:	00b782a3          	sb	a1,5(a5)
    175c:	0067069b          	addiw	a3,a4,6
    1760:	04c6fd63          	bleu	a2,a3,17ba <memset+0x17a>
    1764:	00b78323          	sb	a1,6(a5)
    1768:	0077069b          	addiw	a3,a4,7
    176c:	04c6f763          	bleu	a2,a3,17ba <memset+0x17a>
    1770:	00b783a3          	sb	a1,7(a5)
    1774:	0087069b          	addiw	a3,a4,8
    1778:	04c6f163          	bleu	a2,a3,17ba <memset+0x17a>
    177c:	00b78423          	sb	a1,8(a5)
    1780:	0097069b          	addiw	a3,a4,9
    1784:	02c6fb63          	bleu	a2,a3,17ba <memset+0x17a>
    1788:	00b784a3          	sb	a1,9(a5)
    178c:	00a7069b          	addiw	a3,a4,10
    1790:	02c6f563          	bleu	a2,a3,17ba <memset+0x17a>
    1794:	00b78523          	sb	a1,10(a5)
    1798:	00b7069b          	addiw	a3,a4,11
    179c:	00c6ff63          	bleu	a2,a3,17ba <memset+0x17a>
    17a0:	00b785a3          	sb	a1,11(a5)
    17a4:	00c7069b          	addiw	a3,a4,12
    17a8:	00c6f963          	bleu	a2,a3,17ba <memset+0x17a>
    17ac:	00b78623          	sb	a1,12(a5)
    17b0:	2735                	addiw	a4,a4,13
    17b2:	00c77463          	bleu	a2,a4,17ba <memset+0x17a>
    17b6:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17ba:	8082                	ret
    17bc:	472d                	li	a4,11
    17be:	bd79                	j	165c <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17c0:	4f0d                	li	t5,3
    17c2:	b701                	j	16c2 <memset+0x82>
    17c4:	8082                	ret
    17c6:	4f05                	li	t5,1
    17c8:	bded                	j	16c2 <memset+0x82>
    17ca:	8eaa                	mv	t4,a0
    17cc:	4f01                	li	t5,0
    17ce:	bdd5                	j	16c2 <memset+0x82>
    17d0:	87aa                	mv	a5,a0
    17d2:	4701                	li	a4,0
    17d4:	b7a1                	j	171c <memset+0xdc>
    17d6:	4f09                	li	t5,2
    17d8:	b5ed                	j	16c2 <memset+0x82>
    17da:	4f11                	li	t5,4
    17dc:	b5dd                	j	16c2 <memset+0x82>
    17de:	4f15                	li	t5,5
    17e0:	b5cd                	j	16c2 <memset+0x82>
    17e2:	4f19                	li	t5,6
    17e4:	bdf9                	j	16c2 <memset+0x82>

00000000000017e6 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17e6:	00054703          	lbu	a4,0(a0)
    17ea:	0005c783          	lbu	a5,0(a1)
    17ee:	00e79b63          	bne	a5,a4,1804 <strcmp+0x1e>
    17f2:	cf89                	beqz	a5,180c <strcmp+0x26>
    17f4:	0505                	addi	a0,a0,1
    17f6:	0585                	addi	a1,a1,1
    17f8:	0005c783          	lbu	a5,0(a1)
    17fc:	00054703          	lbu	a4,0(a0)
    1800:	fef709e3          	beq	a4,a5,17f2 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1804:	0007051b          	sext.w	a0,a4
}
    1808:	9d1d                	subw	a0,a0,a5
    180a:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    180c:	4501                	li	a0,0
}
    180e:	9d1d                	subw	a0,a0,a5
    1810:	8082                	ret

0000000000001812 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1812:	c231                	beqz	a2,1856 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1814:	00054783          	lbu	a5,0(a0)
    1818:	0005c683          	lbu	a3,0(a1)
    181c:	c795                	beqz	a5,1848 <strncmp+0x36>
    181e:	ca85                	beqz	a3,184e <strncmp+0x3c>
    if (!n--)
    1820:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1822:	c615                	beqz	a2,184e <strncmp+0x3c>
    1824:	00150713          	addi	a4,a0,1
    1828:	9532                	add	a0,a0,a2
    182a:	00d78963          	beq	a5,a3,183c <strncmp+0x2a>
    182e:	a005                	j	184e <strncmp+0x3c>
    1830:	ce99                	beqz	a3,184e <strncmp+0x3c>
    1832:	00e50e63          	beq	a0,a4,184e <strncmp+0x3c>
    1836:	0705                	addi	a4,a4,1
    1838:	00d79b63          	bne	a5,a3,184e <strncmp+0x3c>
    183c:	00074783          	lbu	a5,0(a4)
    1840:	0585                	addi	a1,a1,1
    1842:	0005c683          	lbu	a3,0(a1)
    1846:	f7ed                	bnez	a5,1830 <strncmp+0x1e>
    1848:	4501                	li	a0,0
        ;
    return *l - *r;
    184a:	9d15                	subw	a0,a0,a3
    184c:	8082                	ret
    184e:	0007851b          	sext.w	a0,a5
    1852:	9d15                	subw	a0,a0,a3
    1854:	8082                	ret
        return 0;
    1856:	4501                	li	a0,0
}
    1858:	8082                	ret

000000000000185a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    185a:	00757793          	andi	a5,a0,7
    185e:	cfa1                	beqz	a5,18b6 <strlen+0x5c>
        if (!*s)
    1860:	00054783          	lbu	a5,0(a0)
    1864:	cbb9                	beqz	a5,18ba <strlen+0x60>
    1866:	87aa                	mv	a5,a0
    1868:	a021                	j	1870 <strlen+0x16>
    186a:	0007c703          	lbu	a4,0(a5)
    186e:	c329                	beqz	a4,18b0 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    1870:	0785                	addi	a5,a5,1
    1872:	0077f713          	andi	a4,a5,7
    1876:	fb75                	bnez	a4,186a <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    1878:	00001717          	auipc	a4,0x1
    187c:	81070713          	addi	a4,a4,-2032 # 2088 <__clone+0xd8>
    1880:	630c                	ld	a1,0(a4)
    1882:	00001717          	auipc	a4,0x1
    1886:	80e70713          	addi	a4,a4,-2034 # 2090 <__clone+0xe0>
    188a:	6394                	ld	a3,0(a5)
    188c:	6310                	ld	a2,0(a4)
    188e:	a019                	j	1894 <strlen+0x3a>
    1890:	07a1                	addi	a5,a5,8
    1892:	6394                	ld	a3,0(a5)
    1894:	00b68733          	add	a4,a3,a1
    1898:	fff6c693          	not	a3,a3
    189c:	8f75                	and	a4,a4,a3
    189e:	8f71                	and	a4,a4,a2
    18a0:	db65                	beqz	a4,1890 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18a2:	0007c703          	lbu	a4,0(a5)
    18a6:	c709                	beqz	a4,18b0 <strlen+0x56>
    18a8:	0785                	addi	a5,a5,1
    18aa:	0007c703          	lbu	a4,0(a5)
    18ae:	ff6d                	bnez	a4,18a8 <strlen+0x4e>
        ;
    return s - a;
    18b0:	40a78533          	sub	a0,a5,a0
}
    18b4:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18b6:	87aa                	mv	a5,a0
    18b8:	b7c1                	j	1878 <strlen+0x1e>
        if (!*s)
    18ba:	4501                	li	a0,0
            return s - a;
    18bc:	8082                	ret

00000000000018be <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18be:	00757793          	andi	a5,a0,7
    18c2:	0ff5f593          	andi	a1,a1,255
    18c6:	cb99                	beqz	a5,18dc <memchr+0x1e>
    18c8:	c655                	beqz	a2,1974 <memchr+0xb6>
    18ca:	00054783          	lbu	a5,0(a0)
    18ce:	0ab78663          	beq	a5,a1,197a <memchr+0xbc>
    18d2:	0505                	addi	a0,a0,1
    18d4:	00757793          	andi	a5,a0,7
    18d8:	167d                	addi	a2,a2,-1
    18da:	f7fd                	bnez	a5,18c8 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18dc:	4701                	li	a4,0
    if (n && *s != c)
    18de:	ca49                	beqz	a2,1970 <memchr+0xb2>
    18e0:	00054783          	lbu	a5,0(a0)
    18e4:	08b78b63          	beq	a5,a1,197a <memchr+0xbc>
        size_t k = ONES * c;
    18e8:	00000797          	auipc	a5,0x0
    18ec:	7b078793          	addi	a5,a5,1968 # 2098 <__clone+0xe8>
    18f0:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18f2:	479d                	li	a5,7
        size_t k = ONES * c;
    18f4:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18f8:	08c7f863          	bleu	a2,a5,1988 <memchr+0xca>
    18fc:	611c                	ld	a5,0(a0)
    18fe:	00000317          	auipc	t1,0x0
    1902:	79230313          	addi	t1,t1,1938 # 2090 <__clone+0xe0>
    1906:	00033803          	ld	a6,0(t1)
    190a:	00f8c7b3          	xor	a5,a7,a5
    190e:	fff7c713          	not	a4,a5
    1912:	8f95                	sub	a5,a5,a3
    1914:	8ff9                	and	a5,a5,a4
    1916:	0107f7b3          	and	a5,a5,a6
    191a:	e7bd                	bnez	a5,1988 <memchr+0xca>
    191c:	4e1d                	li	t3,7
    191e:	00000e97          	auipc	t4,0x0
    1922:	76ae8e93          	addi	t4,t4,1898 # 2088 <__clone+0xd8>
    1926:	a005                	j	1946 <memchr+0x88>
    1928:	6514                	ld	a3,8(a0)
    192a:	000eb783          	ld	a5,0(t4)
    192e:	00033803          	ld	a6,0(t1)
    1932:	00d8c6b3          	xor	a3,a7,a3
    1936:	97b6                	add	a5,a5,a3
    1938:	fff6c693          	not	a3,a3
    193c:	8ff5                	and	a5,a5,a3
    193e:	0107f7b3          	and	a5,a5,a6
    1942:	e3a1                	bnez	a5,1982 <memchr+0xc4>
    1944:	853a                	mv	a0,a4
    1946:	1661                	addi	a2,a2,-8
    1948:	00850713          	addi	a4,a0,8
    194c:	fcce6ee3          	bltu	t3,a2,1928 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1950:	c215                	beqz	a2,1974 <memchr+0xb6>
    1952:	00074783          	lbu	a5,0(a4)
    1956:	00f58d63          	beq	a1,a5,1970 <memchr+0xb2>
    195a:	00170793          	addi	a5,a4,1
    195e:	963a                	add	a2,a2,a4
    1960:	873e                	mv	a4,a5
    1962:	00f60963          	beq	a2,a5,1974 <memchr+0xb6>
    1966:	0007c683          	lbu	a3,0(a5)
    196a:	0785                	addi	a5,a5,1
    196c:	feb69ae3          	bne	a3,a1,1960 <memchr+0xa2>
}
    1970:	853a                	mv	a0,a4
    1972:	8082                	ret
    return n ? (void *)s : 0;
    1974:	4701                	li	a4,0
}
    1976:	853a                	mv	a0,a4
    1978:	8082                	ret
    197a:	872a                	mv	a4,a0
    197c:	00074783          	lbu	a5,0(a4)
    1980:	bfd9                	j	1956 <memchr+0x98>
    1982:	00854783          	lbu	a5,8(a0)
    1986:	bfc1                	j	1956 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1988:	872a                	mv	a4,a0
    198a:	bfc1                	j	195a <memchr+0x9c>

000000000000198c <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    198c:	00757793          	andi	a5,a0,7
    1990:	cfc5                	beqz	a5,1a48 <strnlen+0xbc>
    1992:	c1c5                	beqz	a1,1a32 <strnlen+0xa6>
    1994:	00054783          	lbu	a5,0(a0)
    1998:	cfd9                	beqz	a5,1a36 <strnlen+0xaa>
    199a:	87ae                	mv	a5,a1
    199c:	86aa                	mv	a3,a0
    199e:	a029                	j	19a8 <strnlen+0x1c>
    19a0:	cbc9                	beqz	a5,1a32 <strnlen+0xa6>
    19a2:	0006c703          	lbu	a4,0(a3)
    19a6:	cb51                	beqz	a4,1a3a <strnlen+0xae>
    19a8:	0685                	addi	a3,a3,1
    19aa:	0076f713          	andi	a4,a3,7
    19ae:	17fd                	addi	a5,a5,-1
    19b0:	fb65                	bnez	a4,19a0 <strnlen+0x14>
    if (n && *s != c)
    19b2:	c3c1                	beqz	a5,1a32 <strnlen+0xa6>
    19b4:	0006c703          	lbu	a4,0(a3)
    19b8:	c349                	beqz	a4,1a3a <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19ba:	471d                	li	a4,7
    19bc:	08f77a63          	bleu	a5,a4,1a50 <strnlen+0xc4>
    19c0:	00000e17          	auipc	t3,0x0
    19c4:	6c8e0e13          	addi	t3,t3,1736 # 2088 <__clone+0xd8>
    19c8:	6290                	ld	a2,0(a3)
    19ca:	000e3703          	ld	a4,0(t3)
    19ce:	00000e97          	auipc	t4,0x0
    19d2:	6c2e8e93          	addi	t4,t4,1730 # 2090 <__clone+0xe0>
    19d6:	000eb803          	ld	a6,0(t4)
    19da:	9732                	add	a4,a4,a2
    19dc:	fff64613          	not	a2,a2
    19e0:	8f71                	and	a4,a4,a2
    19e2:	01077733          	and	a4,a4,a6
    19e6:	e72d                	bnez	a4,1a50 <strnlen+0xc4>
    19e8:	4f1d                	li	t5,7
    19ea:	a839                	j	1a08 <strnlen+0x7c>
    19ec:	6698                	ld	a4,8(a3)
    19ee:	000e3303          	ld	t1,0(t3)
    19f2:	000eb803          	ld	a6,0(t4)
    19f6:	fff74893          	not	a7,a4
    19fa:	971a                	add	a4,a4,t1
    19fc:	01177733          	and	a4,a4,a7
    1a00:	01077733          	and	a4,a4,a6
    1a04:	ef1d                	bnez	a4,1a42 <strnlen+0xb6>
    1a06:	86b2                	mv	a3,a2
    1a08:	17e1                	addi	a5,a5,-8
    1a0a:	00868613          	addi	a2,a3,8
    1a0e:	fcff6fe3          	bltu	t5,a5,19ec <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a12:	c385                	beqz	a5,1a32 <strnlen+0xa6>
    1a14:	00064703          	lbu	a4,0(a2)
    1a18:	cb19                	beqz	a4,1a2e <strnlen+0xa2>
    1a1a:	00160713          	addi	a4,a2,1
    1a1e:	97b2                	add	a5,a5,a2
    1a20:	863a                	mv	a2,a4
    1a22:	00e78863          	beq	a5,a4,1a32 <strnlen+0xa6>
    1a26:	0705                	addi	a4,a4,1
    1a28:	fff74683          	lbu	a3,-1(a4)
    1a2c:	faf5                	bnez	a3,1a20 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a2e:	40a605b3          	sub	a1,a2,a0
}
    1a32:	852e                	mv	a0,a1
    1a34:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a36:	87ae                	mv	a5,a1
    1a38:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a3a:	8636                	mv	a2,a3
    1a3c:	00064703          	lbu	a4,0(a2)
    1a40:	bfe1                	j	1a18 <strnlen+0x8c>
    1a42:	0086c703          	lbu	a4,8(a3)
    1a46:	bfc9                	j	1a18 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a48:	87ae                	mv	a5,a1
    1a4a:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a4c:	f7a5                	bnez	a5,19b4 <strnlen+0x28>
    1a4e:	b7d5                	j	1a32 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a50:	8636                	mv	a2,a3
    1a52:	b7e1                	j	1a1a <strnlen+0x8e>

0000000000001a54 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a54:	00b547b3          	xor	a5,a0,a1
    1a58:	8b9d                	andi	a5,a5,7
    1a5a:	efa9                	bnez	a5,1ab4 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a5c:	0075f793          	andi	a5,a1,7
    1a60:	c38d                	beqz	a5,1a82 <strcpy+0x2e>
            if (!(*d = *s))
    1a62:	0005c783          	lbu	a5,0(a1)
    1a66:	00f50023          	sb	a5,0(a0)
    1a6a:	e799                	bnez	a5,1a78 <strcpy+0x24>
    1a6c:	a095                	j	1ad0 <strcpy+0x7c>
    1a6e:	0005c783          	lbu	a5,0(a1)
    1a72:	00f50023          	sb	a5,0(a0)
    1a76:	cbb9                	beqz	a5,1acc <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a78:	0585                	addi	a1,a1,1
    1a7a:	0075f793          	andi	a5,a1,7
    1a7e:	0505                	addi	a0,a0,1
    1a80:	f7fd                	bnez	a5,1a6e <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a82:	00000797          	auipc	a5,0x0
    1a86:	60678793          	addi	a5,a5,1542 # 2088 <__clone+0xd8>
    1a8a:	0007b803          	ld	a6,0(a5)
    1a8e:	00000797          	auipc	a5,0x0
    1a92:	60278793          	addi	a5,a5,1538 # 2090 <__clone+0xe0>
    1a96:	6198                	ld	a4,0(a1)
    1a98:	6390                	ld	a2,0(a5)
    1a9a:	a031                	j	1aa6 <strcpy+0x52>
    1a9c:	0521                	addi	a0,a0,8
    1a9e:	05a1                	addi	a1,a1,8
    1aa0:	fee53c23          	sd	a4,-8(a0)
    1aa4:	6198                	ld	a4,0(a1)
    1aa6:	010707b3          	add	a5,a4,a6
    1aaa:	fff74693          	not	a3,a4
    1aae:	8ff5                	and	a5,a5,a3
    1ab0:	8ff1                	and	a5,a5,a2
    1ab2:	d7ed                	beqz	a5,1a9c <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ab4:	0005c783          	lbu	a5,0(a1)
    1ab8:	00f50023          	sb	a5,0(a0)
    1abc:	cb89                	beqz	a5,1ace <strcpy+0x7a>
    1abe:	0585                	addi	a1,a1,1
    1ac0:	0005c783          	lbu	a5,0(a1)
    1ac4:	0505                	addi	a0,a0,1
    1ac6:	00f50023          	sb	a5,0(a0)
    1aca:	fbf5                	bnez	a5,1abe <strcpy+0x6a>
        ;
    return d;
}
    1acc:	8082                	ret
    1ace:	8082                	ret
    1ad0:	8082                	ret

0000000000001ad2 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ad2:	00b547b3          	xor	a5,a0,a1
    1ad6:	8b9d                	andi	a5,a5,7
    1ad8:	ebc1                	bnez	a5,1b68 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ada:	0075f793          	andi	a5,a1,7
    1ade:	cf91                	beqz	a5,1afa <strncpy+0x28>
    1ae0:	20060e63          	beqz	a2,1cfc <strncpy+0x22a>
    1ae4:	0005c783          	lbu	a5,0(a1)
    1ae8:	00f50023          	sb	a5,0(a0)
    1aec:	c3d5                	beqz	a5,1b90 <strncpy+0xbe>
    1aee:	0585                	addi	a1,a1,1
    1af0:	0075f793          	andi	a5,a1,7
    1af4:	167d                	addi	a2,a2,-1
    1af6:	0505                	addi	a0,a0,1
    1af8:	f7e5                	bnez	a5,1ae0 <strncpy+0xe>
            ;
        if (!n || !*s)
    1afa:	20060163          	beqz	a2,1cfc <strncpy+0x22a>
    1afe:	0005c683          	lbu	a3,0(a1)
    1b02:	c6d9                	beqz	a3,1b90 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b04:	479d                	li	a5,7
    1b06:	22c7f563          	bleu	a2,a5,1d30 <strncpy+0x25e>
    1b0a:	00000317          	auipc	t1,0x0
    1b0e:	57e30313          	addi	t1,t1,1406 # 2088 <__clone+0xd8>
    1b12:	6198                	ld	a4,0(a1)
    1b14:	00033783          	ld	a5,0(t1)
    1b18:	00000e17          	auipc	t3,0x0
    1b1c:	578e0e13          	addi	t3,t3,1400 # 2090 <__clone+0xe0>
    1b20:	000e3803          	ld	a6,0(t3)
    1b24:	97ba                	add	a5,a5,a4
    1b26:	fff74893          	not	a7,a4
    1b2a:	0117f7b3          	and	a5,a5,a7
    1b2e:	0107f7b3          	and	a5,a5,a6
    1b32:	1e079f63          	bnez	a5,1d30 <strncpy+0x25e>
    1b36:	4e9d                	li	t4,7
    1b38:	a005                	j	1b58 <strncpy+0x86>
    1b3a:	6598                	ld	a4,8(a1)
    1b3c:	00033783          	ld	a5,0(t1)
    1b40:	000e3803          	ld	a6,0(t3)
    1b44:	fff74893          	not	a7,a4
    1b48:	97ba                	add	a5,a5,a4
    1b4a:	0117f7b3          	and	a5,a5,a7
    1b4e:	0107f7b3          	and	a5,a5,a6
    1b52:	1a079f63          	bnez	a5,1d10 <strncpy+0x23e>
    1b56:	85b6                	mv	a1,a3
            *wd = *ws;
    1b58:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b5a:	1661                	addi	a2,a2,-8
    1b5c:	00858693          	addi	a3,a1,8
    1b60:	0521                	addi	a0,a0,8
    1b62:	fcceece3          	bltu	t4,a2,1b3a <strncpy+0x68>
    1b66:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b68:	18060a63          	beqz	a2,1cfc <strncpy+0x22a>
    1b6c:	0005c783          	lbu	a5,0(a1)
    1b70:	872a                	mv	a4,a0
    1b72:	00f50023          	sb	a5,0(a0)
    1b76:	e799                	bnez	a5,1b84 <strncpy+0xb2>
    1b78:	a829                	j	1b92 <strncpy+0xc0>
    1b7a:	0005c783          	lbu	a5,0(a1)
    1b7e:	00f70023          	sb	a5,0(a4)
    1b82:	cb81                	beqz	a5,1b92 <strncpy+0xc0>
    1b84:	167d                	addi	a2,a2,-1
    1b86:	0585                	addi	a1,a1,1
    1b88:	0705                	addi	a4,a4,1
    1b8a:	fa65                	bnez	a2,1b7a <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b8c:	853a                	mv	a0,a4
    1b8e:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1b90:	872a                	mv	a4,a0
    1b92:	4805                	li	a6,1
    1b94:	14061c63          	bnez	a2,1cec <strncpy+0x21a>
    1b98:	40e007b3          	neg	a5,a4
    1b9c:	8b9d                	andi	a5,a5,7
    1b9e:	4581                	li	a1,0
    1ba0:	12061e63          	bnez	a2,1cdc <strncpy+0x20a>
    1ba4:	00778693          	addi	a3,a5,7
    1ba8:	452d                	li	a0,11
    1baa:	12a6e763          	bltu	a3,a0,1cd8 <strncpy+0x206>
    1bae:	16d5e663          	bltu	a1,a3,1d1a <strncpy+0x248>
    1bb2:	14078c63          	beqz	a5,1d0a <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bb6:	00070023          	sb	zero,0(a4)
    1bba:	4585                	li	a1,1
    1bbc:	00170693          	addi	a3,a4,1
    1bc0:	14b78363          	beq	a5,a1,1d06 <strncpy+0x234>
    1bc4:	000700a3          	sb	zero,1(a4)
    1bc8:	4589                	li	a1,2
    1bca:	00270693          	addi	a3,a4,2
    1bce:	14b78963          	beq	a5,a1,1d20 <strncpy+0x24e>
    1bd2:	00070123          	sb	zero,2(a4)
    1bd6:	458d                	li	a1,3
    1bd8:	00370693          	addi	a3,a4,3
    1bdc:	12b78363          	beq	a5,a1,1d02 <strncpy+0x230>
    1be0:	000701a3          	sb	zero,3(a4)
    1be4:	4591                	li	a1,4
    1be6:	00470693          	addi	a3,a4,4
    1bea:	12b78d63          	beq	a5,a1,1d24 <strncpy+0x252>
    1bee:	00070223          	sb	zero,4(a4)
    1bf2:	4595                	li	a1,5
    1bf4:	00570693          	addi	a3,a4,5
    1bf8:	12b78863          	beq	a5,a1,1d28 <strncpy+0x256>
    1bfc:	000702a3          	sb	zero,5(a4)
    1c00:	459d                	li	a1,7
    1c02:	00670693          	addi	a3,a4,6
    1c06:	12b79363          	bne	a5,a1,1d2c <strncpy+0x25a>
    1c0a:	00770693          	addi	a3,a4,7
    1c0e:	00070323          	sb	zero,6(a4)
    1c12:	40f80833          	sub	a6,a6,a5
    1c16:	ff887513          	andi	a0,a6,-8
    1c1a:	97ba                	add	a5,a5,a4
    1c1c:	953e                	add	a0,a0,a5
    1c1e:	0007b023          	sd	zero,0(a5)
    1c22:	07a1                	addi	a5,a5,8
    1c24:	fea79de3          	bne	a5,a0,1c1e <strncpy+0x14c>
    1c28:	ff887513          	andi	a0,a6,-8
    1c2c:	9da9                	addw	a1,a1,a0
    1c2e:	00a687b3          	add	a5,a3,a0
    1c32:	f4a80de3          	beq	a6,a0,1b8c <strncpy+0xba>
    1c36:	00078023          	sb	zero,0(a5)
    1c3a:	0015869b          	addiw	a3,a1,1
    1c3e:	f4c6f7e3          	bleu	a2,a3,1b8c <strncpy+0xba>
    1c42:	000780a3          	sb	zero,1(a5)
    1c46:	0025869b          	addiw	a3,a1,2
    1c4a:	f4c6f1e3          	bleu	a2,a3,1b8c <strncpy+0xba>
    1c4e:	00078123          	sb	zero,2(a5)
    1c52:	0035869b          	addiw	a3,a1,3
    1c56:	f2c6fbe3          	bleu	a2,a3,1b8c <strncpy+0xba>
    1c5a:	000781a3          	sb	zero,3(a5)
    1c5e:	0045869b          	addiw	a3,a1,4
    1c62:	f2c6f5e3          	bleu	a2,a3,1b8c <strncpy+0xba>
    1c66:	00078223          	sb	zero,4(a5)
    1c6a:	0055869b          	addiw	a3,a1,5
    1c6e:	f0c6ffe3          	bleu	a2,a3,1b8c <strncpy+0xba>
    1c72:	000782a3          	sb	zero,5(a5)
    1c76:	0065869b          	addiw	a3,a1,6
    1c7a:	f0c6f9e3          	bleu	a2,a3,1b8c <strncpy+0xba>
    1c7e:	00078323          	sb	zero,6(a5)
    1c82:	0075869b          	addiw	a3,a1,7
    1c86:	f0c6f3e3          	bleu	a2,a3,1b8c <strncpy+0xba>
    1c8a:	000783a3          	sb	zero,7(a5)
    1c8e:	0085869b          	addiw	a3,a1,8
    1c92:	eec6fde3          	bleu	a2,a3,1b8c <strncpy+0xba>
    1c96:	00078423          	sb	zero,8(a5)
    1c9a:	0095869b          	addiw	a3,a1,9
    1c9e:	eec6f7e3          	bleu	a2,a3,1b8c <strncpy+0xba>
    1ca2:	000784a3          	sb	zero,9(a5)
    1ca6:	00a5869b          	addiw	a3,a1,10
    1caa:	eec6f1e3          	bleu	a2,a3,1b8c <strncpy+0xba>
    1cae:	00078523          	sb	zero,10(a5)
    1cb2:	00b5869b          	addiw	a3,a1,11
    1cb6:	ecc6fbe3          	bleu	a2,a3,1b8c <strncpy+0xba>
    1cba:	000785a3          	sb	zero,11(a5)
    1cbe:	00c5869b          	addiw	a3,a1,12
    1cc2:	ecc6f5e3          	bleu	a2,a3,1b8c <strncpy+0xba>
    1cc6:	00078623          	sb	zero,12(a5)
    1cca:	25b5                	addiw	a1,a1,13
    1ccc:	ecc5f0e3          	bleu	a2,a1,1b8c <strncpy+0xba>
    1cd0:	000786a3          	sb	zero,13(a5)
}
    1cd4:	853a                	mv	a0,a4
    1cd6:	8082                	ret
    1cd8:	46ad                	li	a3,11
    1cda:	bdd1                	j	1bae <strncpy+0xdc>
    1cdc:	00778693          	addi	a3,a5,7
    1ce0:	452d                	li	a0,11
    1ce2:	fff60593          	addi	a1,a2,-1
    1ce6:	eca6f4e3          	bleu	a0,a3,1bae <strncpy+0xdc>
    1cea:	b7fd                	j	1cd8 <strncpy+0x206>
    1cec:	40e007b3          	neg	a5,a4
    1cf0:	8832                	mv	a6,a2
    1cf2:	8b9d                	andi	a5,a5,7
    1cf4:	4581                	li	a1,0
    1cf6:	ea0607e3          	beqz	a2,1ba4 <strncpy+0xd2>
    1cfa:	b7cd                	j	1cdc <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1cfc:	872a                	mv	a4,a0
}
    1cfe:	853a                	mv	a0,a4
    1d00:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d02:	458d                	li	a1,3
    1d04:	b739                	j	1c12 <strncpy+0x140>
    1d06:	4585                	li	a1,1
    1d08:	b729                	j	1c12 <strncpy+0x140>
    1d0a:	86ba                	mv	a3,a4
    1d0c:	4581                	li	a1,0
    1d0e:	b711                	j	1c12 <strncpy+0x140>
    1d10:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d14:	872a                	mv	a4,a0
    1d16:	85b6                	mv	a1,a3
    1d18:	bda9                	j	1b72 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d1a:	87ba                	mv	a5,a4
    1d1c:	4581                	li	a1,0
    1d1e:	bf21                	j	1c36 <strncpy+0x164>
    1d20:	4589                	li	a1,2
    1d22:	bdc5                	j	1c12 <strncpy+0x140>
    1d24:	4591                	li	a1,4
    1d26:	b5f5                	j	1c12 <strncpy+0x140>
    1d28:	4595                	li	a1,5
    1d2a:	b5e5                	j	1c12 <strncpy+0x140>
    1d2c:	4599                	li	a1,6
    1d2e:	b5d5                	j	1c12 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d30:	00d50023          	sb	a3,0(a0)
    1d34:	872a                	mv	a4,a0
    1d36:	b5b9                	j	1b84 <strncpy+0xb2>

0000000000001d38 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d38:	87aa                	mv	a5,a0
    1d3a:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d3c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d40:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d44:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d46:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d48:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d4c:	2501                	sext.w	a0,a0
    1d4e:	8082                	ret

0000000000001d50 <openat>:
    register long a7 __asm__("a7") = n;
    1d50:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d54:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d58:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d5c:	2501                	sext.w	a0,a0
    1d5e:	8082                	ret

0000000000001d60 <close>:
    register long a7 __asm__("a7") = n;
    1d60:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d64:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d68:	2501                	sext.w	a0,a0
    1d6a:	8082                	ret

0000000000001d6c <read>:
    register long a7 __asm__("a7") = n;
    1d6c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d70:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d74:	8082                	ret

0000000000001d76 <write>:
    register long a7 __asm__("a7") = n;
    1d76:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d7e:	8082                	ret

0000000000001d80 <getpid>:
    register long a7 __asm__("a7") = n;
    1d80:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d84:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <getppid>:
    register long a7 __asm__("a7") = n;
    1d8c:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d90:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d94:	2501                	sext.w	a0,a0
    1d96:	8082                	ret

0000000000001d98 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d98:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d9c:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <fork>:
    register long a7 __asm__("a7") = n;
    1da4:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1da8:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1daa:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dac:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1db0:	2501                	sext.w	a0,a0
    1db2:	8082                	ret

0000000000001db4 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1db4:	85b2                	mv	a1,a2
    1db6:	863a                	mv	a2,a4
    if (stack)
    1db8:	c191                	beqz	a1,1dbc <clone+0x8>
	stack += stack_size;
    1dba:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dbc:	4781                	li	a5,0
    1dbe:	4701                	li	a4,0
    1dc0:	4681                	li	a3,0
    1dc2:	2601                	sext.w	a2,a2
    1dc4:	1ec0006f          	j	1fb0 <__clone>

0000000000001dc8 <exit>:
    register long a7 __asm__("a7") = n;
    1dc8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dcc:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dd0:	8082                	ret

0000000000001dd2 <waitpid>:
    register long a7 __asm__("a7") = n;
    1dd2:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1dd6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dd8:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <exec>:
    register long a7 __asm__("a7") = n;
    1de0:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1de4:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <execve>:
    register long a7 __asm__("a7") = n;
    1dec:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df0:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1df4:	2501                	sext.w	a0,a0
    1df6:	8082                	ret

0000000000001df8 <times>:
    register long a7 __asm__("a7") = n;
    1df8:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1dfc:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <get_time>:

int64 get_time()
{
    1e04:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e06:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e0a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e0c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e0e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e12:	2501                	sext.w	a0,a0
    1e14:	ed09                	bnez	a0,1e2e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e16:	67a2                	ld	a5,8(sp)
    1e18:	3e800713          	li	a4,1000
    1e1c:	00015503          	lhu	a0,0(sp)
    1e20:	02e7d7b3          	divu	a5,a5,a4
    1e24:	02e50533          	mul	a0,a0,a4
    1e28:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e2a:	0141                	addi	sp,sp,16
    1e2c:	8082                	ret
        return -1;
    1e2e:	557d                	li	a0,-1
    1e30:	bfed                	j	1e2a <get_time+0x26>

0000000000001e32 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e32:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e36:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e3a:	2501                	sext.w	a0,a0
    1e3c:	8082                	ret

0000000000001e3e <time>:
    register long a7 __asm__("a7") = n;
    1e3e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e42:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e46:	2501                	sext.w	a0,a0
    1e48:	8082                	ret

0000000000001e4a <sleep>:

int sleep(unsigned long long time)
{
    1e4a:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e4c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e4e:	850a                	mv	a0,sp
    1e50:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e52:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e56:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e58:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e5c:	e501                	bnez	a0,1e64 <sleep+0x1a>
    return 0;
    1e5e:	4501                	li	a0,0
}
    1e60:	0141                	addi	sp,sp,16
    1e62:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e64:	4502                	lw	a0,0(sp)
}
    1e66:	0141                	addi	sp,sp,16
    1e68:	8082                	ret

0000000000001e6a <set_priority>:
    register long a7 __asm__("a7") = n;
    1e6a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e6e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e72:	2501                	sext.w	a0,a0
    1e74:	8082                	ret

0000000000001e76 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e76:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e7a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e7e:	8082                	ret

0000000000001e80 <munmap>:
    register long a7 __asm__("a7") = n;
    1e80:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e84:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e88:	2501                	sext.w	a0,a0
    1e8a:	8082                	ret

0000000000001e8c <wait>:

int wait(int *code)
{
    1e8c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e8e:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e92:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e94:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e96:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e98:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <spawn>:
    register long a7 __asm__("a7") = n;
    1ea0:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ea4:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <mailread>:
    register long a7 __asm__("a7") = n;
    1eac:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb0:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1eb8:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ebc:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ec0:	2501                	sext.w	a0,a0
    1ec2:	8082                	ret

0000000000001ec4 <fstat>:
    register long a7 __asm__("a7") = n;
    1ec4:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec8:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ed0:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ed2:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ed6:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ed8:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1edc:	2501                	sext.w	a0,a0
    1ede:	8082                	ret

0000000000001ee0 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ee0:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ee2:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ee6:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee8:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1eec:	2501                	sext.w	a0,a0
    1eee:	8082                	ret

0000000000001ef0 <link>:

int link(char *old_path, char *new_path)
{
    1ef0:	87aa                	mv	a5,a0
    1ef2:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1ef4:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1ef8:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1efc:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1efe:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f02:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f04:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f08:	2501                	sext.w	a0,a0
    1f0a:	8082                	ret

0000000000001f0c <unlink>:

int unlink(char *path)
{
    1f0c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f0e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f12:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f16:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f18:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <uname>:
    register long a7 __asm__("a7") = n;
    1f20:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f24:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f28:	2501                	sext.w	a0,a0
    1f2a:	8082                	ret

0000000000001f2c <brk>:
    register long a7 __asm__("a7") = n;
    1f2c:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f30:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f34:	2501                	sext.w	a0,a0
    1f36:	8082                	ret

0000000000001f38 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f38:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f3a:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f3e:	8082                	ret

0000000000001f40 <chdir>:
    register long a7 __asm__("a7") = n;
    1f40:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f44:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f48:	2501                	sext.w	a0,a0
    1f4a:	8082                	ret

0000000000001f4c <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f4c:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f4e:	02059613          	slli	a2,a1,0x20
    1f52:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f54:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f58:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f5c:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f5e:	00000073          	ecall
}
    1f62:	2501                	sext.w	a0,a0
    1f64:	8082                	ret

0000000000001f66 <getdents>:
    register long a7 __asm__("a7") = n;
    1f66:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f6a:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f6e:	2501                	sext.w	a0,a0
    1f70:	8082                	ret

0000000000001f72 <pipe>:
    register long a7 __asm__("a7") = n;
    1f72:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f76:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f78:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f7c:	2501                	sext.w	a0,a0
    1f7e:	8082                	ret

0000000000001f80 <dup>:
    register long a7 __asm__("a7") = n;
    1f80:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f82:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f86:	2501                	sext.w	a0,a0
    1f88:	8082                	ret

0000000000001f8a <dup2>:
    register long a7 __asm__("a7") = n;
    1f8a:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f8c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f8e:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f92:	2501                	sext.w	a0,a0
    1f94:	8082                	ret

0000000000001f96 <mount>:
    register long a7 __asm__("a7") = n;
    1f96:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f9a:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f9e:	2501                	sext.w	a0,a0
    1fa0:	8082                	ret

0000000000001fa2 <umount>:
    register long a7 __asm__("a7") = n;
    1fa2:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fa6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fa8:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fac:	2501                	sext.w	a0,a0
    1fae:	8082                	ret

0000000000001fb0 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fb0:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fb2:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fb4:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fb6:	8532                	mv	a0,a2
	mv a2, a4
    1fb8:	863a                	mv	a2,a4
	mv a3, a5
    1fba:	86be                	mv	a3,a5
	mv a4, a6
    1fbc:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fbe:	0dc00893          	li	a7,220
	ecall
    1fc2:	00000073          	ecall

	beqz a0, 1f
    1fc6:	c111                	beqz	a0,1fca <__clone+0x1a>
	# Parent
	ret
    1fc8:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fca:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fcc:	6522                	ld	a0,8(sp)
	jalr a1
    1fce:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fd0:	05d00893          	li	a7,93
	ecall
    1fd4:	00000073          	ecall
