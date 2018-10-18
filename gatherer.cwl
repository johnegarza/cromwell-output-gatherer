#! /usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ['/bin/cp']

requirements:
    - class: ShellCommandRequirement
    - class: DockerRequirement
      dockerPull: "ubuntu:xenial"

arguments: [
    { shellQuote: false, valueFrom: "-t" }
]

inputs:
    output_dir:
        type: string
        inputBinding:
            position: 1
    all_files:
        type: File[]
        inputBinding:
            position: 2

outputs:
    gathered_files:
        type:
            type: array
            items: File
        outputBinding:
            glob: $(inputs.all_files)
