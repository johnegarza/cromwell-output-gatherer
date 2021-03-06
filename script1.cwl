#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

baseCommand: ["/bin/bash", "/usr/bin/script1.sh"]
requirements:
    - class: DockerRequirement
      dockerPull: "johnegarza/cromwell-output-gatherer"

arguments:
    - position: 1
      valueFrom: "script1.txt"
inputs:
    script_text_file:
        type: File
        inputBinding:
            position: 2
outputs:
    script1_text:
        type: File
        outputBinding:
            glob: "script1.txt"
