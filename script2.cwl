#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

baseCommand: ["/bin/bash", "/usr/bin/script2.sh"]
requirements:
    - class: DockerRequirement
      dockerPull: "johnegarza/cromwell-output-gatherer"

arguments:
    - position: 1
      valueFrom: "script2.txt"
inputs:
    script_text_file:
        type: File
        inputBinding:
            position: 2
outputs:
    script2_text:
        type: File
        outputBinding:
            glob: "script2.txt"
