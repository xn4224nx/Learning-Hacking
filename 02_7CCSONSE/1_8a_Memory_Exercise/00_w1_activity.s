<main>:
   0x08048444 <+0>:	push   %ebp
   0x08048445 <+1>:	mov    %esp,%ebp
   0x08048447 <+3>:	and    $0xfffffff0,%esp
   0x0804844a <+6>:	sub    $0x20,%esp
   0x0804844d <+9>:	mov    0x804a01c,%eax
   0x08048452 <+14>:	mov    %eax,0x14(%esp)
   0x08048456 <+18>:	movl   $0x4,(%esp)
   0x0804845d <+25>:	call   0x8048350 <malloc@plt>
   0x08048462 <+30>:	mov    %eax,0x18(%esp)
   0x08048466 <+34>:	mov    0x18(%esp),%eax
   0x0804846a <+38>:	mov    0x14(%esp),%edx
   0x0804846e <+42>:	mov    %edx,(%eax)
   0x08048470 <+44>:	mov    0x18(%esp),%eax
   0x08048474 <+48>:	mov    (%eax),%eax
   0x08048476 <+50>:	lea    0x1(%eax),%edx
   0x08048479 <+53>:	mov    0x18(%esp),%eax
   0x0804847d <+57>:	mov    %edx,(%eax)
   0x0804847f <+59>:	mov    0x18(%esp),%eax
   0x08048483 <+63>:	mov    (%eax),%eax
   0x08048485 <+65>:	movl   $0x2a,0x8(%esp)
   0x0804848d <+73>:	movl   $0xa,0x4(%esp)
   0x08048495 <+81>:	mov    %eax,(%esp)
   0x08048498 <+84>:	call   0x80484ad <foo>
   0x0804849d <+89>:	mov    %eax,0x1c(%esp)
   0x080484a1 <+93>:	mov    0x1c(%esp),%eax
   0x080484a5 <+97>:	mov    %eax,(%esp)
   0x080484a8 <+100>:	call   0x8048370 <exit@plt>

<foo>:
   0x080484ad <+0>:	push   %ebp
   0x080484ae <+1>:	mov    %esp,%ebp
   0x080484b0 <+3>:	sub    $0x18,%esp
   0x080484b3 <+6>:	mov    $0x80485a0,%eax
   0x080484b8 <+11>:	mov    0x8(%ebp),%edx
   0x080484bb <+14>:	mov    %edx,0x4(%esp)
   0x080484bf <+18>:	mov    %eax,(%esp)
   0x080484c2 <+21>:	call   0x8048340 <printf@plt>
   0x080484c7 <+26>:	mov    0x8(%ebp),%eax
   0x080484ca <+29>:	leave
   0x080484cb <+30>:	ret
