meta:
  id: qnx_boot_script_parser
  title: QNX Boot Script Parser
  tags: qnx
  endian: le
seq:
  - id: entries
    type: entry
    repeat: eos
types:
  entry:
    seq:
      - id: entry_len
        type: u2
      - id: entry_type
        type: u2
      - id: entry_body
        type:
          switch-on: entry_type
          cases:
            0: entry_type_external
            1: entry_type_waitfor
            2: entry_type_reopen
            3: entry_type_display_msg
            4: entry_type_procmgr_symlink
            5: entry_type_extsched_aps
            _: entry_type_unknown
        size: entry_len - 4
        if: entry_len != 0
  entry_type_external:
    seq:
      - id: cpu
        type: u1
      - id: priority
        type: u1
      - id: policy
        type: u1
      - id: flags
        type: u1
      - id: reserved_ext
        type: u2
      - id: arg_entry_count
        type: u1
      - id: env_entry_count
        type: u1
      - id: command
        type: str
        encoding: UTF-8
        terminator: 0x00
      - id: arg
        type: str
        encoding: UTF-8
        terminator: 0x00
        repeat: expr
        repeat-expr: arg_entry_count
      - id: env
        type: str
        encoding: UTF-8
        terminator: 0x00
        repeat: expr
        repeat-expr: env_entry_count
  entry_type_waitfor:
    seq:
      - id: checks
        type: u2
      - id: wait_for_target
        type: str
        encoding: UTF-8
        terminator: 0x00
  entry_type_reopen:
    seq:
      - id: checks
        type: u2
      - id: reopen_target
        type: str
        encoding: UTF-8
        terminator: 0x00
  entry_type_display_msg:
    seq:
      - id: message_data
        type: str
        encoding: UTF-8
        terminator: 0x00
  entry_type_procmgr_symlink:
    seq:
      - id: src_name
        type: str
        encoding: UTF-8
        terminator: 0x00
      - id: dest_name
        type: str
        encoding: UTF-8
        terminator: 0x00
  entry_type_extsched_aps:
    seq:
      - id: stringtest
        type: str
        encoding: UTF-8
        terminator: 0x00
  entry_type_unknown:
    seq:
      - id: stringtest
        type: str
        encoding: UTF-8
        terminator: 0x00
