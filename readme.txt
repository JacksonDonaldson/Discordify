An installable windows application that uses FFmpeg to create a right-click context menu action for .mp4 files 
to compress them to under 25mb - Discord's file size limit for free users. Reliability for .mp4 files of 
untested formats is iffy; it's worked on everything I've tried though.

To compile: Unzip ffmpeg and ffmprobe into this folder. 
Install NSIS, then run "MakeNSISW.exe," and drag "installer.nsi" into the window that pops up.

This uses FFmpeg (https://www.ffmpeg.org/), which
covered by the GNU General Public License, version 3
(http://www.gnu.org/licenses/gpl-3.0.html)

Source code available at: https://github.com/JacksonDonaldson/Discordify


