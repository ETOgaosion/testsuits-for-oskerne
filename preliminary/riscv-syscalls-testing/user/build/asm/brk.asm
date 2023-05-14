
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/brk:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0b80006f          	j	10ba <__start_main>

0000000000001006 <test_brk>:
 * "After alloc,heap pos: [num+64]"
 * "Alloc again,heap pos: [num+128]"
 * 
 * Linux 中brk(0)只返回0，此处与Linux表现不同，应特殊说明。
 */
void test_brk(){
    1006:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	fd850513          	addi	a0,a0,-40 # 1fe0 <__clone+0x2a>
void test_brk(){
    1010:	ec06                	sd	ra,24(sp)
    1012:	e822                	sd	s0,16(sp)
    1014:	e426                	sd	s1,8(sp)
    TEST_START(__func__);
    1016:	00001417          	auipc	s0,0x1
    101a:	08240413          	addi	s0,s0,130 # 2098 <__func__.1211>
    101e:	29c000ef          	jal	ra,12ba <puts>
    1022:	8522                	mv	a0,s0
    1024:	296000ef          	jal	ra,12ba <puts>
    1028:	00001517          	auipc	a0,0x1
    102c:	fd050513          	addi	a0,a0,-48 # 1ff8 <__clone+0x42>
    1030:	28a000ef          	jal	ra,12ba <puts>
    intptr_t cur_pos, alloc_pos, alloc_pos_1;

    cur_pos = brk(0);
    1034:	4501                	li	a0,0
    1036:	6fd000ef          	jal	ra,1f32 <brk>
    printf("Before alloc,heap pos: %d\n", cur_pos);
    103a:	85aa                	mv	a1,a0
    cur_pos = brk(0);
    103c:	84aa                	mv	s1,a0
    printf("Before alloc,heap pos: %d\n", cur_pos);
    103e:	00001517          	auipc	a0,0x1
    1042:	fca50513          	addi	a0,a0,-54 # 2008 <__clone+0x52>
    1046:	296000ef          	jal	ra,12dc <printf>
    brk(cur_pos + 64);
    104a:	04048513          	addi	a0,s1,64
    104e:	6e5000ef          	jal	ra,1f32 <brk>
    alloc_pos = brk(0);
    1052:	4501                	li	a0,0
    1054:	6df000ef          	jal	ra,1f32 <brk>
    printf("After alloc,heap pos: %d\n",alloc_pos);
    1058:	85aa                	mv	a1,a0
    alloc_pos = brk(0);
    105a:	84aa                	mv	s1,a0
    printf("After alloc,heap pos: %d\n",alloc_pos);
    105c:	00001517          	auipc	a0,0x1
    1060:	fcc50513          	addi	a0,a0,-52 # 2028 <__clone+0x72>
    1064:	278000ef          	jal	ra,12dc <printf>
    brk(alloc_pos + 64);
    1068:	04048513          	addi	a0,s1,64
    106c:	6c7000ef          	jal	ra,1f32 <brk>
    alloc_pos_1 = brk(0);
    1070:	4501                	li	a0,0
    1072:	6c1000ef          	jal	ra,1f32 <brk>
    printf("Alloc again,heap pos: %d\n",alloc_pos_1);
    1076:	85aa                	mv	a1,a0
    1078:	00001517          	auipc	a0,0x1
    107c:	fd050513          	addi	a0,a0,-48 # 2048 <__clone+0x92>
    1080:	25c000ef          	jal	ra,12dc <printf>
    TEST_END(__func__);
    1084:	00001517          	auipc	a0,0x1
    1088:	fe450513          	addi	a0,a0,-28 # 2068 <__clone+0xb2>
    108c:	22e000ef          	jal	ra,12ba <puts>
    1090:	8522                	mv	a0,s0
    1092:	228000ef          	jal	ra,12ba <puts>
}
    1096:	6442                	ld	s0,16(sp)
    1098:	60e2                	ld	ra,24(sp)
    109a:	64a2                	ld	s1,8(sp)
    TEST_END(__func__);
    109c:	00001517          	auipc	a0,0x1
    10a0:	f5c50513          	addi	a0,a0,-164 # 1ff8 <__clone+0x42>
}
    10a4:	6105                	addi	sp,sp,32
    TEST_END(__func__);
    10a6:	2140006f          	j	12ba <puts>

00000000000010aa <main>:

int main(void) {
    10aa:	1141                	addi	sp,sp,-16
    10ac:	e406                	sd	ra,8(sp)
    test_brk();
    10ae:	f59ff0ef          	jal	ra,1006 <test_brk>
    return 0;
}
    10b2:	60a2                	ld	ra,8(sp)
    10b4:	4501                	li	a0,0
    10b6:	0141                	addi	sp,sp,16
    10b8:	8082                	ret

00000000000010ba <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10ba:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10bc:	4108                	lw	a0,0(a0)
{
    10be:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10c0:	05a1                	addi	a1,a1,8
{
    10c2:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c4:	fe7ff0ef          	jal	ra,10aa <main>
    10c8:	507000ef          	jal	ra,1dce <exit>
	return 0;
}
    10cc:	60a2                	ld	ra,8(sp)
    10ce:	4501                	li	a0,0
    10d0:	0141                	addi	sp,sp,16
    10d2:	8082                	ret

00000000000010d4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d4:	7179                	addi	sp,sp,-48
    10d6:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10d8:	12054e63          	bltz	a0,1214 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10dc:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10e0:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10e2:	02b7f6bb          	remuw	a3,a5,a1
    10e6:	00001717          	auipc	a4,0x1
    10ea:	fc270713          	addi	a4,a4,-62 # 20a8 <digits>
    buf[16] = 0;
    10ee:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10f2:	1682                	slli	a3,a3,0x20
    10f4:	9281                	srli	a3,a3,0x20
    10f6:	96ba                	add	a3,a3,a4
    10f8:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    10fc:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1100:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1104:	16b7e363          	bltu	a5,a1,126a <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1108:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    110c:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1110:	1602                	slli	a2,a2,0x20
    1112:	9201                	srli	a2,a2,0x20
    1114:	963a                	add	a2,a2,a4
    1116:	00064603          	lbu	a2,0(a2)
    111a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    111e:	0007861b          	sext.w	a2,a5
    1122:	12b6e863          	bltu	a3,a1,1252 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    1126:	02b7f6bb          	remuw	a3,a5,a1
    112a:	1682                	slli	a3,a3,0x20
    112c:	9281                	srli	a3,a3,0x20
    112e:	96ba                	add	a3,a3,a4
    1130:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1134:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1138:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    113c:	10b66e63          	bltu	a2,a1,1258 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1140:	02b876bb          	remuw	a3,a6,a1
    1144:	1682                	slli	a3,a3,0x20
    1146:	9281                	srli	a3,a3,0x20
    1148:	96ba                	add	a3,a3,a4
    114a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    114e:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1152:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1156:	10b86463          	bltu	a6,a1,125e <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    115a:	02b676bb          	remuw	a3,a2,a1
    115e:	1682                	slli	a3,a3,0x20
    1160:	9281                	srli	a3,a3,0x20
    1162:	96ba                	add	a3,a3,a4
    1164:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1168:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    116c:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1170:	0eb66a63          	bltu	a2,a1,1264 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    1174:	02b876bb          	remuw	a3,a6,a1
    1178:	1682                	slli	a3,a3,0x20
    117a:	9281                	srli	a3,a3,0x20
    117c:	96ba                	add	a3,a3,a4
    117e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1182:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1186:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    118a:	0cb86163          	bltu	a6,a1,124c <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    118e:	02b676bb          	remuw	a3,a2,a1
    1192:	1682                	slli	a3,a3,0x20
    1194:	9281                	srli	a3,a3,0x20
    1196:	96ba                	add	a3,a3,a4
    1198:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    119c:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11a0:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11a4:	0cb66563          	bltu	a2,a1,126e <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11a8:	02b876bb          	remuw	a3,a6,a1
    11ac:	1682                	slli	a3,a3,0x20
    11ae:	9281                	srli	a3,a3,0x20
    11b0:	96ba                	add	a3,a3,a4
    11b2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b6:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11ba:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11be:	0ab86b63          	bltu	a6,a1,1274 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11c2:	02b676bb          	remuw	a3,a2,a1
    11c6:	1682                	slli	a3,a3,0x20
    11c8:	9281                	srli	a3,a3,0x20
    11ca:	96ba                	add	a3,a3,a4
    11cc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11d0:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11d4:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11d8:	0ab66163          	bltu	a2,a1,127a <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11dc:	1782                	slli	a5,a5,0x20
    11de:	9381                	srli	a5,a5,0x20
    11e0:	97ba                	add	a5,a5,a4
    11e2:	0007c703          	lbu	a4,0(a5)
    11e6:	4599                	li	a1,6
    11e8:	4795                	li	a5,5
    11ea:	00e10723          	sb	a4,14(sp)

    if (sign)
    11ee:	00055963          	bgez	a0,1200 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11f2:	1018                	addi	a4,sp,32
    11f4:	973e                	add	a4,a4,a5
    11f6:	02d00693          	li	a3,45
    11fa:	fed70423          	sb	a3,-24(a4)
    11fe:	85be                	mv	a1,a5
    write(f, s, l);
    1200:	003c                	addi	a5,sp,8
    1202:	4641                	li	a2,16
    1204:	9e0d                	subw	a2,a2,a1
    1206:	4505                	li	a0,1
    1208:	95be                	add	a1,a1,a5
    120a:	373000ef          	jal	ra,1d7c <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    120e:	70a2                	ld	ra,40(sp)
    1210:	6145                	addi	sp,sp,48
    1212:	8082                	ret
        x = -xx;
    1214:	40a0063b          	negw	a2,a0
    1218:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    121a:	02b677bb          	remuw	a5,a2,a1
    121e:	00001717          	auipc	a4,0x1
    1222:	e8a70713          	addi	a4,a4,-374 # 20a8 <digits>
    buf[16] = 0;
    1226:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    122a:	1782                	slli	a5,a5,0x20
    122c:	9381                	srli	a5,a5,0x20
    122e:	97ba                	add	a5,a5,a4
    1230:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1234:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1238:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    123c:	ecb676e3          	bleu	a1,a2,1108 <printint.constprop.0+0x34>
        buf[i--] = '-';
    1240:	02d00793          	li	a5,45
    1244:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1248:	45b9                	li	a1,14
    124a:	bf5d                	j	1200 <printint.constprop.0+0x12c>
    124c:	47a5                	li	a5,9
    124e:	45a9                	li	a1,10
    1250:	bf79                	j	11ee <printint.constprop.0+0x11a>
    1252:	47b5                	li	a5,13
    1254:	45b9                	li	a1,14
    1256:	bf61                	j	11ee <printint.constprop.0+0x11a>
    1258:	47b1                	li	a5,12
    125a:	45b5                	li	a1,13
    125c:	bf49                	j	11ee <printint.constprop.0+0x11a>
    125e:	47ad                	li	a5,11
    1260:	45b1                	li	a1,12
    1262:	b771                	j	11ee <printint.constprop.0+0x11a>
    1264:	47a9                	li	a5,10
    1266:	45ad                	li	a1,11
    1268:	b759                	j	11ee <printint.constprop.0+0x11a>
    i = 15;
    126a:	45bd                	li	a1,15
    126c:	bf51                	j	1200 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    126e:	47a1                	li	a5,8
    1270:	45a5                	li	a1,9
    1272:	bfb5                	j	11ee <printint.constprop.0+0x11a>
    1274:	479d                	li	a5,7
    1276:	45a1                	li	a1,8
    1278:	bf9d                	j	11ee <printint.constprop.0+0x11a>
    127a:	4799                	li	a5,6
    127c:	459d                	li	a1,7
    127e:	bf85                	j	11ee <printint.constprop.0+0x11a>

0000000000001280 <getchar>:
{
    1280:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1282:	00f10593          	addi	a1,sp,15
    1286:	4605                	li	a2,1
    1288:	4501                	li	a0,0
{
    128a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    128c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1290:	2e3000ef          	jal	ra,1d72 <read>
}
    1294:	60e2                	ld	ra,24(sp)
    1296:	00f14503          	lbu	a0,15(sp)
    129a:	6105                	addi	sp,sp,32
    129c:	8082                	ret

000000000000129e <putchar>:
{
    129e:	1101                	addi	sp,sp,-32
    char byte = c;
    12a0:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12a4:	00f10593          	addi	a1,sp,15
    12a8:	4605                	li	a2,1
    12aa:	4505                	li	a0,1
{
    12ac:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12ae:	2cf000ef          	jal	ra,1d7c <write>
}
    12b2:	60e2                	ld	ra,24(sp)
    12b4:	2501                	sext.w	a0,a0
    12b6:	6105                	addi	sp,sp,32
    12b8:	8082                	ret

00000000000012ba <puts>:
{
    12ba:	1141                	addi	sp,sp,-16
    12bc:	e406                	sd	ra,8(sp)
    12be:	e022                	sd	s0,0(sp)
    12c0:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12c2:	59e000ef          	jal	ra,1860 <strlen>
    12c6:	862a                	mv	a2,a0
    12c8:	85a2                	mv	a1,s0
    12ca:	4505                	li	a0,1
    12cc:	2b1000ef          	jal	ra,1d7c <write>
}
    12d0:	60a2                	ld	ra,8(sp)
    12d2:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12d4:	957d                	srai	a0,a0,0x3f
    return r;
    12d6:	2501                	sext.w	a0,a0
}
    12d8:	0141                	addi	sp,sp,16
    12da:	8082                	ret

00000000000012dc <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12dc:	7131                	addi	sp,sp,-192
    12de:	e0da                	sd	s6,64(sp)
    12e0:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12e2:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12e4:	013c                	addi	a5,sp,136
{
    12e6:	f0ca                	sd	s2,96(sp)
    12e8:	ecce                	sd	s3,88(sp)
    12ea:	e8d2                	sd	s4,80(sp)
    12ec:	e4d6                	sd	s5,72(sp)
    12ee:	fc5e                	sd	s7,56(sp)
    12f0:	fc86                	sd	ra,120(sp)
    12f2:	f8a2                	sd	s0,112(sp)
    12f4:	f4a6                	sd	s1,104(sp)
    12f6:	89aa                	mv	s3,a0
    12f8:	e52e                	sd	a1,136(sp)
    12fa:	e932                	sd	a2,144(sp)
    12fc:	ed36                	sd	a3,152(sp)
    12fe:	f13a                	sd	a4,160(sp)
    1300:	f942                	sd	a6,176(sp)
    1302:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1304:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1306:	02500913          	li	s2,37
    130a:	07000a93          	li	s5,112
    buf[i++] = '0';
    130e:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1312:	00001a17          	auipc	s4,0x1
    1316:	d96a0a13          	addi	s4,s4,-618 # 20a8 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    131a:	00001b97          	auipc	s7,0x1
    131e:	d5eb8b93          	addi	s7,s7,-674 # 2078 <__clone+0xc2>
        if (!*s)
    1322:	0009c783          	lbu	a5,0(s3)
    1326:	cfb9                	beqz	a5,1384 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1328:	23278d63          	beq	a5,s2,1562 <printf+0x286>
    132c:	864e                	mv	a2,s3
    132e:	a019                	j	1334 <printf+0x58>
    1330:	07278563          	beq	a5,s2,139a <printf+0xbe>
    1334:	0605                	addi	a2,a2,1
    1336:	00064783          	lbu	a5,0(a2)
    133a:	fbfd                	bnez	a5,1330 <printf+0x54>
    133c:	84b2                	mv	s1,a2
        l = z - a;
    133e:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1342:	8622                	mv	a2,s0
    1344:	85ce                	mv	a1,s3
    1346:	4505                	li	a0,1
    1348:	235000ef          	jal	ra,1d7c <write>
        if (l)
    134c:	ec3d                	bnez	s0,13ca <printf+0xee>
        if (s[1] == 0)
    134e:	0014c783          	lbu	a5,1(s1)
    1352:	cb8d                	beqz	a5,1384 <printf+0xa8>
        switch (s[1])
    1354:	09578b63          	beq	a5,s5,13ea <printf+0x10e>
    1358:	06fafb63          	bleu	a5,s5,13ce <printf+0xf2>
    135c:	07300713          	li	a4,115
    1360:	1ce78e63          	beq	a5,a4,153c <printf+0x260>
    1364:	07800713          	li	a4,120
    1368:	1ae79563          	bne	a5,a4,1512 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    136c:	6782                	ld	a5,0(sp)
    136e:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1370:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    1374:	4388                	lw	a0,0(a5)
    1376:	07a1                	addi	a5,a5,8
    1378:	e03e                	sd	a5,0(sp)
    137a:	d5bff0ef          	jal	ra,10d4 <printint.constprop.0>
        if (!*s)
    137e:	0009c783          	lbu	a5,0(s3)
    1382:	f3dd                	bnez	a5,1328 <printf+0x4c>
    }
    va_end(ap);
}
    1384:	70e6                	ld	ra,120(sp)
    1386:	7446                	ld	s0,112(sp)
    1388:	74a6                	ld	s1,104(sp)
    138a:	7906                	ld	s2,96(sp)
    138c:	69e6                	ld	s3,88(sp)
    138e:	6a46                	ld	s4,80(sp)
    1390:	6aa6                	ld	s5,72(sp)
    1392:	6b06                	ld	s6,64(sp)
    1394:	7be2                	ld	s7,56(sp)
    1396:	6129                	addi	sp,sp,192
    1398:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    139a:	00164783          	lbu	a5,1(a2)
    139e:	84b2                	mv	s1,a2
    13a0:	01278763          	beq	a5,s2,13ae <printf+0xd2>
    13a4:	bf69                	j	133e <printf+0x62>
    13a6:	0014c783          	lbu	a5,1(s1)
    13aa:	f9279ae3          	bne	a5,s2,133e <printf+0x62>
    13ae:	0489                	addi	s1,s1,2
    13b0:	0004c783          	lbu	a5,0(s1)
    13b4:	0605                	addi	a2,a2,1
    13b6:	ff2788e3          	beq	a5,s2,13a6 <printf+0xca>
        l = z - a;
    13ba:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13be:	8622                	mv	a2,s0
    13c0:	85ce                	mv	a1,s3
    13c2:	4505                	li	a0,1
    13c4:	1b9000ef          	jal	ra,1d7c <write>
        if (l)
    13c8:	d059                	beqz	s0,134e <printf+0x72>
    13ca:	89a6                	mv	s3,s1
    13cc:	bf99                	j	1322 <printf+0x46>
    13ce:	06400713          	li	a4,100
    13d2:	14e79063          	bne	a5,a4,1512 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13d6:	6782                	ld	a5,0(sp)
    13d8:	45a9                	li	a1,10
        s += 2;
    13da:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13de:	4388                	lw	a0,0(a5)
    13e0:	07a1                	addi	a5,a5,8
    13e2:	e03e                	sd	a5,0(sp)
    13e4:	cf1ff0ef          	jal	ra,10d4 <printint.constprop.0>
        s += 2;
    13e8:	bf59                	j	137e <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13ea:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13ec:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13f0:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13f2:	631c                	ld	a5,0(a4)
    13f4:	0721                	addi	a4,a4,8
    13f6:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13f8:	00479293          	slli	t0,a5,0x4
    13fc:	00879f93          	slli	t6,a5,0x8
    1400:	00c79f13          	slli	t5,a5,0xc
    1404:	01079e93          	slli	t4,a5,0x10
    1408:	01479e13          	slli	t3,a5,0x14
    140c:	01879313          	slli	t1,a5,0x18
    1410:	01c79893          	slli	a7,a5,0x1c
    1414:	02479813          	slli	a6,a5,0x24
    1418:	02879513          	slli	a0,a5,0x28
    141c:	02c79593          	slli	a1,a5,0x2c
    1420:	03079693          	slli	a3,a5,0x30
    1424:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1428:	03c7d413          	srli	s0,a5,0x3c
    142c:	01c7d39b          	srliw	t2,a5,0x1c
    1430:	03c2d293          	srli	t0,t0,0x3c
    1434:	03cfdf93          	srli	t6,t6,0x3c
    1438:	03cf5f13          	srli	t5,t5,0x3c
    143c:	03cede93          	srli	t4,t4,0x3c
    1440:	03ce5e13          	srli	t3,t3,0x3c
    1444:	03c35313          	srli	t1,t1,0x3c
    1448:	03c8d893          	srli	a7,a7,0x3c
    144c:	03c85813          	srli	a6,a6,0x3c
    1450:	9171                	srli	a0,a0,0x3c
    1452:	91f1                	srli	a1,a1,0x3c
    1454:	92f1                	srli	a3,a3,0x3c
    1456:	9371                	srli	a4,a4,0x3c
    1458:	96d2                	add	a3,a3,s4
    145a:	9752                	add	a4,a4,s4
    145c:	9452                	add	s0,s0,s4
    145e:	92d2                	add	t0,t0,s4
    1460:	9fd2                	add	t6,t6,s4
    1462:	9f52                	add	t5,t5,s4
    1464:	9ed2                	add	t4,t4,s4
    1466:	9e52                	add	t3,t3,s4
    1468:	9352                	add	t1,t1,s4
    146a:	98d2                	add	a7,a7,s4
    146c:	93d2                	add	t2,t2,s4
    146e:	9852                	add	a6,a6,s4
    1470:	9552                	add	a0,a0,s4
    1472:	95d2                	add	a1,a1,s4
    1474:	0006c983          	lbu	s3,0(a3)
    1478:	0002c283          	lbu	t0,0(t0)
    147c:	00074683          	lbu	a3,0(a4)
    1480:	000fcf83          	lbu	t6,0(t6)
    1484:	000f4f03          	lbu	t5,0(t5)
    1488:	000ece83          	lbu	t4,0(t4)
    148c:	000e4e03          	lbu	t3,0(t3)
    1490:	00034303          	lbu	t1,0(t1)
    1494:	0008c883          	lbu	a7,0(a7)
    1498:	0003c383          	lbu	t2,0(t2)
    149c:	00084803          	lbu	a6,0(a6)
    14a0:	00054503          	lbu	a0,0(a0)
    14a4:	0005c583          	lbu	a1,0(a1)
    14a8:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14ac:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b0:	9371                	srli	a4,a4,0x3c
    14b2:	8bbd                	andi	a5,a5,15
    14b4:	9752                	add	a4,a4,s4
    14b6:	97d2                	add	a5,a5,s4
    14b8:	005105a3          	sb	t0,11(sp)
    14bc:	01f10623          	sb	t6,12(sp)
    14c0:	01e106a3          	sb	t5,13(sp)
    14c4:	01d10723          	sb	t4,14(sp)
    14c8:	01c107a3          	sb	t3,15(sp)
    14cc:	00610823          	sb	t1,16(sp)
    14d0:	011108a3          	sb	a7,17(sp)
    14d4:	00710923          	sb	t2,18(sp)
    14d8:	010109a3          	sb	a6,19(sp)
    14dc:	00a10a23          	sb	a0,20(sp)
    14e0:	00b10aa3          	sb	a1,21(sp)
    14e4:	01310b23          	sb	s3,22(sp)
    14e8:	00d10ba3          	sb	a3,23(sp)
    14ec:	00810523          	sb	s0,10(sp)
    14f0:	00074703          	lbu	a4,0(a4)
    14f4:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14f8:	002c                	addi	a1,sp,8
    14fa:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14fc:	00e10c23          	sb	a4,24(sp)
    1500:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1504:	00010d23          	sb	zero,26(sp)
        s += 2;
    1508:	00248993          	addi	s3,s1,2
    write(f, s, l);
    150c:	071000ef          	jal	ra,1d7c <write>
        s += 2;
    1510:	b5bd                	j	137e <printf+0xa2>
    char byte = c;
    1512:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1516:	4605                	li	a2,1
    1518:	002c                	addi	a1,sp,8
    151a:	4505                	li	a0,1
    char byte = c;
    151c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1520:	05d000ef          	jal	ra,1d7c <write>
    char byte = c;
    1524:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1528:	4605                	li	a2,1
    152a:	002c                	addi	a1,sp,8
    152c:	4505                	li	a0,1
    char byte = c;
    152e:	00f10423          	sb	a5,8(sp)
        s += 2;
    1532:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    1536:	047000ef          	jal	ra,1d7c <write>
        s += 2;
    153a:	b591                	j	137e <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    153c:	6782                	ld	a5,0(sp)
    153e:	6380                	ld	s0,0(a5)
    1540:	07a1                	addi	a5,a5,8
    1542:	e03e                	sd	a5,0(sp)
    1544:	cc05                	beqz	s0,157c <printf+0x2a0>
            l = strnlen(a, 200);
    1546:	0c800593          	li	a1,200
    154a:	8522                	mv	a0,s0
    154c:	446000ef          	jal	ra,1992 <strnlen>
    write(f, s, l);
    1550:	0005061b          	sext.w	a2,a0
    1554:	85a2                	mv	a1,s0
    1556:	4505                	li	a0,1
    1558:	025000ef          	jal	ra,1d7c <write>
        s += 2;
    155c:	00248993          	addi	s3,s1,2
    1560:	bd39                	j	137e <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1562:	0019c783          	lbu	a5,1(s3)
    1566:	84ce                	mv	s1,s3
    1568:	864e                	mv	a2,s3
    156a:	e52782e3          	beq	a5,s2,13ae <printf+0xd2>
    write(f, s, l);
    156e:	4601                	li	a2,0
    1570:	85ce                	mv	a1,s3
    1572:	4505                	li	a0,1
    1574:	009000ef          	jal	ra,1d7c <write>
    1578:	84ce                	mv	s1,s3
    157a:	bbd1                	j	134e <printf+0x72>
                a = "(null)";
    157c:	845e                	mv	s0,s7
    157e:	b7e1                	j	1546 <printf+0x26a>

0000000000001580 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1580:	02000793          	li	a5,32
    1584:	00f50663          	beq	a0,a5,1590 <isspace+0x10>
    1588:	355d                	addiw	a0,a0,-9
    158a:	00553513          	sltiu	a0,a0,5
    158e:	8082                	ret
    1590:	4505                	li	a0,1
}
    1592:	8082                	ret

0000000000001594 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1594:	fd05051b          	addiw	a0,a0,-48
}
    1598:	00a53513          	sltiu	a0,a0,10
    159c:	8082                	ret

000000000000159e <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    159e:	02000613          	li	a2,32
    15a2:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15a4:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a8:	0007079b          	sext.w	a5,a4
    15ac:	ff77869b          	addiw	a3,a5,-9
    15b0:	04c70b63          	beq	a4,a2,1606 <atoi+0x68>
    15b4:	04d5f963          	bleu	a3,a1,1606 <atoi+0x68>
        s++;
    switch (*s)
    15b8:	02b00693          	li	a3,43
    15bc:	04d70a63          	beq	a4,a3,1610 <atoi+0x72>
    15c0:	02d00693          	li	a3,45
    15c4:	06d70463          	beq	a4,a3,162c <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15c8:	fd07859b          	addiw	a1,a5,-48
    15cc:	4625                	li	a2,9
    15ce:	873e                	mv	a4,a5
    15d0:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15d2:	4e01                	li	t3,0
    while (isdigit(*s))
    15d4:	04b66a63          	bltu	a2,a1,1628 <atoi+0x8a>
    int n = 0, neg = 0;
    15d8:	4501                	li	a0,0
    while (isdigit(*s))
    15da:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15dc:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15de:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15e2:	0025179b          	slliw	a5,a0,0x2
    15e6:	9d3d                	addw	a0,a0,a5
    15e8:	fd07031b          	addiw	t1,a4,-48
    15ec:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15f0:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15f4:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15f8:	0006071b          	sext.w	a4,a2
    15fc:	feb870e3          	bleu	a1,a6,15dc <atoi+0x3e>
    return neg ? n : -n;
    1600:	000e0563          	beqz	t3,160a <atoi+0x6c>
}
    1604:	8082                	ret
        s++;
    1606:	0505                	addi	a0,a0,1
    1608:	bf71                	j	15a4 <atoi+0x6>
    160a:	4113053b          	subw	a0,t1,a7
    160e:	8082                	ret
    while (isdigit(*s))
    1610:	00154783          	lbu	a5,1(a0)
    1614:	4625                	li	a2,9
        s++;
    1616:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    161a:	fd07859b          	addiw	a1,a5,-48
    161e:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1622:	4e01                	li	t3,0
    while (isdigit(*s))
    1624:	fab67ae3          	bleu	a1,a2,15d8 <atoi+0x3a>
    1628:	4501                	li	a0,0
}
    162a:	8082                	ret
    while (isdigit(*s))
    162c:	00154783          	lbu	a5,1(a0)
    1630:	4625                	li	a2,9
        s++;
    1632:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1636:	fd07859b          	addiw	a1,a5,-48
    163a:	0007871b          	sext.w	a4,a5
    163e:	feb665e3          	bltu	a2,a1,1628 <atoi+0x8a>
        neg = 1;
    1642:	4e05                	li	t3,1
    1644:	bf51                	j	15d8 <atoi+0x3a>

0000000000001646 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1646:	16060d63          	beqz	a2,17c0 <memset+0x17a>
    164a:	40a007b3          	neg	a5,a0
    164e:	8b9d                	andi	a5,a5,7
    1650:	00778713          	addi	a4,a5,7
    1654:	482d                	li	a6,11
    1656:	0ff5f593          	andi	a1,a1,255
    165a:	fff60693          	addi	a3,a2,-1
    165e:	17076263          	bltu	a4,a6,17c2 <memset+0x17c>
    1662:	16e6ea63          	bltu	a3,a4,17d6 <memset+0x190>
    1666:	16078563          	beqz	a5,17d0 <memset+0x18a>
    166a:	00b50023          	sb	a1,0(a0)
    166e:	4705                	li	a4,1
    1670:	00150e93          	addi	t4,a0,1
    1674:	14e78c63          	beq	a5,a4,17cc <memset+0x186>
    1678:	00b500a3          	sb	a1,1(a0)
    167c:	4709                	li	a4,2
    167e:	00250e93          	addi	t4,a0,2
    1682:	14e78d63          	beq	a5,a4,17dc <memset+0x196>
    1686:	00b50123          	sb	a1,2(a0)
    168a:	470d                	li	a4,3
    168c:	00350e93          	addi	t4,a0,3
    1690:	12e78b63          	beq	a5,a4,17c6 <memset+0x180>
    1694:	00b501a3          	sb	a1,3(a0)
    1698:	4711                	li	a4,4
    169a:	00450e93          	addi	t4,a0,4
    169e:	14e78163          	beq	a5,a4,17e0 <memset+0x19a>
    16a2:	00b50223          	sb	a1,4(a0)
    16a6:	4715                	li	a4,5
    16a8:	00550e93          	addi	t4,a0,5
    16ac:	12e78c63          	beq	a5,a4,17e4 <memset+0x19e>
    16b0:	00b502a3          	sb	a1,5(a0)
    16b4:	471d                	li	a4,7
    16b6:	00650e93          	addi	t4,a0,6
    16ba:	12e79763          	bne	a5,a4,17e8 <memset+0x1a2>
    16be:	00750e93          	addi	t4,a0,7
    16c2:	00b50323          	sb	a1,6(a0)
    16c6:	4f1d                	li	t5,7
    16c8:	00859713          	slli	a4,a1,0x8
    16cc:	8f4d                	or	a4,a4,a1
    16ce:	01059e13          	slli	t3,a1,0x10
    16d2:	01c76e33          	or	t3,a4,t3
    16d6:	01859313          	slli	t1,a1,0x18
    16da:	006e6333          	or	t1,t3,t1
    16de:	02059893          	slli	a7,a1,0x20
    16e2:	011368b3          	or	a7,t1,a7
    16e6:	02859813          	slli	a6,a1,0x28
    16ea:	40f60333          	sub	t1,a2,a5
    16ee:	0108e833          	or	a6,a7,a6
    16f2:	03059693          	slli	a3,a1,0x30
    16f6:	00d866b3          	or	a3,a6,a3
    16fa:	03859713          	slli	a4,a1,0x38
    16fe:	97aa                	add	a5,a5,a0
    1700:	ff837813          	andi	a6,t1,-8
    1704:	8f55                	or	a4,a4,a3
    1706:	00f806b3          	add	a3,a6,a5
    170a:	e398                	sd	a4,0(a5)
    170c:	07a1                	addi	a5,a5,8
    170e:	fed79ee3          	bne	a5,a3,170a <memset+0xc4>
    1712:	ff837693          	andi	a3,t1,-8
    1716:	00de87b3          	add	a5,t4,a3
    171a:	01e6873b          	addw	a4,a3,t5
    171e:	0ad30663          	beq	t1,a3,17ca <memset+0x184>
    1722:	00b78023          	sb	a1,0(a5)
    1726:	0017069b          	addiw	a3,a4,1
    172a:	08c6fb63          	bleu	a2,a3,17c0 <memset+0x17a>
    172e:	00b780a3          	sb	a1,1(a5)
    1732:	0027069b          	addiw	a3,a4,2
    1736:	08c6f563          	bleu	a2,a3,17c0 <memset+0x17a>
    173a:	00b78123          	sb	a1,2(a5)
    173e:	0037069b          	addiw	a3,a4,3
    1742:	06c6ff63          	bleu	a2,a3,17c0 <memset+0x17a>
    1746:	00b781a3          	sb	a1,3(a5)
    174a:	0047069b          	addiw	a3,a4,4
    174e:	06c6f963          	bleu	a2,a3,17c0 <memset+0x17a>
    1752:	00b78223          	sb	a1,4(a5)
    1756:	0057069b          	addiw	a3,a4,5
    175a:	06c6f363          	bleu	a2,a3,17c0 <memset+0x17a>
    175e:	00b782a3          	sb	a1,5(a5)
    1762:	0067069b          	addiw	a3,a4,6
    1766:	04c6fd63          	bleu	a2,a3,17c0 <memset+0x17a>
    176a:	00b78323          	sb	a1,6(a5)
    176e:	0077069b          	addiw	a3,a4,7
    1772:	04c6f763          	bleu	a2,a3,17c0 <memset+0x17a>
    1776:	00b783a3          	sb	a1,7(a5)
    177a:	0087069b          	addiw	a3,a4,8
    177e:	04c6f163          	bleu	a2,a3,17c0 <memset+0x17a>
    1782:	00b78423          	sb	a1,8(a5)
    1786:	0097069b          	addiw	a3,a4,9
    178a:	02c6fb63          	bleu	a2,a3,17c0 <memset+0x17a>
    178e:	00b784a3          	sb	a1,9(a5)
    1792:	00a7069b          	addiw	a3,a4,10
    1796:	02c6f563          	bleu	a2,a3,17c0 <memset+0x17a>
    179a:	00b78523          	sb	a1,10(a5)
    179e:	00b7069b          	addiw	a3,a4,11
    17a2:	00c6ff63          	bleu	a2,a3,17c0 <memset+0x17a>
    17a6:	00b785a3          	sb	a1,11(a5)
    17aa:	00c7069b          	addiw	a3,a4,12
    17ae:	00c6f963          	bleu	a2,a3,17c0 <memset+0x17a>
    17b2:	00b78623          	sb	a1,12(a5)
    17b6:	2735                	addiw	a4,a4,13
    17b8:	00c77463          	bleu	a2,a4,17c0 <memset+0x17a>
    17bc:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17c0:	8082                	ret
    17c2:	472d                	li	a4,11
    17c4:	bd79                	j	1662 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17c6:	4f0d                	li	t5,3
    17c8:	b701                	j	16c8 <memset+0x82>
    17ca:	8082                	ret
    17cc:	4f05                	li	t5,1
    17ce:	bded                	j	16c8 <memset+0x82>
    17d0:	8eaa                	mv	t4,a0
    17d2:	4f01                	li	t5,0
    17d4:	bdd5                	j	16c8 <memset+0x82>
    17d6:	87aa                	mv	a5,a0
    17d8:	4701                	li	a4,0
    17da:	b7a1                	j	1722 <memset+0xdc>
    17dc:	4f09                	li	t5,2
    17de:	b5ed                	j	16c8 <memset+0x82>
    17e0:	4f11                	li	t5,4
    17e2:	b5dd                	j	16c8 <memset+0x82>
    17e4:	4f15                	li	t5,5
    17e6:	b5cd                	j	16c8 <memset+0x82>
    17e8:	4f19                	li	t5,6
    17ea:	bdf9                	j	16c8 <memset+0x82>

00000000000017ec <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17ec:	00054703          	lbu	a4,0(a0)
    17f0:	0005c783          	lbu	a5,0(a1)
    17f4:	00e79b63          	bne	a5,a4,180a <strcmp+0x1e>
    17f8:	cf89                	beqz	a5,1812 <strcmp+0x26>
    17fa:	0505                	addi	a0,a0,1
    17fc:	0585                	addi	a1,a1,1
    17fe:	0005c783          	lbu	a5,0(a1)
    1802:	00054703          	lbu	a4,0(a0)
    1806:	fef709e3          	beq	a4,a5,17f8 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    180a:	0007051b          	sext.w	a0,a4
}
    180e:	9d1d                	subw	a0,a0,a5
    1810:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1812:	4501                	li	a0,0
}
    1814:	9d1d                	subw	a0,a0,a5
    1816:	8082                	ret

0000000000001818 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1818:	c231                	beqz	a2,185c <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    181a:	00054783          	lbu	a5,0(a0)
    181e:	0005c683          	lbu	a3,0(a1)
    1822:	c795                	beqz	a5,184e <strncmp+0x36>
    1824:	ca85                	beqz	a3,1854 <strncmp+0x3c>
    if (!n--)
    1826:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1828:	c615                	beqz	a2,1854 <strncmp+0x3c>
    182a:	00150713          	addi	a4,a0,1
    182e:	9532                	add	a0,a0,a2
    1830:	00d78963          	beq	a5,a3,1842 <strncmp+0x2a>
    1834:	a005                	j	1854 <strncmp+0x3c>
    1836:	ce99                	beqz	a3,1854 <strncmp+0x3c>
    1838:	00e50e63          	beq	a0,a4,1854 <strncmp+0x3c>
    183c:	0705                	addi	a4,a4,1
    183e:	00d79b63          	bne	a5,a3,1854 <strncmp+0x3c>
    1842:	00074783          	lbu	a5,0(a4)
    1846:	0585                	addi	a1,a1,1
    1848:	0005c683          	lbu	a3,0(a1)
    184c:	f7ed                	bnez	a5,1836 <strncmp+0x1e>
    184e:	4501                	li	a0,0
        ;
    return *l - *r;
    1850:	9d15                	subw	a0,a0,a3
    1852:	8082                	ret
    1854:	0007851b          	sext.w	a0,a5
    1858:	9d15                	subw	a0,a0,a3
    185a:	8082                	ret
        return 0;
    185c:	4501                	li	a0,0
}
    185e:	8082                	ret

0000000000001860 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1860:	00757793          	andi	a5,a0,7
    1864:	cfa1                	beqz	a5,18bc <strlen+0x5c>
        if (!*s)
    1866:	00054783          	lbu	a5,0(a0)
    186a:	cbb9                	beqz	a5,18c0 <strlen+0x60>
    186c:	87aa                	mv	a5,a0
    186e:	a021                	j	1876 <strlen+0x16>
    1870:	0007c703          	lbu	a4,0(a5)
    1874:	c329                	beqz	a4,18b6 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    1876:	0785                	addi	a5,a5,1
    1878:	0077f713          	andi	a4,a5,7
    187c:	fb75                	bnez	a4,1870 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    187e:	00001717          	auipc	a4,0x1
    1882:	80270713          	addi	a4,a4,-2046 # 2080 <__clone+0xca>
    1886:	630c                	ld	a1,0(a4)
    1888:	00001717          	auipc	a4,0x1
    188c:	80070713          	addi	a4,a4,-2048 # 2088 <__clone+0xd2>
    1890:	6394                	ld	a3,0(a5)
    1892:	6310                	ld	a2,0(a4)
    1894:	a019                	j	189a <strlen+0x3a>
    1896:	07a1                	addi	a5,a5,8
    1898:	6394                	ld	a3,0(a5)
    189a:	00b68733          	add	a4,a3,a1
    189e:	fff6c693          	not	a3,a3
    18a2:	8f75                	and	a4,a4,a3
    18a4:	8f71                	and	a4,a4,a2
    18a6:	db65                	beqz	a4,1896 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18a8:	0007c703          	lbu	a4,0(a5)
    18ac:	c709                	beqz	a4,18b6 <strlen+0x56>
    18ae:	0785                	addi	a5,a5,1
    18b0:	0007c703          	lbu	a4,0(a5)
    18b4:	ff6d                	bnez	a4,18ae <strlen+0x4e>
        ;
    return s - a;
    18b6:	40a78533          	sub	a0,a5,a0
}
    18ba:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18bc:	87aa                	mv	a5,a0
    18be:	b7c1                	j	187e <strlen+0x1e>
        if (!*s)
    18c0:	4501                	li	a0,0
            return s - a;
    18c2:	8082                	ret

00000000000018c4 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18c4:	00757793          	andi	a5,a0,7
    18c8:	0ff5f593          	andi	a1,a1,255
    18cc:	cb99                	beqz	a5,18e2 <memchr+0x1e>
    18ce:	c655                	beqz	a2,197a <memchr+0xb6>
    18d0:	00054783          	lbu	a5,0(a0)
    18d4:	0ab78663          	beq	a5,a1,1980 <memchr+0xbc>
    18d8:	0505                	addi	a0,a0,1
    18da:	00757793          	andi	a5,a0,7
    18de:	167d                	addi	a2,a2,-1
    18e0:	f7fd                	bnez	a5,18ce <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18e2:	4701                	li	a4,0
    if (n && *s != c)
    18e4:	ca49                	beqz	a2,1976 <memchr+0xb2>
    18e6:	00054783          	lbu	a5,0(a0)
    18ea:	08b78b63          	beq	a5,a1,1980 <memchr+0xbc>
        size_t k = ONES * c;
    18ee:	00000797          	auipc	a5,0x0
    18f2:	7a278793          	addi	a5,a5,1954 # 2090 <__clone+0xda>
    18f6:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18f8:	479d                	li	a5,7
        size_t k = ONES * c;
    18fa:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18fe:	08c7f863          	bleu	a2,a5,198e <memchr+0xca>
    1902:	611c                	ld	a5,0(a0)
    1904:	00000317          	auipc	t1,0x0
    1908:	78430313          	addi	t1,t1,1924 # 2088 <__clone+0xd2>
    190c:	00033803          	ld	a6,0(t1)
    1910:	00f8c7b3          	xor	a5,a7,a5
    1914:	fff7c713          	not	a4,a5
    1918:	8f95                	sub	a5,a5,a3
    191a:	8ff9                	and	a5,a5,a4
    191c:	0107f7b3          	and	a5,a5,a6
    1920:	e7bd                	bnez	a5,198e <memchr+0xca>
    1922:	4e1d                	li	t3,7
    1924:	00000e97          	auipc	t4,0x0
    1928:	75ce8e93          	addi	t4,t4,1884 # 2080 <__clone+0xca>
    192c:	a005                	j	194c <memchr+0x88>
    192e:	6514                	ld	a3,8(a0)
    1930:	000eb783          	ld	a5,0(t4)
    1934:	00033803          	ld	a6,0(t1)
    1938:	00d8c6b3          	xor	a3,a7,a3
    193c:	97b6                	add	a5,a5,a3
    193e:	fff6c693          	not	a3,a3
    1942:	8ff5                	and	a5,a5,a3
    1944:	0107f7b3          	and	a5,a5,a6
    1948:	e3a1                	bnez	a5,1988 <memchr+0xc4>
    194a:	853a                	mv	a0,a4
    194c:	1661                	addi	a2,a2,-8
    194e:	00850713          	addi	a4,a0,8
    1952:	fcce6ee3          	bltu	t3,a2,192e <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1956:	c215                	beqz	a2,197a <memchr+0xb6>
    1958:	00074783          	lbu	a5,0(a4)
    195c:	00f58d63          	beq	a1,a5,1976 <memchr+0xb2>
    1960:	00170793          	addi	a5,a4,1
    1964:	963a                	add	a2,a2,a4
    1966:	873e                	mv	a4,a5
    1968:	00f60963          	beq	a2,a5,197a <memchr+0xb6>
    196c:	0007c683          	lbu	a3,0(a5)
    1970:	0785                	addi	a5,a5,1
    1972:	feb69ae3          	bne	a3,a1,1966 <memchr+0xa2>
}
    1976:	853a                	mv	a0,a4
    1978:	8082                	ret
    return n ? (void *)s : 0;
    197a:	4701                	li	a4,0
}
    197c:	853a                	mv	a0,a4
    197e:	8082                	ret
    1980:	872a                	mv	a4,a0
    1982:	00074783          	lbu	a5,0(a4)
    1986:	bfd9                	j	195c <memchr+0x98>
    1988:	00854783          	lbu	a5,8(a0)
    198c:	bfc1                	j	195c <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    198e:	872a                	mv	a4,a0
    1990:	bfc1                	j	1960 <memchr+0x9c>

0000000000001992 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1992:	00757793          	andi	a5,a0,7
    1996:	cfc5                	beqz	a5,1a4e <strnlen+0xbc>
    1998:	c1c5                	beqz	a1,1a38 <strnlen+0xa6>
    199a:	00054783          	lbu	a5,0(a0)
    199e:	cfd9                	beqz	a5,1a3c <strnlen+0xaa>
    19a0:	87ae                	mv	a5,a1
    19a2:	86aa                	mv	a3,a0
    19a4:	a029                	j	19ae <strnlen+0x1c>
    19a6:	cbc9                	beqz	a5,1a38 <strnlen+0xa6>
    19a8:	0006c703          	lbu	a4,0(a3)
    19ac:	cb51                	beqz	a4,1a40 <strnlen+0xae>
    19ae:	0685                	addi	a3,a3,1
    19b0:	0076f713          	andi	a4,a3,7
    19b4:	17fd                	addi	a5,a5,-1
    19b6:	fb65                	bnez	a4,19a6 <strnlen+0x14>
    if (n && *s != c)
    19b8:	c3c1                	beqz	a5,1a38 <strnlen+0xa6>
    19ba:	0006c703          	lbu	a4,0(a3)
    19be:	c349                	beqz	a4,1a40 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19c0:	471d                	li	a4,7
    19c2:	08f77a63          	bleu	a5,a4,1a56 <strnlen+0xc4>
    19c6:	00000e17          	auipc	t3,0x0
    19ca:	6bae0e13          	addi	t3,t3,1722 # 2080 <__clone+0xca>
    19ce:	6290                	ld	a2,0(a3)
    19d0:	000e3703          	ld	a4,0(t3)
    19d4:	00000e97          	auipc	t4,0x0
    19d8:	6b4e8e93          	addi	t4,t4,1716 # 2088 <__clone+0xd2>
    19dc:	000eb803          	ld	a6,0(t4)
    19e0:	9732                	add	a4,a4,a2
    19e2:	fff64613          	not	a2,a2
    19e6:	8f71                	and	a4,a4,a2
    19e8:	01077733          	and	a4,a4,a6
    19ec:	e72d                	bnez	a4,1a56 <strnlen+0xc4>
    19ee:	4f1d                	li	t5,7
    19f0:	a839                	j	1a0e <strnlen+0x7c>
    19f2:	6698                	ld	a4,8(a3)
    19f4:	000e3303          	ld	t1,0(t3)
    19f8:	000eb803          	ld	a6,0(t4)
    19fc:	fff74893          	not	a7,a4
    1a00:	971a                	add	a4,a4,t1
    1a02:	01177733          	and	a4,a4,a7
    1a06:	01077733          	and	a4,a4,a6
    1a0a:	ef1d                	bnez	a4,1a48 <strnlen+0xb6>
    1a0c:	86b2                	mv	a3,a2
    1a0e:	17e1                	addi	a5,a5,-8
    1a10:	00868613          	addi	a2,a3,8
    1a14:	fcff6fe3          	bltu	t5,a5,19f2 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a18:	c385                	beqz	a5,1a38 <strnlen+0xa6>
    1a1a:	00064703          	lbu	a4,0(a2)
    1a1e:	cb19                	beqz	a4,1a34 <strnlen+0xa2>
    1a20:	00160713          	addi	a4,a2,1
    1a24:	97b2                	add	a5,a5,a2
    1a26:	863a                	mv	a2,a4
    1a28:	00e78863          	beq	a5,a4,1a38 <strnlen+0xa6>
    1a2c:	0705                	addi	a4,a4,1
    1a2e:	fff74683          	lbu	a3,-1(a4)
    1a32:	faf5                	bnez	a3,1a26 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a34:	40a605b3          	sub	a1,a2,a0
}
    1a38:	852e                	mv	a0,a1
    1a3a:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a3c:	87ae                	mv	a5,a1
    1a3e:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a40:	8636                	mv	a2,a3
    1a42:	00064703          	lbu	a4,0(a2)
    1a46:	bfe1                	j	1a1e <strnlen+0x8c>
    1a48:	0086c703          	lbu	a4,8(a3)
    1a4c:	bfc9                	j	1a1e <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a4e:	87ae                	mv	a5,a1
    1a50:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a52:	f7a5                	bnez	a5,19ba <strnlen+0x28>
    1a54:	b7d5                	j	1a38 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a56:	8636                	mv	a2,a3
    1a58:	b7e1                	j	1a20 <strnlen+0x8e>

0000000000001a5a <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a5a:	00b547b3          	xor	a5,a0,a1
    1a5e:	8b9d                	andi	a5,a5,7
    1a60:	efa9                	bnez	a5,1aba <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a62:	0075f793          	andi	a5,a1,7
    1a66:	c38d                	beqz	a5,1a88 <strcpy+0x2e>
            if (!(*d = *s))
    1a68:	0005c783          	lbu	a5,0(a1)
    1a6c:	00f50023          	sb	a5,0(a0)
    1a70:	e799                	bnez	a5,1a7e <strcpy+0x24>
    1a72:	a095                	j	1ad6 <strcpy+0x7c>
    1a74:	0005c783          	lbu	a5,0(a1)
    1a78:	00f50023          	sb	a5,0(a0)
    1a7c:	cbb9                	beqz	a5,1ad2 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a7e:	0585                	addi	a1,a1,1
    1a80:	0075f793          	andi	a5,a1,7
    1a84:	0505                	addi	a0,a0,1
    1a86:	f7fd                	bnez	a5,1a74 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a88:	00000797          	auipc	a5,0x0
    1a8c:	5f878793          	addi	a5,a5,1528 # 2080 <__clone+0xca>
    1a90:	0007b803          	ld	a6,0(a5)
    1a94:	00000797          	auipc	a5,0x0
    1a98:	5f478793          	addi	a5,a5,1524 # 2088 <__clone+0xd2>
    1a9c:	6198                	ld	a4,0(a1)
    1a9e:	6390                	ld	a2,0(a5)
    1aa0:	a031                	j	1aac <strcpy+0x52>
    1aa2:	0521                	addi	a0,a0,8
    1aa4:	05a1                	addi	a1,a1,8
    1aa6:	fee53c23          	sd	a4,-8(a0)
    1aaa:	6198                	ld	a4,0(a1)
    1aac:	010707b3          	add	a5,a4,a6
    1ab0:	fff74693          	not	a3,a4
    1ab4:	8ff5                	and	a5,a5,a3
    1ab6:	8ff1                	and	a5,a5,a2
    1ab8:	d7ed                	beqz	a5,1aa2 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1aba:	0005c783          	lbu	a5,0(a1)
    1abe:	00f50023          	sb	a5,0(a0)
    1ac2:	cb89                	beqz	a5,1ad4 <strcpy+0x7a>
    1ac4:	0585                	addi	a1,a1,1
    1ac6:	0005c783          	lbu	a5,0(a1)
    1aca:	0505                	addi	a0,a0,1
    1acc:	00f50023          	sb	a5,0(a0)
    1ad0:	fbf5                	bnez	a5,1ac4 <strcpy+0x6a>
        ;
    return d;
}
    1ad2:	8082                	ret
    1ad4:	8082                	ret
    1ad6:	8082                	ret

0000000000001ad8 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ad8:	00b547b3          	xor	a5,a0,a1
    1adc:	8b9d                	andi	a5,a5,7
    1ade:	ebc1                	bnez	a5,1b6e <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ae0:	0075f793          	andi	a5,a1,7
    1ae4:	cf91                	beqz	a5,1b00 <strncpy+0x28>
    1ae6:	20060e63          	beqz	a2,1d02 <strncpy+0x22a>
    1aea:	0005c783          	lbu	a5,0(a1)
    1aee:	00f50023          	sb	a5,0(a0)
    1af2:	c3d5                	beqz	a5,1b96 <strncpy+0xbe>
    1af4:	0585                	addi	a1,a1,1
    1af6:	0075f793          	andi	a5,a1,7
    1afa:	167d                	addi	a2,a2,-1
    1afc:	0505                	addi	a0,a0,1
    1afe:	f7e5                	bnez	a5,1ae6 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b00:	20060163          	beqz	a2,1d02 <strncpy+0x22a>
    1b04:	0005c683          	lbu	a3,0(a1)
    1b08:	c6d9                	beqz	a3,1b96 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b0a:	479d                	li	a5,7
    1b0c:	22c7f563          	bleu	a2,a5,1d36 <strncpy+0x25e>
    1b10:	00000317          	auipc	t1,0x0
    1b14:	57030313          	addi	t1,t1,1392 # 2080 <__clone+0xca>
    1b18:	6198                	ld	a4,0(a1)
    1b1a:	00033783          	ld	a5,0(t1)
    1b1e:	00000e17          	auipc	t3,0x0
    1b22:	56ae0e13          	addi	t3,t3,1386 # 2088 <__clone+0xd2>
    1b26:	000e3803          	ld	a6,0(t3)
    1b2a:	97ba                	add	a5,a5,a4
    1b2c:	fff74893          	not	a7,a4
    1b30:	0117f7b3          	and	a5,a5,a7
    1b34:	0107f7b3          	and	a5,a5,a6
    1b38:	1e079f63          	bnez	a5,1d36 <strncpy+0x25e>
    1b3c:	4e9d                	li	t4,7
    1b3e:	a005                	j	1b5e <strncpy+0x86>
    1b40:	6598                	ld	a4,8(a1)
    1b42:	00033783          	ld	a5,0(t1)
    1b46:	000e3803          	ld	a6,0(t3)
    1b4a:	fff74893          	not	a7,a4
    1b4e:	97ba                	add	a5,a5,a4
    1b50:	0117f7b3          	and	a5,a5,a7
    1b54:	0107f7b3          	and	a5,a5,a6
    1b58:	1a079f63          	bnez	a5,1d16 <strncpy+0x23e>
    1b5c:	85b6                	mv	a1,a3
            *wd = *ws;
    1b5e:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b60:	1661                	addi	a2,a2,-8
    1b62:	00858693          	addi	a3,a1,8
    1b66:	0521                	addi	a0,a0,8
    1b68:	fcceece3          	bltu	t4,a2,1b40 <strncpy+0x68>
    1b6c:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b6e:	18060a63          	beqz	a2,1d02 <strncpy+0x22a>
    1b72:	0005c783          	lbu	a5,0(a1)
    1b76:	872a                	mv	a4,a0
    1b78:	00f50023          	sb	a5,0(a0)
    1b7c:	e799                	bnez	a5,1b8a <strncpy+0xb2>
    1b7e:	a829                	j	1b98 <strncpy+0xc0>
    1b80:	0005c783          	lbu	a5,0(a1)
    1b84:	00f70023          	sb	a5,0(a4)
    1b88:	cb81                	beqz	a5,1b98 <strncpy+0xc0>
    1b8a:	167d                	addi	a2,a2,-1
    1b8c:	0585                	addi	a1,a1,1
    1b8e:	0705                	addi	a4,a4,1
    1b90:	fa65                	bnez	a2,1b80 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b92:	853a                	mv	a0,a4
    1b94:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1b96:	872a                	mv	a4,a0
    1b98:	4805                	li	a6,1
    1b9a:	14061c63          	bnez	a2,1cf2 <strncpy+0x21a>
    1b9e:	40e007b3          	neg	a5,a4
    1ba2:	8b9d                	andi	a5,a5,7
    1ba4:	4581                	li	a1,0
    1ba6:	12061e63          	bnez	a2,1ce2 <strncpy+0x20a>
    1baa:	00778693          	addi	a3,a5,7
    1bae:	452d                	li	a0,11
    1bb0:	12a6e763          	bltu	a3,a0,1cde <strncpy+0x206>
    1bb4:	16d5e663          	bltu	a1,a3,1d20 <strncpy+0x248>
    1bb8:	14078c63          	beqz	a5,1d10 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bbc:	00070023          	sb	zero,0(a4)
    1bc0:	4585                	li	a1,1
    1bc2:	00170693          	addi	a3,a4,1
    1bc6:	14b78363          	beq	a5,a1,1d0c <strncpy+0x234>
    1bca:	000700a3          	sb	zero,1(a4)
    1bce:	4589                	li	a1,2
    1bd0:	00270693          	addi	a3,a4,2
    1bd4:	14b78963          	beq	a5,a1,1d26 <strncpy+0x24e>
    1bd8:	00070123          	sb	zero,2(a4)
    1bdc:	458d                	li	a1,3
    1bde:	00370693          	addi	a3,a4,3
    1be2:	12b78363          	beq	a5,a1,1d08 <strncpy+0x230>
    1be6:	000701a3          	sb	zero,3(a4)
    1bea:	4591                	li	a1,4
    1bec:	00470693          	addi	a3,a4,4
    1bf0:	12b78d63          	beq	a5,a1,1d2a <strncpy+0x252>
    1bf4:	00070223          	sb	zero,4(a4)
    1bf8:	4595                	li	a1,5
    1bfa:	00570693          	addi	a3,a4,5
    1bfe:	12b78863          	beq	a5,a1,1d2e <strncpy+0x256>
    1c02:	000702a3          	sb	zero,5(a4)
    1c06:	459d                	li	a1,7
    1c08:	00670693          	addi	a3,a4,6
    1c0c:	12b79363          	bne	a5,a1,1d32 <strncpy+0x25a>
    1c10:	00770693          	addi	a3,a4,7
    1c14:	00070323          	sb	zero,6(a4)
    1c18:	40f80833          	sub	a6,a6,a5
    1c1c:	ff887513          	andi	a0,a6,-8
    1c20:	97ba                	add	a5,a5,a4
    1c22:	953e                	add	a0,a0,a5
    1c24:	0007b023          	sd	zero,0(a5)
    1c28:	07a1                	addi	a5,a5,8
    1c2a:	fea79de3          	bne	a5,a0,1c24 <strncpy+0x14c>
    1c2e:	ff887513          	andi	a0,a6,-8
    1c32:	9da9                	addw	a1,a1,a0
    1c34:	00a687b3          	add	a5,a3,a0
    1c38:	f4a80de3          	beq	a6,a0,1b92 <strncpy+0xba>
    1c3c:	00078023          	sb	zero,0(a5)
    1c40:	0015869b          	addiw	a3,a1,1
    1c44:	f4c6f7e3          	bleu	a2,a3,1b92 <strncpy+0xba>
    1c48:	000780a3          	sb	zero,1(a5)
    1c4c:	0025869b          	addiw	a3,a1,2
    1c50:	f4c6f1e3          	bleu	a2,a3,1b92 <strncpy+0xba>
    1c54:	00078123          	sb	zero,2(a5)
    1c58:	0035869b          	addiw	a3,a1,3
    1c5c:	f2c6fbe3          	bleu	a2,a3,1b92 <strncpy+0xba>
    1c60:	000781a3          	sb	zero,3(a5)
    1c64:	0045869b          	addiw	a3,a1,4
    1c68:	f2c6f5e3          	bleu	a2,a3,1b92 <strncpy+0xba>
    1c6c:	00078223          	sb	zero,4(a5)
    1c70:	0055869b          	addiw	a3,a1,5
    1c74:	f0c6ffe3          	bleu	a2,a3,1b92 <strncpy+0xba>
    1c78:	000782a3          	sb	zero,5(a5)
    1c7c:	0065869b          	addiw	a3,a1,6
    1c80:	f0c6f9e3          	bleu	a2,a3,1b92 <strncpy+0xba>
    1c84:	00078323          	sb	zero,6(a5)
    1c88:	0075869b          	addiw	a3,a1,7
    1c8c:	f0c6f3e3          	bleu	a2,a3,1b92 <strncpy+0xba>
    1c90:	000783a3          	sb	zero,7(a5)
    1c94:	0085869b          	addiw	a3,a1,8
    1c98:	eec6fde3          	bleu	a2,a3,1b92 <strncpy+0xba>
    1c9c:	00078423          	sb	zero,8(a5)
    1ca0:	0095869b          	addiw	a3,a1,9
    1ca4:	eec6f7e3          	bleu	a2,a3,1b92 <strncpy+0xba>
    1ca8:	000784a3          	sb	zero,9(a5)
    1cac:	00a5869b          	addiw	a3,a1,10
    1cb0:	eec6f1e3          	bleu	a2,a3,1b92 <strncpy+0xba>
    1cb4:	00078523          	sb	zero,10(a5)
    1cb8:	00b5869b          	addiw	a3,a1,11
    1cbc:	ecc6fbe3          	bleu	a2,a3,1b92 <strncpy+0xba>
    1cc0:	000785a3          	sb	zero,11(a5)
    1cc4:	00c5869b          	addiw	a3,a1,12
    1cc8:	ecc6f5e3          	bleu	a2,a3,1b92 <strncpy+0xba>
    1ccc:	00078623          	sb	zero,12(a5)
    1cd0:	25b5                	addiw	a1,a1,13
    1cd2:	ecc5f0e3          	bleu	a2,a1,1b92 <strncpy+0xba>
    1cd6:	000786a3          	sb	zero,13(a5)
}
    1cda:	853a                	mv	a0,a4
    1cdc:	8082                	ret
    1cde:	46ad                	li	a3,11
    1ce0:	bdd1                	j	1bb4 <strncpy+0xdc>
    1ce2:	00778693          	addi	a3,a5,7
    1ce6:	452d                	li	a0,11
    1ce8:	fff60593          	addi	a1,a2,-1
    1cec:	eca6f4e3          	bleu	a0,a3,1bb4 <strncpy+0xdc>
    1cf0:	b7fd                	j	1cde <strncpy+0x206>
    1cf2:	40e007b3          	neg	a5,a4
    1cf6:	8832                	mv	a6,a2
    1cf8:	8b9d                	andi	a5,a5,7
    1cfa:	4581                	li	a1,0
    1cfc:	ea0607e3          	beqz	a2,1baa <strncpy+0xd2>
    1d00:	b7cd                	j	1ce2 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d02:	872a                	mv	a4,a0
}
    1d04:	853a                	mv	a0,a4
    1d06:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d08:	458d                	li	a1,3
    1d0a:	b739                	j	1c18 <strncpy+0x140>
    1d0c:	4585                	li	a1,1
    1d0e:	b729                	j	1c18 <strncpy+0x140>
    1d10:	86ba                	mv	a3,a4
    1d12:	4581                	li	a1,0
    1d14:	b711                	j	1c18 <strncpy+0x140>
    1d16:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d1a:	872a                	mv	a4,a0
    1d1c:	85b6                	mv	a1,a3
    1d1e:	bda9                	j	1b78 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d20:	87ba                	mv	a5,a4
    1d22:	4581                	li	a1,0
    1d24:	bf21                	j	1c3c <strncpy+0x164>
    1d26:	4589                	li	a1,2
    1d28:	bdc5                	j	1c18 <strncpy+0x140>
    1d2a:	4591                	li	a1,4
    1d2c:	b5f5                	j	1c18 <strncpy+0x140>
    1d2e:	4595                	li	a1,5
    1d30:	b5e5                	j	1c18 <strncpy+0x140>
    1d32:	4599                	li	a1,6
    1d34:	b5d5                	j	1c18 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d36:	00d50023          	sb	a3,0(a0)
    1d3a:	872a                	mv	a4,a0
    1d3c:	b5b9                	j	1b8a <strncpy+0xb2>

0000000000001d3e <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d3e:	87aa                	mv	a5,a0
    1d40:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d42:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d46:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d4a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d4c:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d4e:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d52:	2501                	sext.w	a0,a0
    1d54:	8082                	ret

0000000000001d56 <openat>:
    register long a7 __asm__("a7") = n;
    1d56:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d5a:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d5e:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d62:	2501                	sext.w	a0,a0
    1d64:	8082                	ret

0000000000001d66 <close>:
    register long a7 __asm__("a7") = n;
    1d66:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d6a:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d6e:	2501                	sext.w	a0,a0
    1d70:	8082                	ret

0000000000001d72 <read>:
    register long a7 __asm__("a7") = n;
    1d72:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d76:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d7a:	8082                	ret

0000000000001d7c <write>:
    register long a7 __asm__("a7") = n;
    1d7c:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d80:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d84:	8082                	ret

0000000000001d86 <getpid>:
    register long a7 __asm__("a7") = n;
    1d86:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d8a:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <getppid>:
    register long a7 __asm__("a7") = n;
    1d92:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d96:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d9e:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1da2:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <fork>:
    register long a7 __asm__("a7") = n;
    1daa:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1dae:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1db0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db2:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1db6:	2501                	sext.w	a0,a0
    1db8:	8082                	ret

0000000000001dba <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1dba:	85b2                	mv	a1,a2
    1dbc:	863a                	mv	a2,a4
    if (stack)
    1dbe:	c191                	beqz	a1,1dc2 <clone+0x8>
	stack += stack_size;
    1dc0:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dc2:	4781                	li	a5,0
    1dc4:	4701                	li	a4,0
    1dc6:	4681                	li	a3,0
    1dc8:	2601                	sext.w	a2,a2
    1dca:	1ec0006f          	j	1fb6 <__clone>

0000000000001dce <exit>:
    register long a7 __asm__("a7") = n;
    1dce:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dd2:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dd6:	8082                	ret

0000000000001dd8 <waitpid>:
    register long a7 __asm__("a7") = n;
    1dd8:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1ddc:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dde:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <exec>:
    register long a7 __asm__("a7") = n;
    1de6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1dea:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <execve>:
    register long a7 __asm__("a7") = n;
    1df2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df6:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <times>:
    register long a7 __asm__("a7") = n;
    1dfe:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e02:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <get_time>:

int64 get_time()
{
    1e0a:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e0c:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e10:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e12:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e14:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e18:	2501                	sext.w	a0,a0
    1e1a:	ed09                	bnez	a0,1e34 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e1c:	67a2                	ld	a5,8(sp)
    1e1e:	3e800713          	li	a4,1000
    1e22:	00015503          	lhu	a0,0(sp)
    1e26:	02e7d7b3          	divu	a5,a5,a4
    1e2a:	02e50533          	mul	a0,a0,a4
    1e2e:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e30:	0141                	addi	sp,sp,16
    1e32:	8082                	ret
        return -1;
    1e34:	557d                	li	a0,-1
    1e36:	bfed                	j	1e30 <get_time+0x26>

0000000000001e38 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e38:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3c:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <time>:
    register long a7 __asm__("a7") = n;
    1e44:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e48:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e4c:	2501                	sext.w	a0,a0
    1e4e:	8082                	ret

0000000000001e50 <sleep>:

int sleep(unsigned long long time)
{
    1e50:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e52:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e54:	850a                	mv	a0,sp
    1e56:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e58:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e5c:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5e:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e62:	e501                	bnez	a0,1e6a <sleep+0x1a>
    return 0;
    1e64:	4501                	li	a0,0
}
    1e66:	0141                	addi	sp,sp,16
    1e68:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e6a:	4502                	lw	a0,0(sp)
}
    1e6c:	0141                	addi	sp,sp,16
    1e6e:	8082                	ret

0000000000001e70 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e70:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e74:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e78:	2501                	sext.w	a0,a0
    1e7a:	8082                	ret

0000000000001e7c <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e7c:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e80:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e84:	8082                	ret

0000000000001e86 <munmap>:
    register long a7 __asm__("a7") = n;
    1e86:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8a:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e8e:	2501                	sext.w	a0,a0
    1e90:	8082                	ret

0000000000001e92 <wait>:

int wait(int *code)
{
    1e92:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e94:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e98:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e9a:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e9c:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e9e:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	8082                	ret

0000000000001ea6 <spawn>:
    register long a7 __asm__("a7") = n;
    1ea6:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1eaa:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <mailread>:
    register long a7 __asm__("a7") = n;
    1eb2:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb6:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ebe:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec2:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ec6:	2501                	sext.w	a0,a0
    1ec8:	8082                	ret

0000000000001eca <fstat>:
    register long a7 __asm__("a7") = n;
    1eca:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ece:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ed2:	2501                	sext.w	a0,a0
    1ed4:	8082                	ret

0000000000001ed6 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ed6:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ed8:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1edc:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ede:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1ee2:	2501                	sext.w	a0,a0
    1ee4:	8082                	ret

0000000000001ee6 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ee6:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ee8:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1eec:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eee:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1ef2:	2501                	sext.w	a0,a0
    1ef4:	8082                	ret

0000000000001ef6 <link>:

int link(char *old_path, char *new_path)
{
    1ef6:	87aa                	mv	a5,a0
    1ef8:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1efa:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1efe:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f02:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f04:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f08:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f0a:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f0e:	2501                	sext.w	a0,a0
    1f10:	8082                	ret

0000000000001f12 <unlink>:

int unlink(char *path)
{
    1f12:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f14:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f18:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f1c:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f1e:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f22:	2501                	sext.w	a0,a0
    1f24:	8082                	ret

0000000000001f26 <uname>:
    register long a7 __asm__("a7") = n;
    1f26:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f2a:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f2e:	2501                	sext.w	a0,a0
    1f30:	8082                	ret

0000000000001f32 <brk>:
    register long a7 __asm__("a7") = n;
    1f32:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f36:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f3a:	2501                	sext.w	a0,a0
    1f3c:	8082                	ret

0000000000001f3e <getcwd>:
    register long a7 __asm__("a7") = n;
    1f3e:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f40:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f44:	8082                	ret

0000000000001f46 <chdir>:
    register long a7 __asm__("a7") = n;
    1f46:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f4a:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f4e:	2501                	sext.w	a0,a0
    1f50:	8082                	ret

0000000000001f52 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f52:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f54:	02059613          	slli	a2,a1,0x20
    1f58:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f5a:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f5e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f62:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f64:	00000073          	ecall
}
    1f68:	2501                	sext.w	a0,a0
    1f6a:	8082                	ret

0000000000001f6c <getdents>:
    register long a7 __asm__("a7") = n;
    1f6c:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f70:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f74:	2501                	sext.w	a0,a0
    1f76:	8082                	ret

0000000000001f78 <pipe>:
    register long a7 __asm__("a7") = n;
    1f78:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f7c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f7e:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f82:	2501                	sext.w	a0,a0
    1f84:	8082                	ret

0000000000001f86 <dup>:
    register long a7 __asm__("a7") = n;
    1f86:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f88:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f8c:	2501                	sext.w	a0,a0
    1f8e:	8082                	ret

0000000000001f90 <dup2>:
    register long a7 __asm__("a7") = n;
    1f90:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f92:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f94:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f98:	2501                	sext.w	a0,a0
    1f9a:	8082                	ret

0000000000001f9c <mount>:
    register long a7 __asm__("a7") = n;
    1f9c:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fa0:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fa4:	2501                	sext.w	a0,a0
    1fa6:	8082                	ret

0000000000001fa8 <umount>:
    register long a7 __asm__("a7") = n;
    1fa8:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fac:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fae:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fb2:	2501                	sext.w	a0,a0
    1fb4:	8082                	ret

0000000000001fb6 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fb6:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fb8:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fba:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fbc:	8532                	mv	a0,a2
	mv a2, a4
    1fbe:	863a                	mv	a2,a4
	mv a3, a5
    1fc0:	86be                	mv	a3,a5
	mv a4, a6
    1fc2:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fc4:	0dc00893          	li	a7,220
	ecall
    1fc8:	00000073          	ecall

	beqz a0, 1f
    1fcc:	c111                	beqz	a0,1fd0 <__clone+0x1a>
	# Parent
	ret
    1fce:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fd0:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fd2:	6522                	ld	a0,8(sp)
	jalr a1
    1fd4:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fd6:	05d00893          	li	a7,93
	ecall
    1fda:	00000073          	ecall
