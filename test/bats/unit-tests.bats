#!/usr/bin/env bats

load test_helper

NVM_SRC_DIR="${BATS_TEST_DIRNAME}/../.."
source "${NVM_SRC_DIR}/nvm.sh"

test_debug() {
    false # set to 'true' to get setup/teardown in test stderr
}

test_implementing() {
    true # set to 'false' to run all tests; set to 'true' to skip implemented tests
    # only used while porting to bats: remove afterward
}

setup() {
    test_debug && echo 'setup' >&2
    NVM_DIR="${BATS_TMPDIR}"
    cd "${NVM_DIR}"
    rm -Rf src alias v*
    mkdir src alias
    load "${NVM_SRC_DIR}/nvm.sh"
}

teardown() {
    test_debug && echo 'teardown' >&2
    NVM_DIR="${BATS_TMPDIR}"
    cd "${NVM_DIR}"
    rm -Rf src alias v*
}

@test './Unit tests/nvm_alias' {

    run nvm_alias
    assert_equal 1 "$status" "nvm_alias should exit with code 1"
    assert_match "$output" "An alias is required."
##!/bin/sh
#
#die () { echo $@ ; cleanup ; exit 1; }
#
#cleanup () {
#  rm -rf ../../../alias/test
#}
#
#. ../../../nvm.sh
#
#OUTPUT="$(nvm_alias 2>&1)"
#EXPECTED_OUTPUT='An alias is required.'
#[ "_$OUTPUT" = "_$EXPECTED_OUTPUT" ] || die "
#
#EXIT_CODE="$(nvm_alias >/dev/null 2>&1 ; echo $?)"
#[ "_$EXIT_CODE" = "_1" ] || die "'nvm_alias' exited with $EXIT_CODE, expected 1"
#
#rm -rf ../../../alias/nonexistent
#
#OUTPUT="$(nvm_alias nonexistent 2>&1)"
#EXPECTED_OUTPUT='Alias does not exist.'
#[ "_$OUTPUT" = "_$EXPECTED_OUTPUT" ] || die "'nvm_alias nonexistent' produced wrong output; got $OUTPUT"
#
#EXIT_CODE="$(nvm_alias nonexistent >/dev/null 2>&1 ; echo $?)"
#[ "_$EXIT_CODE" = "_2" ] || die "'nvm_alias nonexistent' exited with $EXIT_CODE, expected 2"
#
#EXPECTED_OUTPUT="0.10"
#nvm alias test "$EXPECTED_OUTPUT" || die "'nvm alias test $EXPECTED_OUTPUT' failed"
#OUTPUT="$(nvm_alias test)"
#[ "_$OUTPUT" = "_$EXPECTED_OUTPUT" ] || die "'nvm_alias test' produced wrong output; got $OUTPUT"
#
#cleanup
#
}

@test './Unit tests/nvm_checksum' {
##!/bin/sh
#
#cleanup () {
#  rm tmp/emptyfile tmp/testfile
#  rmdir tmp
#}
#die () { echo $@ ; cleanup; exit 1; }
#
#. ../../../nvm.sh
#
#mkdir -p tmp
#touch tmp/emptyfile
#echo -n "test" > tmp/testfile
#
#nvm_checksum tmp/emptyfile "da39a3ee5e6b4b0d3255bfef95601890afd80709" || die "nvm_checksum on an empty file did not match the SHA1 digest of the empty string"
#nvm_checksum tmp/testfile "da39a3ee5e6b4b0d3255bfef95601890afd80709" && die "nvm_checksum allowed a bad checksum"
#
#cleanup
}

@test './Unit tests/nvm_find_up' {
##!/bin/sh
#
#die () { echo $@ ; cleanup ; exit 1; }
#setup() {
#  cleanup
#  mkdir -p tmp_nvm_find_up/a/b/c/d
#  touch tmp_nvm_find_up/test
#  touch tmp_nvm_find_up/a/b/c/test
#}
#cleanup () {
#  rm -rf tmp_nvm_find_up
#}
#
#. ../../../nvm.sh
#
#setup
#
#TEST_DIR="$PWD"
#
#[ "~$(PWD=$TEST_DIR/tmp_nvm_find_up/a nvm_find_up 'test')" = "~$TEST_DIR/tmp_nvm_find_up" ] || die "failed to find 1 dir up"
#[ "~$(PWD=$TEST_DIR/tmp_nvm_find_up/a/b nvm_find_up 'test')" = "~$TEST_DIR/tmp_nvm_find_up" ] || die "failed to find 2 dirs up"
#[ "~$(PWD=$TEST_DIR/tmp_nvm_find_up/a/b/c nvm_find_up 'test')" = "~$TEST_DIR/tmp_nvm_find_up/a/b/c" ] || die "failed to find in current dir"
#[ "~$(PWD=$TEST_DIR/tmp_nvm_find_up/a/b/c/d nvm_find_up 'test')" = "~$TEST_DIR/tmp_nvm_find_up/a/b/c" ] || die "failed to find 1 level up from current dir"
#
#cleanup
#
}

@test './Unit tests/nvm_format_version' {
##!/bin/sh
#
#die () { echo $@ ; exit 1; }
#
#. ../../../nvm.sh
#
#OUTPUT="$(nvm_format_version 0.1.2)"
#EXPECTED_OUTPUT="v0.1.2"
#[ "_$OUTPUT" = "_$EXPECTED_OUTPUT" ] || die "nvm_format_version 0.1.2 did not return $EXPECTED_OUTPUT; got $OUTPUT"
#
#OUTPUT="$(nvm_format_version 0.1)"
#EXPECTED_OUTPUT="v0.1.0"
#[ "_$OUTPUT" = "_$EXPECTED_OUTPUT" ] || die "nvm_format_version 0.1.0 did not return $EXPECTED_OUTPUT; got $OUTPUT"
#
}

@test './Unit tests/nvm_has' {
##!/bin/sh
#
#die () { echo $@ ; exit 1; }
#
#. ../../../nvm.sh
#
#nvm_has cat && type cat > /dev/null || die 'nvm_has locates "cat" properly'
#
#[ "~$(nvm_has foobarbaz 2>&1)" = "~" ] || die "nvm_has does not suppress error output"
#
#! nvm_has foobarbaz && ! type foobarbaz >/dev/null 2>&1 || die "nvm_has does not return a nonzero exit code when not found"
#
}

@test './Unit tests/nvm_has_system_node' {
##!/bin/sh
#
#cleanup () {
#  rm ../../../v0.1.2/node
#  rmdir ../../../v0.1.2
#}
#die () { echo $@ ; exit 1; }
#
#. ../../../nvm.sh
#
#mkdir ../../../v0.1.2
#touch ../../../v0.1.2/node
#
#nvm use 0.1.2
#
#if command -v node; then
#  nvm_has_system_node
#else
#  ! nvm_has_system_node
#fi
#
#nvm deactivate /dev/null 2>&1
#
#if command -v node; then
#  nvm_has_system_node
#else
#  ! nvm_has_system_node
#fi
#
}

@test './Unit tests/nvm_ls_current' {
##!/bin/sh
#
#die () { echo $@ ; exit 1; }
#
#. ../../../nvm.sh
#
#return_zero () { return 0; }
#
#[ "$(nvm deactivate > /dev/null 2>&1 ; nvm_ls_current)" = "system" ] || die 'when deactivated, did not return "system"'
#
#TEST_PWD=$(pwd)
#TEST_DIR="$TEST_PWD/nvm_ls_current_tmp"
#rm -rf "$TEST_DIR"
#mkdir "$TEST_DIR"
#ln -s "$(which which)" "$TEST_DIR/which"
#ln -s "$(which dirname)" "$TEST_DIR/dirname"
#
#[ "$(PATH="$TEST_DIR" nvm_ls_current)" = "none" ] || die 'when node not installed, nvm_ls_current did not return "none"'
#[ "@$(PATH="$TEST_DIR" nvm_ls_current 2> /dev/stdout 1> /dev/null)@" = "@@" ] || die 'when node not installed, nvm_ls_current returned error output'
#
#echo "#!/bin/bash" > "$TEST_DIR/node"
#echo "echo 'VERSION FOO!'" > "$TEST_DIR/node"
#chmod a+x "$TEST_DIR/node"
#
#[ "$(alias nvm_tree_contains_path='return_zero' && PATH="$TEST_DIR" nvm_ls_current)" = "VERSION FOO!" ] || die 'when activated, did not return nvm node version'
#
#rm -rf "$TEST_DIR"
#
}

@test './Unit tests/nvm_ls_remote' {
##!/bin/sh
#
#die () { echo $@ ; cleanup ; exit 1; }
#
#cleanup() {
#  unset -f nvm_download
#}
#
#. ../../../nvm.sh
#
## sample output at the time the test was written
#nvm_download() {
#  echo 'foo "v0.10.0'
#  echo 'foo "v0.10.0'
#  echo 'foo "v0.10.1'
#  echo 'foo "v0.10.1'
#  echo 'foo "v0.10.10'
#  echo 'foo "v0.10.10'
#  echo 'foo "v0.10.11'
#  echo 'foo "v0.10.11'
#  echo 'foo "v0.10.12'
#  echo 'foo "v0.10.12'
#  echo 'foo "v0.10.13'
#  echo 'foo "v0.10.13'
#  echo 'foo "v0.10.14'
#  echo 'foo "v0.10.14'
#  echo 'foo "v0.10.15'
#  echo 'foo "v0.10.15'
#  echo 'foo "v0.10.16'
#  echo 'foo "v0.10.16'
#  echo 'foo "v0.10.16'
#  echo 'foo "v0.10.16'
#  echo 'foo "v0.10.17'
#  echo 'foo "v0.10.17'
#  echo 'foo "v0.10.18'
#  echo 'foo "v0.10.18'
#  echo 'foo "v0.10.19'
#  echo 'foo "v0.10.19'
#  echo 'foo "v0.10.2'
#  echo 'foo "v0.10.2'
#  echo 'foo "v0.10.20'
#  echo 'foo "v0.10.20'
#  echo 'foo "v0.10.21'
#  echo 'foo "v0.10.21'
#  echo 'foo "v0.10.22'
#  echo 'foo "v0.10.22'
#  echo 'foo "v0.10.23'
#  echo 'foo "v0.10.23'
#  echo 'foo "v0.10.24'
#  echo 'foo "v0.10.24'
#  echo 'foo "v0.10.25'
#  echo 'foo "v0.10.25'
#  echo 'foo "v0.10.26'
#  echo 'foo "v0.10.26'
#  echo 'foo "v0.10.27'
#  echo 'foo "v0.10.27'
#  echo 'foo "v0.10.28'
#  echo 'foo "v0.10.28'
#  echo 'foo "v0.10.29'
#  echo 'foo "v0.10.29'
#  echo 'foo "v0.10.3'
#  echo 'foo "v0.10.3'
#  echo 'foo "v0.10.30'
#  echo 'foo "v0.10.30'
#  echo 'foo "v0.10.31'
#  echo 'foo "v0.10.31'
#  echo 'foo "v0.10.32'
#  echo 'foo "v0.10.32'
#  echo 'foo "v0.10.4'
#  echo 'foo "v0.10.4'
#  echo 'foo "v0.10.5'
#  echo 'foo "v0.10.5'
#  echo 'foo "v0.10.6'
#  echo 'foo "v0.10.6'
#  echo 'foo "v0.10.7'
#  echo 'foo "v0.10.7'
#  echo 'foo "v0.10.8'
#  echo 'foo "v0.10.8'
#  echo 'foo "v0.10.9'
#  echo 'foo "v0.10.9'
#  echo 'foo "v0.11.0'
#  echo 'foo "v0.11.0'
#  echo 'foo "v0.11.1'
#  echo 'foo "v0.11.1'
#  echo 'foo "v0.11.10'
#  echo 'foo "v0.11.10'
#  echo 'foo "v0.11.11'
#  echo 'foo "v0.11.11'
#  echo 'foo "v0.11.12'
#  echo 'foo "v0.11.12'
#  echo 'foo "v0.11.13'
#  echo 'foo "v0.11.13'
#  echo 'foo "v0.11.14'
#  echo 'foo "v0.11.14'
#  echo 'foo "v0.11.2'
#  echo 'foo "v0.11.2'
#  echo 'foo "v0.11.3'
#  echo 'foo "v0.11.3'
#  echo 'foo "v0.11.4'
#  echo 'foo "v0.11.4'
#  echo 'foo "v0.11.5'
#  echo 'foo "v0.11.5'
#  echo 'foo "v0.11.6'
#  echo 'foo "v0.11.6'
#  echo 'foo "v0.11.7'
#  echo 'foo "v0.11.7'
#  echo 'foo "v0.11.8'
#  echo 'foo "v0.11.8'
#  echo 'foo "v0.11.9'
#  echo 'foo "v0.11.9'
#  echo 'foo "v0.5.1'
#  echo 'foo "v0.5.1'
#  echo 'foo "v0.5.10'
#  echo 'foo "v0.5.10'
#  echo 'foo "v0.5.2'
#  echo 'foo "v0.5.2'
#  echo 'foo "v0.5.3'
#  echo 'foo "v0.5.3'
#  echo 'foo "v0.5.4'
#  echo 'foo "v0.5.4'
#  echo 'foo "v0.5.5'
#  echo 'foo "v0.5.5'
#  echo 'foo "v0.5.6'
#  echo 'foo "v0.5.6'
#  echo 'foo "v0.5.7'
#  echo 'foo "v0.5.7'
#  echo 'foo "v0.5.8'
#  echo 'foo "v0.5.8'
#  echo 'foo "v0.5.9'
#  echo 'foo "v0.5.9'
#  echo 'foo "v0.6.0'
#  echo 'foo "v0.6.0'
#  echo 'foo "v0.6.1'
#  echo 'foo "v0.6.1'
#  echo 'foo "v0.6.10'
#  echo 'foo "v0.6.10'
#  echo 'foo "v0.6.11'
#  echo 'foo "v0.6.11'
#  echo 'foo "v0.6.12'
#  echo 'foo "v0.6.12'
#  echo 'foo "v0.6.13'
#  echo 'foo "v0.6.13'
#  echo 'foo "v0.6.14'
#  echo 'foo "v0.6.14'
#  echo 'foo "v0.6.15'
#  echo 'foo "v0.6.15'
#  echo 'foo "v0.6.16'
#  echo 'foo "v0.6.16'
#  echo 'foo "v0.6.17'
#  echo 'foo "v0.6.17'
#  echo 'foo "v0.6.18'
#  echo 'foo "v0.6.18'
#  echo 'foo "v0.6.19'
#  echo 'foo "v0.6.19'
#  echo 'foo "v0.6.2'
#  echo 'foo "v0.6.2'
#  echo 'foo "v0.6.20'
#  echo 'foo "v0.6.20'
#  echo 'foo "v0.6.21'
#  echo 'foo "v0.6.21'
#  echo 'foo "v0.6.3'
#  echo 'foo "v0.6.3'
#  echo 'foo "v0.6.4'
#  echo 'foo "v0.6.4'
#  echo 'foo "v0.6.5'
#  echo 'foo "v0.6.5'
#  echo 'foo "v0.6.6'
#  echo 'foo "v0.6.6'
#  echo 'foo "v0.6.7'
#  echo 'foo "v0.6.7'
#  echo 'foo "v0.6.8'
#  echo 'foo "v0.6.8'
#  echo 'foo "v0.6.9'
#  echo 'foo "v0.6.9'
#  echo 'foo "v0.7.0'
#  echo 'foo "v0.7.0'
#  echo 'foo "v0.7.1'
#  echo 'foo "v0.7.1'
#  echo 'foo "v0.7.10'
#  echo 'foo "v0.7.10'
#  echo 'foo "v0.7.11'
#  echo 'foo "v0.7.11'
#  echo 'foo "v0.7.12'
#  echo 'foo "v0.7.12'
#  echo 'foo "v0.7.2'
#  echo 'foo "v0.7.2'
#  echo 'foo "v0.7.3'
#  echo 'foo "v0.7.3'
#  echo 'foo "v0.7.4'
#  echo 'foo "v0.7.4'
#  echo 'foo "v0.7.5'
#  echo 'foo "v0.7.5'
#  echo 'foo "v0.7.6'
#  echo 'foo "v0.7.6'
#  echo 'foo "v0.7.7'
#  echo 'foo "v0.7.7'
#  echo 'foo "v0.7.8'
#  echo 'foo "v0.7.8'
#  echo 'foo "v0.7.9'
#  echo 'foo "v0.7.9'
#  echo 'foo "v0.8.0'
#  echo 'foo "v0.8.0'
#  echo 'foo "v0.8.1'
#  echo 'foo "v0.8.1'
#  echo 'foo "v0.8.10'
#  echo 'foo "v0.8.10'
#  echo 'foo "v0.8.11'
#  echo 'foo "v0.8.11'
#  echo 'foo "v0.8.12'
#  echo 'foo "v0.8.12'
#  echo 'foo "v0.8.13'
#  echo 'foo "v0.8.13'
#  echo 'foo "v0.8.14'
#  echo 'foo "v0.8.14'
#  echo 'foo "v0.8.15'
#  echo 'foo "v0.8.15'
#  echo 'foo "v0.8.16'
#  echo 'foo "v0.8.16'
#  echo 'foo "v0.8.17'
#  echo 'foo "v0.8.17'
#  echo 'foo "v0.8.18'
#  echo 'foo "v0.8.18'
#  echo 'foo "v0.8.19'
#  echo 'foo "v0.8.19'
#  echo 'foo "v0.8.2'
#  echo 'foo "v0.8.2'
#  echo 'foo "v0.8.20'
#  echo 'foo "v0.8.20'
#  echo 'foo "v0.8.21'
#  echo 'foo "v0.8.21'
#  echo 'foo "v0.8.22'
#  echo 'foo "v0.8.22'
#  echo 'foo "v0.8.23'
#  echo 'foo "v0.8.23'
#  echo 'foo "v0.8.24'
#  echo 'foo "v0.8.24'
#  echo 'foo "v0.8.25'
#  echo 'foo "v0.8.25'
#  echo 'foo "v0.8.26'
#  echo 'foo "v0.8.26'
#  echo 'foo "v0.8.27'
#  echo 'foo "v0.8.27'
#  echo 'foo "v0.8.28'
#  echo 'foo "v0.8.28'
#  echo 'foo "v0.8.3'
#  echo 'foo "v0.8.3'
#  echo 'foo "v0.8.4'
#  echo 'foo "v0.8.4'
#  echo 'foo "v0.8.5'
#  echo 'foo "v0.8.5'
#  echo 'foo "v0.8.6'
#  echo 'foo "v0.8.6'
#  echo 'foo "v0.8.7'
#  echo 'foo "v0.8.7'
#  echo 'foo "v0.8.8'
#  echo 'foo "v0.8.8'
#  echo 'foo "v0.8.9'
#  echo 'foo "v0.8.9'
#  echo 'foo "v0.9.0'
#  echo 'foo "v0.9.0'
#  echo 'foo "v0.9.1'
#  echo 'foo "v0.9.1'
#  echo 'foo "v0.9.10'
#  echo 'foo "v0.9.10'
#  echo 'foo "v0.9.11'
#  echo 'foo "v0.9.11'
#  echo 'foo "v0.9.12'
#  echo 'foo "v0.9.12'
#  echo 'foo "v0.9.2'
#  echo 'foo "v0.9.2'
#  echo 'foo "v0.9.3'
#  echo 'foo "v0.9.3'
#  echo 'foo "v0.9.4'
#  echo 'foo "v0.9.4'
#  echo 'foo "v0.9.5'
#  echo 'foo "v0.9.5'
#  echo 'foo "v0.9.6'
#  echo 'foo "v0.9.6'
#  echo 'foo "v0.9.7'
#  echo 'foo "v0.9.7'
#  echo 'foo "v0.9.8'
#  echo 'foo "v0.9.8'
#  echo 'foo "v0.9.9'
#  echo 'foo "v0.9.9'
#  echo 'foo "v0.1.100'
#  echo 'foo "v0.1.100'
#  echo 'foo "v0.1.101'
#  echo 'foo "v0.1.101'
#  echo 'foo "v0.1.102'
#  echo 'foo "v0.1.102'
#  echo 'foo "v0.1.103'
#  echo 'foo "v0.1.103'
#  echo 'foo "v0.1.104'
#  echo 'foo "v0.1.104'
#  echo 'foo "v0.1.14'
#  echo 'foo "v0.1.14'
#  echo 'foo "v0.1.15'
#  echo 'foo "v0.1.15'
#  echo 'foo "v0.1.16'
#  echo 'foo "v0.1.16'
#  echo 'foo "v0.1.17'
#  echo 'foo "v0.1.17'
#  echo 'foo "v0.1.18'
#  echo 'foo "v0.1.18'
#  echo 'foo "v0.1.19'
#  echo 'foo "v0.1.19'
#  echo 'foo "v0.1.20'
#  echo 'foo "v0.1.20'
#  echo 'foo "v0.1.21'
#  echo 'foo "v0.1.21'
#  echo 'foo "v0.1.22'
#  echo 'foo "v0.1.22'
#  echo 'foo "v0.1.23'
#  echo 'foo "v0.1.23'
#  echo 'foo "v0.1.24'
#  echo 'foo "v0.1.24'
#  echo 'foo "v0.1.25'
#  echo 'foo "v0.1.25'
#  echo 'foo "v0.1.26'
#  echo 'foo "v0.1.26'
#  echo 'foo "v0.1.27'
#  echo 'foo "v0.1.27'
#  echo 'foo "v0.1.28'
#  echo 'foo "v0.1.28'
#  echo 'foo "v0.1.29'
#  echo 'foo "v0.1.29'
#  echo 'foo "v0.1.30'
#  echo 'foo "v0.1.30'
#  echo 'foo "v0.1.31'
#  echo 'foo "v0.1.31'
#  echo 'foo "v0.1.32'
#  echo 'foo "v0.1.32'
#  echo 'foo "v0.1.33'
#  echo 'foo "v0.1.33'
#  echo 'foo "v0.1.90'
#  echo 'foo "v0.1.90'
#  echo 'foo "v0.1.91'
#  echo 'foo "v0.1.91'
#  echo 'foo "v0.1.92'
#  echo 'foo "v0.1.92'
#  echo 'foo "v0.1.93'
#  echo 'foo "v0.1.93'
#  echo 'foo "v0.1.94'
#  echo 'foo "v0.1.94'
#  echo 'foo "v0.1.95'
#  echo 'foo "v0.1.95'
#  echo 'foo "v0.1.96'
#  echo 'foo "v0.1.96'
#  echo 'foo "v0.1.97'
#  echo 'foo "v0.1.97'
#  echo 'foo "v0.1.98'
#  echo 'foo "v0.1.98'
#  echo 'foo "v0.1.99'
#  echo 'foo "v0.1.99'
#  echo 'foo "v0.10.14'
#  echo 'foo "v0.10.14'
#  echo 'foo "v0.2.0'
#  echo 'foo "v0.2.0'
#  echo 'foo "v0.2.1'
#  echo 'foo "v0.2.1'
#  echo 'foo "v0.2.2'
#  echo 'foo "v0.2.2'
#  echo 'foo "v0.2.3'
#  echo 'foo "v0.2.3'
#  echo 'foo "v0.2.4'
#  echo 'foo "v0.2.4'
#  echo 'foo "v0.2.5'
#  echo 'foo "v0.2.5'
#  echo 'foo "v0.2.6'
#  echo 'foo "v0.2.6'
#  echo 'foo "v0.3.0'
#  echo 'foo "v0.3.0'
#  echo 'foo "v0.3.1'
#  echo 'foo "v0.3.1'
#  echo 'foo "v0.3.2'
#  echo 'foo "v0.3.2'
#  echo 'foo "v0.3.3'
#  echo 'foo "v0.3.3'
#  echo 'foo "v0.3.4'
#  echo 'foo "v0.3.4'
#  echo 'foo "v0.3.5'
#  echo 'foo "v0.3.5'
#  echo 'foo "v0.3.6'
#  echo 'foo "v0.3.6'
#  echo 'foo "v0.3.7'
#  echo 'foo "v0.3.7'
#  echo 'foo "v0.3.8'
#  echo 'foo "v0.3.8'
#  echo 'foo "v0.4.0'
#  echo 'foo "v0.4.0'
#  echo 'foo "v0.4.1'
#  echo 'foo "v0.4.1'
#  echo 'foo "v0.4.10'
#  echo 'foo "v0.4.10'
#  echo 'foo "v0.4.11'
#  echo 'foo "v0.4.11'
#  echo 'foo "v0.4.12'
#  echo 'foo "v0.4.12'
#  echo 'foo "v0.4.2'
#  echo 'foo "v0.4.2'
#  echo 'foo "v0.4.3'
#  echo 'foo "v0.4.3'
#  echo 'foo "v0.4.4'
#  echo 'foo "v0.4.4'
#  echo 'foo "v0.4.5'
#  echo 'foo "v0.4.5'
#  echo 'foo "v0.4.6'
#  echo 'foo "v0.4.6'
#  echo 'foo "v0.4.7'
#  echo 'foo "v0.4.7'
#  echo 'foo "v0.4.8'
#  echo 'foo "v0.4.8'
#  echo 'foo "v0.4.9'
#  echo 'foo "v0.4.9'
#  echo 'foo "v0.5.0'
#  echo 'foo "v0.5.0'
#  echo 'foo "v0.6.1'
#  echo 'foo "v0.6.1'
#  echo 'foo "v0.6.10'
#  echo 'foo "v0.6.10'
#  echo 'foo "v0.6.11'
#  echo 'foo "v0.6.11'
#  echo 'foo "v0.6.12'
#  echo 'foo "v0.6.12'
#  echo 'foo "v0.6.13'
#  echo 'foo "v0.6.13'
#  echo 'foo "v0.6.2'
#  echo 'foo "v0.6.2'
#  echo 'foo "v0.6.3'
#  echo 'foo "v0.6.3'
#  echo 'foo "v0.6.4'
#  echo 'foo "v0.6.4'
#  echo 'foo "v0.6.5'
#  echo 'foo "v0.6.5'
#  echo 'foo "v0.6.6'
#  echo 'foo "v0.6.6'
#  echo 'foo "v0.6.7'
#  echo 'foo "v0.6.7'
#  echo 'foo "v0.6.8'
#  echo 'foo "v0.6.8'
#  echo 'foo "v0.6.9'
#  echo 'foo "v0.6.9'
#}
#
#OUTPUT="$(nvm_ls_remote foo)"
#EXIT_CODE="$(nvm_ls_remote foo >/dev/null 2>&1 ; echo $?)"
#[ "_$OUTPUT" = "_N/A" ] || die "nonexistent version did not report N/A"
#[ "_$EXIT_CODE" = "_3" ] || die "nonexistent version did not exit with code 3, got $EXIT_CODE"
#
#OUTPUT="$(nvm_ls_remote)"
#EXPECTED_OUTPUT="$(nvm_download | \egrep -o 'v[0-9]+\.[0-9]+\.[0-9]+' | sort -t. -u -k 1.2,1n -k 2,2n -k 3,3n)"
#[ "_$OUTPUT" = "_$EXPECTED_OUTPUT" ] || die "bare nvm_ls_remote did not output expected sorted versions; got $(echo "$OUTPUT") expected $(echo "$EXPECTED_OUTPUT")"
#
#OUTPUT="$(nvm_ls_remote 0.3)"
#EXPECTED_OUTPUT="v0.3.0
#v0.3.1
#v0.3.2
#v0.3.3
#v0.3.4
#v0.3.5
#v0.3.6
#v0.3.7
#v0.3.8"
#
#[ "_$OUTPUT" = "_$EXPECTED_OUTPUT" ] || die "nvm_ls_remote 0.3 did not output 0.3.x versions; got $OUTPUT"
#
## Sanity checks
#OUTPUT="$(nvm_print_implicit_alias remote stable)"
#EXPECTED_OUTPUT="0.10"
#[ "_$OUTPUT" = "_$EXPECTED_OUTPUT" ] || die "nvm_print_implicit_alias remote stable did not output $EXPECTED_OUTPUT; got $OUTPUT"
#
#OUTPUT="$(nvm_print_implicit_alias remote unstable)"
#EXPECTED_OUTPUT="0.11"
#[ "_$OUTPUT" = "_$EXPECTED_OUTPUT" ] || die "nvm_print_implicit_alias remote unstable did not output $EXPECTED_OUTPUT; got $OUTPUT"
#
#OUTPUT="$(nvm_ls_remote stable)"
#EXPECTED_OUTPUT="v0.10.32"
#[ "_$OUTPUT" = "_$EXPECTED_OUTPUT" ] || die "nvm_ls_remote stable did not output $EXPECTED_OUTPUT; got $OUTPUT"
#
#OUTPUT="$(nvm_ls_remote unstable)"
#EXPECTED_OUTPUT="v0.11.14"
#[ "_$OUTPUT" = "_$EXPECTED_OUTPUT" ] || die "nvm_ls_remote unstable did not output $EXPECTED_OUTPUT; got $OUTPUT"
#
#cleanup
#
}

@test './Unit tests/nvm_num_version_groups' {
##!/bin/sh
#
#die () { echo $@ ; exit 1; }
#
#. ../../../nvm.sh
#
#[ "~$(nvm_num_version_groups)" = "~0" ] || die "no args should give 0"
#[ "~$(nvm_num_version_groups a)" = "~1" ] || die "one letter should give 1"
#
#[ "~$(nvm_num_version_groups 1)" = "~1" ] || die "1 should give 1"
#[ "~$(nvm_num_version_groups v1)" = "~1" ] || die "v1 should give 1"
#[ "~$(nvm_num_version_groups v1.)" = "~1" ] || die "v1. should give 1"
#
#[ "~$(nvm_num_version_groups 1.2)" = "~2" ] || die "1.2 should give 2"
#[ "~$(nvm_num_version_groups v1.2)" = "~2" ] || die "v1.2 should give 2"
#[ "~$(nvm_num_version_groups v1.2.)" = "~2" ] || die "v1.2. should give 2"
#
#[ "~$(nvm_num_version_groups 1.2.3)" = "~3" ] || die "1.2.3 should give 3"
#[ "~$(nvm_num_version_groups v1.2.3)" = "~3" ] || die "v1.2.3 should give 3"
#[ "~$(nvm_num_version_groups v1.2.3.)" = "~3" ] || die "v1.2.3. should give 3"
#
}

@test './Unit tests/nvm_prepend_path' {
##!/bin/sh
#
#die () { echo $@ ; exit 1; }
#
#. ../../../nvm.sh
#
#TEST_PATH=/usr/bin:/usr/local/bin
#
#NEW_PATH=`nvm_prepend_path "$TEST_PATH" "$NVM_DIR/v0.2.5/bin"`
#
#[ "$NEW_PATH" = "$NVM_DIR/v0.2.5/bin:/usr/bin:/usr/local/bin" ] || die "Not correctly prepended: $NEW_PATH "
#
#
#EMPTY_PATH=
#
#NEW_PATH=`nvm_prepend_path "$EMPTY_PATH" "$NVM_DIR/v0.2.5/bin"`
#
#[ "$NEW_PATH" = "$NVM_DIR/v0.2.5/bin" ] || die "Not correctly prepended: $NEW_PATH "
}

@test './Unit tests/nvm_print_implicit_alias errors' {
##!/bin/sh
#
#die () { echo $@ ; exit 1; }
#
#. ../../../nvm.sh
#
#EXPECTED_FIRST_MSG="nvm_print_implicit_alias must be specified with local or remote as the first argument."
#[ "_$(nvm_print_implicit_alias 2>&1)" = "_$EXPECTED_FIRST_MSG" ] \
#  || die "nvm_print_implicit_alias did not require local|remote as first argument"
#[ "_$(nvm_print_implicit_alias foo 2>&1)" = "_$EXPECTED_FIRST_MSG" ] \
#  || die "nvm_print_implicit_alias did not require local|remote as first argument"
#
#FIRST_EXIT_CODE="$(nvm_print_implicit_alias > /dev/null 2>&1 ; echo $?)"
#[ "_$FIRST_EXIT_CODE" = "_1" ] \
#  || die "nvm_print_implicit_alias without local|remote had wrong exit code: expected 1, got $FIRST_EXIT_CODE"
#
#EXPECTED_SECOND_MSG="Only implicit aliases 'stable' and 'unstable' are supported."
#[ "_$(nvm_print_implicit_alias local 2>&1)" = "_$EXPECTED_SECOND_MSG" ] \
#  || die "nvm_print_implicit_alias did not require stable|unstable as second argument"
#[ "_$(nvm_print_implicit_alias local foo 2>&1)" = "_$EXPECTED_SECOND_MSG" ] \
#  || die "nvm_print_implicit_alias did not require stable|unstable as second argument"
#
#SECOND_EXIT_CODE="$(nvm_print_implicit_alias local > /dev/null 2>&1 ; echo $?)"
#[ "_$SECOND_EXIT_CODE" = "_2" ] \
#  || die "nvm_print_implicit_alias without stable|unstable had wrong exit code: expected 2, got $SECOND_EXIT_CODE"
#
}

@test './Unit tests/nvm_print_implicit_alias success' {
##!/bin/sh
#
#die () { echo $@ ; cleanup ; exit 1; }
#cleanup() {
#  rm -rf ../../../v0.2.3
#  rm -rf ../../../v0.3.4
#  rm -rf ../../../v0.4.6
#  rm -rf ../../../v0.5.7
#  rm -rf ../../../v0.7.7
#  unset -f nvm_ls_remote
#}
#
#. ../../../nvm.sh
#
#mkdir ../../../v0.2.3
#mkdir ../../../v0.3.4
#mkdir ../../../v0.4.6
#mkdir ../../../v0.5.7
#mkdir ../../../v0.7.7
#
#LATEST_STABLE="$(nvm_print_implicit_alias local stable)"
#[ "_$LATEST_STABLE" = "_0.4" ] || die "local stable is not latest even minor: expected 0.4, got $LATEST_STABLE"
#
#LATEST_UNSTABLE="$(nvm_print_implicit_alias local unstable)"
#[ "_$LATEST_UNSTABLE" = "_0.7" ] || die "local unstable is not latest odd minor: expected 0.7, got $LATEST_UNSTABLE"
#
#nvm_ls_remote() {
#  echo "v0.4.3"
#  echo "v0.5.4"
#  echo "v0.6.6"
#  echo "v0.7.7"
#  echo "v0.9.7"
#  echo "v0.4.3"
#  echo "v0.5.4"
#  echo "v0.6.6"
#  echo "v0.7.7"
#  echo "v0.9.7"
#}
#
#LATEST_STABLE="$(nvm_print_implicit_alias remote stable)"
#[ "_$LATEST_STABLE" = "_0.6" ] || die "remote stable is not latest even minor: expected 0.6, got $LATEST_STABLE"
#
#LATEST_UNSTABLE="$(nvm_print_implicit_alias remote unstable)"
#[ "_$LATEST_UNSTABLE" = "_0.9" ] || die "remote unstable is not latest odd minor: expected 0.9, got $LATEST_UNSTABLE"
#
#cleanup
#
}

@test './Unit tests/nvm_remote_version' {
##!/bin/sh
#
#die () { echo $@ ; cleanup ; exit 1; }
#
#cleanup() {
#  unset -f nvm_ls_remote
#}
#
#. ../../../nvm.sh
#
#nvm_ls_remote() {
#  echo "N/A"
#}
#
#OUTPUT="$(nvm_remote_version foo)"
#EXIT_CODE="$(nvm_remote_version foo >/dev/null 2>&1 ; echo $?)"
#
#[ "_$OUTPUT" = "_N/A" ] || die "nonexistent version did not report N/A"
#[ "_$EXIT_CODE" = "_3" ] || die "nonexistent version did not exit with code 3, got $EXIT_CODE"
#
#nvm_ls_remote() {
#  echo "test output"
#  echo "more test output"
#  echo "pattern received: _$1_"
#}
#
#OUTPUT="$(nvm_remote_version foo)"
#EXIT_CODE="$(nvm_remote_version foo >/dev/null 2>&1 ; echo $?)"
#
#[ "_$OUTPUT" = "_pattern received: _foo_" ] \
#  || die "nvm_remote_version foo did not return last line only of nvm_ls_remote foo; got $OUTPUT"
#[ "_$EXIT_CODE" = "_0" ] || die "nvm_remote_version foo did not exit with 0, got $EXIT_CODE"
#
#cleanup
#
}

@test './Unit tests/nvm_strip_path' {
##!/bin/sh
#
#die () { echo $@ ; exit 1; }
#
#. ../../../nvm.sh
#
#TEST_PATH=$NVM_DIR/v0.10.5/bin:/usr/bin:$NVM_DIR/v0.11.5/bin:$NVM_DIR/v0.9.5/bin:/usr/local/bin:$NVM_DIR/v0.2.5/bin
#
#STRIPPED_PATH=`nvm_strip_path "$TEST_PATH" "/bin"`
#
#[ "$STRIPPED_PATH" = "/usr/bin:/usr/local/bin" ] || die "Not correctly stripped: $STRIPPED_PATH "
}

@test './Unit tests/nvm_tree_contains_path' {
##!/bin/sh
#
#cleanup () {
#  rm tmp/node
#  rmdir tmp
#  rm tmp2/node
#  rmdir tmp2
#}
#die () { echo $@ ; cleanup; exit 1; }
#
#. ../../../nvm.sh
#
#mkdir -p tmp
#touch tmp/node
#mkdir -p tmp2
#touch tmp2/node
#
#[ "$(nvm_tree_contains_path 2>&1)" = "both the tree and the node path are required" ] || die 'incorrect error message with no args'
#[ "$(nvm_tree_contains_path > /dev/null 2>&1 ; echo $?)" = "2" ] || die 'incorrect error code with no args'
#[ "$(nvm_tree_contains_path tmp 2>&1)" = "both the tree and the node path are required" ] || die 'incorrect error message with one arg'
#[ "$(nvm_tree_contains_path > /dev/null 2>&1 ; echo $?)" = "2" ] || die 'incorrect error code with one arg'
#
#nvm_tree_contains_path tmp tmp/node || die '"tmp" should contain "tmp/node"'
#
#nvm_tree_contains_path tmp tmp2/node && die '"tmp" should not contain "tmp2/node"'
#
#nvm_tree_contains_path tmp2 tmp2/node || die '"tmp2" should contain "tmp2/node"'
#
#nvm_tree_contains_path tmp2 tmp/node && die '"tmp2" should not contain "tmp/node"'
#
#cleanup
#
}

@test './Unit tests/nvm_validate_implicit_alias' {
##!/bin/sh
#
#die () { echo $@ ; exit 1; }
#
#. ../../../nvm.sh
#
#EXPECTED_MSG="Only implicit aliases 'stable' and 'unstable' are supported."
#[ "_$(nvm_validate_implicit_alias 2>&1)" = "_$EXPECTED_MSG" ] \
#  || die "nvm_validate_implicit_alias did not require stable|unstable"
#[ "_$(nvm_validate_implicit_alias foo 2>&1)" = "_$EXPECTED_MSG" ] \
#  || die "nvm_validate_implicit_alias did not require stable|unstable"
#
#EXIT_CODE="$(nvm_validate_implicit_alias >/dev/null 2>&1 ; echo $?)"
#[ "_$EXIT_CODE" = "_1" ] \
#  || die "nvm_validate_implicit_alias without stable|unstable had wrong exit code: expected 1, got $EXIT_CODE"
#
#nvm_validate_implicit_alias stable || die "nvm_validate_implicit_alias stable did not exit 0"
#nvm_validate_implicit_alias unstable || die "nvm_validate_implicit_alias unstable did not exit 0"
#
}

@test './Unit tests/nvm_version_dir' {
##!/bin/sh
#
#die () { echo $@ ; exit 1; }
#
#. ../../../nvm.sh
#
#[ "$(nvm_version_dir)" = "$NVM_DIR/versions" ] || die '"nvm_version_dir" did not return new dir path'
#[ "$(nvm_version_dir new)" = "$(nvm_version_dir)" ] || die '"nvm_version_dir new" did not return new dir path'
#[ "$(nvm_version_dir old)" = "$NVM_DIR" ] || die '"nvm_version_dir old" did not return old dir path'
#[ "$(nvm_version_dir foo 2>&1)" = "unknown version dir" ] || die '"nvm_version_dir foo" did not error out'
#
}

@test './Unit tests/nvm_version_greater' {
##!/bin/sh
#
#die () { echo $@ ; exit 1; }
#
#. ../../../nvm.sh
#
#nvm_version_greater 0.10.0 0.2.12 || die '"nvm_version_greater 0.10.0 0.2.12" did not return true'
#
#if nvm_version_greater 0.10.0 0.20.12; then
#  die '"nvm_version_greater 0.10.0 0.20.12" returned true'
#fi
#
#if nvm_version_greater 0.10.0 0.10.0; then
#  die '"nvm_version_greater" returned false for the same two versions'
#fi
#
}

@test './Unit tests/nvm_version_path' {
##!/bin/sh
#
#die () { echo $@ ; exit 1; }
#
#. ../../../nvm.sh
#
#[ "$(nvm_version_path foo)" = "$NVM_DIR/foo" ] || die '"nvm_version_path foo" did not return correct location'
#[ "$(nvm_version_path 2>&1)" = "version is required" ] || die '"nvm_version_path" did not error out'
#[ "$(nvm_version_path v0.11.0)" = "$NVM_DIR/v0.11.0" ] || die 'old version has the wrong path'
#[ "$(nvm_version_path v0.12.0)" = "$NVM_DIR/versions/v0.12.0" ] || die 'new version has the wrong path'
#
}
