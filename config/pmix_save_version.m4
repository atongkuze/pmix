dnl -*- shell-script -*-
dnl
dnl PMIx copyrights:
dnl Copyright (c) 2013      Intel, Inc. All rights reserved
dnl
dnl########################
dnl This code has been adapted from pmix_get_version.m4sh in the Open MPI
dnl code base - per the Open MPI license, all copyrights are retained below.
dnl
dnl Copyright (c) 2004-2006 The Trustees of Indiana University and Indiana
dnl                         University Research and Technology
dnl                         Corporation.  All rights reserved.
dnl Copyright (c) 2004-2005 The University of Tennessee and The University
dnl                         of Tennessee Research Foundation.  All rights
dnl                         reserved.
dnl Copyright (c) 2004-2005 High Performance Computing Center Stuttgart, 
dnl                         University of Stuttgart.  All rights reserved.
dnl Copyright (c) 2004-2005 The Regents of the University of California.
dnl                         All rights reserved.
dnl Copyright (c) 2008-2012 Cisco Systems, Inc.  All rights reserved.
dnl########################
dnl $COPYRIGHT$
dnl 
dnl Additional copyrights may follow
dnl 
dnl $HEADER$
dnl

# PMIX_SAVE_VERSION(project_short, project-long, 
#                  version_file, header_file])
# ----------------------------------------------
# creates version information for project from version_file, using
# PMIX_GET_VERSION().  Information is AC_SUBSTed and put in
# header_file.
AC_DEFUN([PMIX_SAVE_VERSION], [
    PMIX_GET_VERSION([$3], [$1])

    AC_SUBST($1[_MAJOR_VERSION])
    AC_SUBST($1[_MINOR_VERSION])
    AC_SUBST($1[_RELEASE_VERSION])
    AC_SUBST($1[_GREEK_VERSION])
    AC_SUBST($1[_WANT_REPO_REV])
    AC_SUBST($1[_REPO_REV])
    AC_SUBST($1[_VERSION])
    AC_SUBST($1[_RELEASE_DATE])

    AC_MSG_CHECKING([$2 version])
    AC_MSG_RESULT([$]$1[_VERSION])
    AC_MSG_CHECKING([$2 release date])
    AC_MSG_RESULT([$]$1[_RELEASE_DATE])
    AC_MSG_CHECKING([$2 Subversion repository version])
    AC_MSG_RESULT([$]$1[_REPO_REV])

    AC_DEFINE_UNQUOTED($1[_MAJOR_VERSION], [$]$1[_MAJOR_VERSION],
        [Major release number of ]$2)
    AC_DEFINE_UNQUOTED($1[_MINOR_VERSION], [$]$1[_MINOR_VERSION],
        [Minor release number of ]$2)
    AC_DEFINE_UNQUOTED($1[_RELEASE_VERSION], [$]$1[_RELEASE_VERSION],
        [Release release number of ]$2)
    AC_DEFINE_UNQUOTED($1[_GREEK_VERSION], ["$]$1[_GREEK_VERSION"],
        [Greek - alpha, beta, etc - release number of ]$2)
    AC_DEFINE_UNQUOTED($1[_VERSION], ["$]$1[_RELEASE_VERSION"],
        [Complete release number of ]$2)
    AC_DEFINE_UNQUOTED($1[_RELEASE_DATE], ["$]$1[_RELEASE_DATE"],
        [Release date of ]$2)
    AC_DEFINE_UNQUOTED($1[_WANT_REPO_REV], [$]$1[_WANT_REPO_REV],
        [Whether we want to include the repository version or not ]$2)
    AC_DEFINE_UNQUOTED($1[_REPO_REV], ["$]$1[_REPO_REV"],
        [The repository version ]$2)

    AC_CONFIG_FILES([$4])
])dnl