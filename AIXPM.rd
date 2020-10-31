#AIXPM - AIX Package Manager, by Michael Felt aka aixtools
# Copyright 2020
# An Ansible 'project' that is to evolve from a role to a module

## History and Motivation to develop AIXPM

AIX, since roughly the year 2000 and the development of AIX 5.0 (alpha test), the concept
of 'geninstall' generic installer. This was the period of Project Montery. IBM AIX was involved
as they were considering porting AIX to the IA64 processor. This occurred, but was never
commercially available (GA release).

The concept was to support installation of packages from three philosophies: AIX native installer;
Linux (via RPM - Redhat Package Manager) and Install Anywhere (from Windows?).

As part of AIX 5L (the L for Linux affinity) geninstall became part of AIX. For better or worse,
the convention became to package OSS (aka GNU dependencies) using a GCC compiler and RPM.

Nearly 18 years later - to address the complaint know as "RPM-hell" IBM AIX OSS team added support
for yum (a python module used in redhat enviornments for years - to automate dependency installation).
This parallels the introduction of AIX 7.2.

While yum (which, officially is no longer developed) alleviates many issues - it continues the other
issue: namely the unintended collision of software packages both wanting to own a file-system-path,
e.g., /usr/lib/libiconv.a and incompatible contents.

AIXPM is not going to try and solve that issue. My first goal is to make it easier to get OSS software
packaged in `installp` aka `bff` (backup-file-format) installed using direct/proxied downloads
from the internet and/or internal servers - without requiring a sys-admin to manually download all the dependencies.

## Basics

The will be one directory {{ give_it_a_name }} where one or more packages are `copied` to.
Once all the files (if more than one is needed) the appropriate install program (e.g, installp or rpm)
will be called to install the software.

## Data
The first draft will define package requirements via a YAML file that describes the variable: {{ packages }}.
This will be either a list - perhaps with only one item.

This item will describe the source type {{ XXX }}, source location {{ YYY }}, and
filename {{ ZZZ }}.

The source type will determine how the file gets copied to the install directory {{ give it a name }}.

Once all the package file are copied - the installer will be called to execute them.

Additionally, to support Ansible idempotency an attribute {{ creates }} may be specified.
When it already exists - the copy and install process can be skipped.
