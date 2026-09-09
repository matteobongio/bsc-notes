#let title = [Operating Systems]
#set page(
   paper: "a4",
   header: align(left, title),
   numbering: "1",
)

#align(center, text(17pt)[
   *#title*
])

= Lecture 1

*Spooling*: when using slow devices, files sent are saved in a queue on a drive.

*Multiprogramming*: running processes simultaneously, rapid switching between processes.

*timesharing*: Each program has runs until it's waiting for IO, or when it's assigned time is over.


= Lecture 2 Processes and Threads

*Process*: program in execution

*Program*: executable file stored on disk

*Context Switching*: when switching processes, copy the current values of registers,
flags, PC, etc., and load valuess of the next process.

it works by having a timer generate interrupts, where it checks if it s time for context switching

*Process Control Block (PCB)*: used by OS to store the statues of each process (incl. values of
registers, PC, etc.)

*Process Table*: a list of PCBs

*Thread*: light-weight process, a lot is shared between threads.

*Kernel-level Threads* 

*User-level Threads*: implemented by programing languages, kernel is not aware.

*Thread pool*: make a bunch of threads at start-up, and they wait for work.


= Lecture 3 Process Scheduling

Which scheduling algorithm provides the lowest average waiting time? 

Shortest Remaining Time First

*Starvation problem*: when a process waits a long time for a resource

= Lecture 4: Inter Process Communications

*Shared memory*

*Messege passing*: pass messages through the kernel

*Race Condition*: when processes or threads can access a _shared data_ concurrently,
and at least one is a write access

*Requirements to avoid race conditions*:
+ No two processes may be simultaneously inside their critical regions. (_Mutual Exclusion_)
+ No assumptions may be made about speeds or the number of CPUs.
+ No process running outside its critical region may block other processes.
+ No process should have to wait forever to enter its critical region. (_Starvation_)

*Test and Set Lock*: reads the memory, and stores a nonzero value

$
cases(
0 => "resource is free",
"else" => "resource has already been taken"
)
$

*Semaphore*: Synchronization tool that provides more sophisticated ways for
processes to synchronize their activities

*Monitors*: A high-level abstraction that provides a convenient
and effective mechanism for process synchronization

= Lecture 6 Virtual Memory

Virtual memory involves the separation of logical memory as perceived by 
developers from physical memory.

*Page Fault*: when a page is referenced but not present.

*Thrashing*: pages are exchanged in and out of main memory too frequently. A process does not
have enough frames, so there are many page faults.

*Working Set Model*: Paging algorithm, for each program look at how many 
unique pages it used in the past $Delta$ time, allocate that many frames for that program.

= Lecture 7 File Systems management

*inodes*: file metadata

*Directory*: table of names to inodes

*Hard Link*: when an inode is cited multiple times

= Lecture 8 File Systems management

*Block allocation*:
- Contuguous allocation
- Linked allocation
- Indexed allocation

*Soft Links*: contains a path to a file

*Boot Block*: located in the first few sectors of a file system, contains the bootstrap
used to load the OS

*Super Block*: stores the state of the file system

*Free Space Management*: usually a bitmap to show free disk blocks

*Block Group*: subdivision of the partition, contains a block bitmap that, an inode bitmap,
and an inode table.

*Journaling*: technique used to ensure the integrity of the file system by keeping track of 
changes before they are applied

= Lecture 9 IO

*Memory Mapped IO*: each device controller has some registers for commucating with the CPU
we assign fake memory addresses to each register

Pros:
- Special IO instructions are needed to use the device registers, which are not available in all languages, but using addresses is simple.
- No status check needed, so faster IO operations
Cons:
- Caching the page of a device control register is very bad

*Direct Memory Access (DMA)*: DMA controller can use the system bus independent of the CPU,
it gets orders from the CPU, then executes them. It is slower than the CPU.

*Accessing BUS*: many buses can operate in 2 modes, _word-at-a-time_ and _block_.

In _word-at-a-time_ the DMA controller requests 1 word, called *cycle stealing* because it steals
an occasional bus cycle from the CPU.

In _block_ mode the DMA controller gets the bus, does a sereis of transfers then releases the
bus, called *burst mode*

*fly-by mode*: the DMA controller transfers the data directly to main memory.

*Interrupt Vector*: a table that holds a ptr to every interrupt service routine.
(kind of like how trap works)

*Precise interrupts*: leaves the machine in a well-defined state, 4 properties:
+ The PC is saved in a known place.
+ All instructions before the one pointed to by the PC have completed.
+ No instruction beyond the one pointed to by the PC has finished.
+ The execution state of the instruction pointed to by the PC is known.

*Imprecise Interrupts*: does not meet the four requirements, requires pushing a large amount of
internal state onto the stack, they are slow and complicated

*Buffers*: 
- If IO device is slow, the process can use a buffer, but the memory page cannot be paged out, so there is less pages for other processes which degrades performance
- Solution: *double buffering*, create a buffer in the kernel, for the interrupt handler, then when it s full, copy to user buffer.

*Hardware Clocks*
- current time
- elapsed time
- trigger operation

*Watchdog Timer*: detects hangs

= Lecture 10 IO

- Seek Time (S): The time needed for the head to move onto the track
- Rotational Latency Time (r): The time needed for the disk to rotate until the sector comes under the head
- Block Transfer Time (btt): The time needed to transfer data from head to sector (write) or sector to head (read)

*Cylinder skew*: a concept used in HDDs to improve performance  during sequential data access. 
It is an intentional offset of the starting vectors of adjacent tracks, to account for the 
time it takes the head to move.

*RAID*
0. _Striping_, data is split into strips and spread accross multiple drives, for speed.
1. _Mirroring_, data is mirrored on several disks, so that if 1 fails, there is always a backup
5. _Striping with parity_, a mix of both 0 and 1, requires at least 3 drives
// 6. _Striping with double parity_, RAID 5 but with 2 parity drives, needs at least 4 drives
10. _Mirrored striping_ litteraly just applying RAID 0 and RAID 1, needs at least 4 drives

*RAID 6 vs RAID 10?*

good question, RAID 10 is faster, but RAID 6 has better storage efficiency

*Shortest Seek Time First*: disk scheduling algorithm, chooses the IO operation closest to where it is.

*Elevator (SCAN)*: The disk arm starts at one end of the disk, and
moves toward the other end, servicing requests
until it gets to the other end of the disk, where the head movement is reversed.

= Lecture 11 Deadlocks

Strategies used for dealing with deadlocks:
1. _Ignore_ the problem, maybe it will go away
2. _Detection and recovery_. Let deadlocks occur, detect them, and take action
3. _Dynamic avoidance_ by careful resource allocation
4. _Prevention_, by structurally negating one of the four required conditions

A state is said to be safe if there is some scheduling order in which every process can run to
completion even if all of them suddenly request their maximum number of resources immediately.

*Banker's Algorithm*

#link("https://www.geeksforgeeks.org/bankers-algorithm-in-operating-system-2/")

*Deadlock prevention*
Assure that at least one of the conditions is never satisfied
- Mutual exclusion
- Hold and wait (two-phase locking), try to lock all resources at the beginning until u can, then use them, then free them
- No Preemption
- Circular wait, implse an order of requests for all resources

= Lecture 12 Virtualization

*Requirements for Virtualization*
1. Saftey
2. Fidelity
3. Efficiency

Sensitive Instructions: behave differently: user mode vs kernel mode.

Privileged Instructions: Cause a trap if executed in user mode

*Type 1 hypervisor*: high performance, runs OSes side by side

*Type 2 hypervisor*: performance overhead, it is a host OS process

*Paravirtualization*: when the guest OS knows there is a hypervisor, and makes call explicitly to the hypervisor.




#pagebreak()
=




*Passive attack*: an attack without modifying data, only reading. Eavesdropping.

