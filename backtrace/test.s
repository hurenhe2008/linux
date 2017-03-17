
test_backtrace:     file format elf32-i386


Disassembly of section .init:

08048414 <_init>:
 8048414:	53                   	push   %ebx
 8048415:	83 ec 08             	sub    $0x8,%esp
 8048418:	e8 13 01 00 00       	call   8048530 <__x86.get_pc_thunk.bx>
 804841d:	81 c3 e3 1b 00 00    	add    $0x1be3,%ebx
 8048423:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 8048429:	85 c0                	test   %eax,%eax
 804842b:	74 05                	je     8048432 <_init+0x1e>
 804842d:	e8 7e 00 00 00       	call   80484b0 <__gmon_start__@plt>
 8048432:	83 c4 08             	add    $0x8,%esp
 8048435:	5b                   	pop    %ebx
 8048436:	c3                   	ret    

Disassembly of section .plt:

08048440 <printf@plt-0x10>:
 8048440:	ff 35 04 a0 04 08    	pushl  0x804a004
 8048446:	ff 25 08 a0 04 08    	jmp    *0x804a008
 804844c:	00 00                	add    %al,(%eax)
	...

08048450 <printf@plt>:
 8048450:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 8048456:	68 00 00 00 00       	push   $0x0
 804845b:	e9 e0 ff ff ff       	jmp    8048440 <_init+0x2c>

08048460 <free@plt>:
 8048460:	ff 25 10 a0 04 08    	jmp    *0x804a010
 8048466:	68 08 00 00 00       	push   $0x8
 804846b:	e9 d0 ff ff ff       	jmp    8048440 <_init+0x2c>

08048470 <getchar@plt>:
 8048470:	ff 25 14 a0 04 08    	jmp    *0x804a014
 8048476:	68 10 00 00 00       	push   $0x10
 804847b:	e9 c0 ff ff ff       	jmp    8048440 <_init+0x2c>

08048480 <signal@plt>:
 8048480:	ff 25 18 a0 04 08    	jmp    *0x804a018
 8048486:	68 18 00 00 00       	push   $0x18
 804848b:	e9 b0 ff ff ff       	jmp    8048440 <_init+0x2c>

08048490 <__stack_chk_fail@plt>:
 8048490:	ff 25 1c a0 04 08    	jmp    *0x804a01c
 8048496:	68 20 00 00 00       	push   $0x20
 804849b:	e9 a0 ff ff ff       	jmp    8048440 <_init+0x2c>

080484a0 <strerror@plt>:
 80484a0:	ff 25 20 a0 04 08    	jmp    *0x804a020
 80484a6:	68 28 00 00 00       	push   $0x28
 80484ab:	e9 90 ff ff ff       	jmp    8048440 <_init+0x2c>

080484b0 <__gmon_start__@plt>:
 80484b0:	ff 25 24 a0 04 08    	jmp    *0x804a024
 80484b6:	68 30 00 00 00       	push   $0x30
 80484bb:	e9 80 ff ff ff       	jmp    8048440 <_init+0x2c>

080484c0 <__libc_start_main@plt>:
 80484c0:	ff 25 28 a0 04 08    	jmp    *0x804a028
 80484c6:	68 38 00 00 00       	push   $0x38
 80484cb:	e9 70 ff ff ff       	jmp    8048440 <_init+0x2c>

080484d0 <backtrace_symbols@plt>:
 80484d0:	ff 25 2c a0 04 08    	jmp    *0x804a02c
 80484d6:	68 40 00 00 00       	push   $0x40
 80484db:	e9 60 ff ff ff       	jmp    8048440 <_init+0x2c>

080484e0 <__errno_location@plt>:
 80484e0:	ff 25 30 a0 04 08    	jmp    *0x804a030
 80484e6:	68 48 00 00 00       	push   $0x48
 80484eb:	e9 50 ff ff ff       	jmp    8048440 <_init+0x2c>

080484f0 <backtrace@plt>:
 80484f0:	ff 25 34 a0 04 08    	jmp    *0x804a034
 80484f6:	68 50 00 00 00       	push   $0x50
 80484fb:	e9 40 ff ff ff       	jmp    8048440 <_init+0x2c>

Disassembly of section .text:

08048500 <_start>:
 8048500:	31 ed                	xor    %ebp,%ebp
 8048502:	5e                   	pop    %esi
 8048503:	89 e1                	mov    %esp,%ecx
 8048505:	83 e4 f0             	and    $0xfffffff0,%esp
 8048508:	50                   	push   %eax
 8048509:	54                   	push   %esp
 804850a:	52                   	push   %edx
 804850b:	68 20 88 04 08       	push   $0x8048820
 8048510:	68 c0 87 04 08       	push   $0x80487c0
 8048515:	51                   	push   %ecx
 8048516:	56                   	push   %esi
 8048517:	68 fb 85 04 08       	push   $0x80485fb
 804851c:	e8 9f ff ff ff       	call   80484c0 <__libc_start_main@plt>
 8048521:	f4                   	hlt    
 8048522:	66 90                	xchg   %ax,%ax
 8048524:	66 90                	xchg   %ax,%ax
 8048526:	66 90                	xchg   %ax,%ax
 8048528:	66 90                	xchg   %ax,%ax
 804852a:	66 90                	xchg   %ax,%ax
 804852c:	66 90                	xchg   %ax,%ax
 804852e:	66 90                	xchg   %ax,%ax

08048530 <__x86.get_pc_thunk.bx>:
 8048530:	8b 1c 24             	mov    (%esp),%ebx
 8048533:	c3                   	ret    
 8048534:	66 90                	xchg   %ax,%ax
 8048536:	66 90                	xchg   %ax,%ax
 8048538:	66 90                	xchg   %ax,%ax
 804853a:	66 90                	xchg   %ax,%ax
 804853c:	66 90                	xchg   %ax,%ax
 804853e:	66 90                	xchg   %ax,%ax

08048540 <deregister_tm_clones>:
 8048540:	b8 43 a0 04 08       	mov    $0x804a043,%eax
 8048545:	2d 40 a0 04 08       	sub    $0x804a040,%eax
 804854a:	83 f8 06             	cmp    $0x6,%eax
 804854d:	76 1a                	jbe    8048569 <deregister_tm_clones+0x29>
 804854f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048554:	85 c0                	test   %eax,%eax
 8048556:	74 11                	je     8048569 <deregister_tm_clones+0x29>
 8048558:	55                   	push   %ebp
 8048559:	89 e5                	mov    %esp,%ebp
 804855b:	83 ec 14             	sub    $0x14,%esp
 804855e:	68 40 a0 04 08       	push   $0x804a040
 8048563:	ff d0                	call   *%eax
 8048565:	83 c4 10             	add    $0x10,%esp
 8048568:	c9                   	leave  
 8048569:	f3 c3                	repz ret 
 804856b:	90                   	nop
 804856c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08048570 <register_tm_clones>:
 8048570:	b8 40 a0 04 08       	mov    $0x804a040,%eax
 8048575:	2d 40 a0 04 08       	sub    $0x804a040,%eax
 804857a:	c1 f8 02             	sar    $0x2,%eax
 804857d:	89 c2                	mov    %eax,%edx
 804857f:	c1 ea 1f             	shr    $0x1f,%edx
 8048582:	01 d0                	add    %edx,%eax
 8048584:	d1 f8                	sar    %eax
 8048586:	74 1b                	je     80485a3 <register_tm_clones+0x33>
 8048588:	ba 00 00 00 00       	mov    $0x0,%edx
 804858d:	85 d2                	test   %edx,%edx
 804858f:	74 12                	je     80485a3 <register_tm_clones+0x33>
 8048591:	55                   	push   %ebp
 8048592:	89 e5                	mov    %esp,%ebp
 8048594:	83 ec 10             	sub    $0x10,%esp
 8048597:	50                   	push   %eax
 8048598:	68 40 a0 04 08       	push   $0x804a040
 804859d:	ff d2                	call   *%edx
 804859f:	83 c4 10             	add    $0x10,%esp
 80485a2:	c9                   	leave  
 80485a3:	f3 c3                	repz ret 
 80485a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80485a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080485b0 <__do_global_dtors_aux>:
 80485b0:	80 3d 40 a0 04 08 00 	cmpb   $0x0,0x804a040
 80485b7:	75 13                	jne    80485cc <__do_global_dtors_aux+0x1c>
 80485b9:	55                   	push   %ebp
 80485ba:	89 e5                	mov    %esp,%ebp
 80485bc:	83 ec 08             	sub    $0x8,%esp
 80485bf:	e8 7c ff ff ff       	call   8048540 <deregister_tm_clones>
 80485c4:	c6 05 40 a0 04 08 01 	movb   $0x1,0x804a040
 80485cb:	c9                   	leave  
 80485cc:	f3 c3                	repz ret 
 80485ce:	66 90                	xchg   %ax,%ax

080485d0 <frame_dummy>:
 80485d0:	b8 10 9f 04 08       	mov    $0x8049f10,%eax
 80485d5:	8b 10                	mov    (%eax),%edx
 80485d7:	85 d2                	test   %edx,%edx
 80485d9:	75 05                	jne    80485e0 <frame_dummy+0x10>
 80485db:	eb 93                	jmp    8048570 <register_tm_clones>
 80485dd:	8d 76 00             	lea    0x0(%esi),%esi
 80485e0:	ba 00 00 00 00       	mov    $0x0,%edx
 80485e5:	85 d2                	test   %edx,%edx
 80485e7:	74 f2                	je     80485db <frame_dummy+0xb>
 80485e9:	55                   	push   %ebp
 80485ea:	89 e5                	mov    %esp,%ebp
 80485ec:	83 ec 14             	sub    $0x14,%esp
 80485ef:	50                   	push   %eax
 80485f0:	ff d2                	call   *%edx
 80485f2:	83 c4 10             	add    $0x10,%esp
 80485f5:	c9                   	leave  
 80485f6:	e9 75 ff ff ff       	jmp    8048570 <register_tm_clones>

080485fb <main>:
 80485fb:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 80485ff:	83 e4 f0             	and    $0xfffffff0,%esp
 8048602:	ff 71 fc             	pushl  -0x4(%ecx)
 8048605:	55                   	push   %ebp
 8048606:	89 e5                	mov    %esp,%ebp
 8048608:	51                   	push   %ecx
 8048609:	83 ec 04             	sub    $0x4,%esp
 804860c:	83 ec 08             	sub    $0x8,%esp
 804860f:	68 99 87 04 08       	push   $0x8048799
 8048614:	6a 0b                	push   $0xb
 8048616:	e8 65 fe ff ff       	call   8048480 <signal@plt>
 804861b:	83 c4 10             	add    $0x10,%esp
 804861e:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048621:	75 2b                	jne    804864e <main+0x53>
 8048623:	e8 b8 fe ff ff       	call   80484e0 <__errno_location@plt>
 8048628:	8b 00                	mov    (%eax),%eax
 804862a:	83 ec 0c             	sub    $0xc,%esp
 804862d:	50                   	push   %eax
 804862e:	e8 6d fe ff ff       	call   80484a0 <strerror@plt>
 8048633:	83 c4 10             	add    $0x10,%esp
 8048636:	83 ec 08             	sub    $0x8,%esp
 8048639:	50                   	push   %eax
 804863a:	68 40 88 04 08       	push   $0x8048840
 804863f:	e8 0c fe ff ff       	call   8048450 <printf@plt>
 8048644:	83 c4 10             	add    $0x10,%esp
 8048647:	b8 00 00 00 00       	mov    $0x0,%eax
 804864c:	eb 1a                	jmp    8048668 <main+0x6d>
 804864e:	e8 1d 00 00 00       	call   8048670 <trace_stack>
 8048653:	b8 00 00 00 00       	mov    $0x0,%eax
 8048658:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 804865e:	e8 0d fe ff ff       	call   8048470 <getchar@plt>
 8048663:	b8 00 00 00 00       	mov    $0x0,%eax
 8048668:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 804866b:	c9                   	leave  
 804866c:	8d 61 fc             	lea    -0x4(%ecx),%esp
 804866f:	c3                   	ret    

08048670 <trace_stack>:
 8048670:	55                   	push   %ebp
 8048671:	89 e5                	mov    %esp,%ebp
 8048673:	53                   	push   %ebx
 8048674:	83 ec 24             	sub    $0x24,%esp
 8048677:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 804867d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048680:	31 c0                	xor    %eax,%eax
 8048682:	89 e0                	mov    %esp,%eax
 8048684:	89 c3                	mov    %eax,%ebx
 8048686:	c7 45 e0 64 00 00 00 	movl   $0x64,-0x20(%ebp)
 804868d:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048690:	83 e8 01             	sub    $0x1,%eax
 8048693:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8048696:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048699:	c1 e0 02             	shl    $0x2,%eax
 804869c:	8d 50 03             	lea    0x3(%eax),%edx
 804869f:	b8 10 00 00 00       	mov    $0x10,%eax
 80486a4:	83 e8 01             	sub    $0x1,%eax
 80486a7:	01 d0                	add    %edx,%eax
 80486a9:	b9 10 00 00 00       	mov    $0x10,%ecx
 80486ae:	ba 00 00 00 00       	mov    $0x0,%edx
 80486b3:	f7 f1                	div    %ecx
 80486b5:	6b c0 10             	imul   $0x10,%eax,%eax
 80486b8:	29 c4                	sub    %eax,%esp
 80486ba:	89 e0                	mov    %esp,%eax
 80486bc:	83 c0 03             	add    $0x3,%eax
 80486bf:	c1 e8 02             	shr    $0x2,%eax
 80486c2:	c1 e0 02             	shl    $0x2,%eax
 80486c5:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80486c8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 80486cf:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 80486d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80486d9:	83 ec 08             	sub    $0x8,%esp
 80486dc:	ff 75 e0             	pushl  -0x20(%ebp)
 80486df:	50                   	push   %eax
 80486e0:	e8 0b fe ff ff       	call   80484f0 <backtrace@plt>
 80486e5:	83 c4 10             	add    $0x10,%esp
 80486e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80486eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80486ee:	83 ec 08             	sub    $0x8,%esp
 80486f1:	ff 75 ec             	pushl  -0x14(%ebp)
 80486f4:	50                   	push   %eax
 80486f5:	e8 d6 fd ff ff       	call   80484d0 <backtrace_symbols@plt>
 80486fa:	83 c4 10             	add    $0x10,%esp
 80486fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048700:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8048704:	75 2b                	jne    8048731 <trace_stack+0xc1>
 8048706:	e8 d5 fd ff ff       	call   80484e0 <__errno_location@plt>
 804870b:	8b 00                	mov    (%eax),%eax
 804870d:	83 ec 0c             	sub    $0xc,%esp
 8048710:	50                   	push   %eax
 8048711:	e8 8a fd ff ff       	call   80484a0 <strerror@plt>
 8048716:	83 c4 10             	add    $0x10,%esp
 8048719:	83 ec 08             	sub    $0x8,%esp
 804871c:	50                   	push   %eax
 804871d:	68 58 88 04 08       	push   $0x8048858
 8048722:	e8 29 fd ff ff       	call   8048450 <printf@plt>
 8048727:	83 c4 10             	add    $0x10,%esp
 804872a:	b8 00 00 00 00       	mov    $0x0,%eax
 804872f:	eb 4d                	jmp    804877e <trace_stack+0x10e>
 8048731:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8048738:	eb 29                	jmp    8048763 <trace_stack+0xf3>
 804873a:	8b 45 dc             	mov    -0x24(%ebp),%eax
 804873d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048744:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048747:	01 d0                	add    %edx,%eax
 8048749:	8b 00                	mov    (%eax),%eax
 804874b:	83 ec 04             	sub    $0x4,%esp
 804874e:	50                   	push   %eax
 804874f:	ff 75 dc             	pushl  -0x24(%ebp)
 8048752:	68 77 88 04 08       	push   $0x8048877
 8048757:	e8 f4 fc ff ff       	call   8048450 <printf@plt>
 804875c:	83 c4 10             	add    $0x10,%esp
 804875f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
 8048763:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8048766:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8048769:	7c cf                	jl     804873a <trace_stack+0xca>
 804876b:	83 ec 0c             	sub    $0xc,%esp
 804876e:	ff 75 f0             	pushl  -0x10(%ebp)
 8048771:	e8 ea fc ff ff       	call   8048460 <free@plt>
 8048776:	83 c4 10             	add    $0x10,%esp
 8048779:	b8 01 00 00 00       	mov    $0x1,%eax
 804877e:	89 dc                	mov    %ebx,%esp
 8048780:	83 f8 01             	cmp    $0x1,%eax
 8048783:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048786:	65 33 05 14 00 00 00 	xor    %gs:0x14,%eax
 804878d:	74 05                	je     8048794 <trace_stack+0x124>
 804878f:	e8 fc fc ff ff       	call   8048490 <__stack_chk_fail@plt>
 8048794:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048797:	c9                   	leave  
 8048798:	c3                   	ret    

08048799 <signal_catch>:
 8048799:	55                   	push   %ebp
 804879a:	89 e5                	mov    %esp,%ebp
 804879c:	83 ec 08             	sub    $0x8,%esp
 804879f:	83 ec 08             	sub    $0x8,%esp
 80487a2:	ff 75 08             	pushl  0x8(%ebp)
 80487a5:	68 81 88 04 08       	push   $0x8048881
 80487aa:	e8 a1 fc ff ff       	call   8048450 <printf@plt>
 80487af:	83 c4 10             	add    $0x10,%esp
 80487b2:	e8 b9 fe ff ff       	call   8048670 <trace_stack>
 80487b7:	90                   	nop
 80487b8:	c9                   	leave  
 80487b9:	c3                   	ret    
 80487ba:	66 90                	xchg   %ax,%ax
 80487bc:	66 90                	xchg   %ax,%ax
 80487be:	66 90                	xchg   %ax,%ax

080487c0 <__libc_csu_init>:
 80487c0:	55                   	push   %ebp
 80487c1:	57                   	push   %edi
 80487c2:	31 ff                	xor    %edi,%edi
 80487c4:	56                   	push   %esi
 80487c5:	53                   	push   %ebx
 80487c6:	e8 65 fd ff ff       	call   8048530 <__x86.get_pc_thunk.bx>
 80487cb:	81 c3 35 18 00 00    	add    $0x1835,%ebx
 80487d1:	83 ec 0c             	sub    $0xc,%esp
 80487d4:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 80487d8:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 80487de:	e8 31 fc ff ff       	call   8048414 <_init>
 80487e3:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 80487e9:	29 c6                	sub    %eax,%esi
 80487eb:	c1 fe 02             	sar    $0x2,%esi
 80487ee:	85 f6                	test   %esi,%esi
 80487f0:	74 23                	je     8048815 <__libc_csu_init+0x55>
 80487f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80487f8:	83 ec 04             	sub    $0x4,%esp
 80487fb:	ff 74 24 2c          	pushl  0x2c(%esp)
 80487ff:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048803:	55                   	push   %ebp
 8048804:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 804880b:	83 c7 01             	add    $0x1,%edi
 804880e:	83 c4 10             	add    $0x10,%esp
 8048811:	39 f7                	cmp    %esi,%edi
 8048813:	75 e3                	jne    80487f8 <__libc_csu_init+0x38>
 8048815:	83 c4 0c             	add    $0xc,%esp
 8048818:	5b                   	pop    %ebx
 8048819:	5e                   	pop    %esi
 804881a:	5f                   	pop    %edi
 804881b:	5d                   	pop    %ebp
 804881c:	c3                   	ret    
 804881d:	8d 76 00             	lea    0x0(%esi),%esi

08048820 <__libc_csu_fini>:
 8048820:	f3 c3                	repz ret 

Disassembly of section .fini:

08048824 <_fini>:
 8048824:	53                   	push   %ebx
 8048825:	83 ec 08             	sub    $0x8,%esp
 8048828:	e8 03 fd ff ff       	call   8048530 <__x86.get_pc_thunk.bx>
 804882d:	81 c3 d3 17 00 00    	add    $0x17d3,%ebx
 8048833:	83 c4 08             	add    $0x8,%esp
 8048836:	5b                   	pop    %ebx
 8048837:	c3                   	ret    
