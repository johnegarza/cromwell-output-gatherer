#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
requirements:
    - class: SubworkflowFeatureRequirement

inputs:
    script_text_file:
        type: File

outputs:
    script1_text:
        type: File
        outputSource: script1/script1_text
    script2_text:
        type: File
        outputSource: script2/script2_text

steps:
    script1:
        run: script1.cwl
        in:
            script_text_file: script_text_file
        out:
            [script1_text]
    script2:
        run: script2.cwl
        in:
            script_text_file: script_text_file
        out:
            [script2_text]
