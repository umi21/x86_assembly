
default rel

section .rodata
    global RED
    RED dd 0xFF000000

    global GREEN
    GREEN dd 0x00FF0000

    global BLUE
    BLUE dd 0x0000FF00

section .data
    global base_color
    base_color dd 0xFFFFFF00

section .text

global get_color_value
get_color_value:
    mov eax, dword [rdi]
    ret

global add_base_color
add_base_color:
    call get_color_value
    mov dword [rel base_color], eax
    ret

global make_color_combination
make_color_combination:
    extern combining_function
    mov rbx, rdi
    mov edi, dword [base_color]
    mov esi, dword [rsi]
    call combining_function
    mov [rbx], eax
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
