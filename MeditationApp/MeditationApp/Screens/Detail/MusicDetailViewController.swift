//
//  MusicDetailViewController.swift
//  MeditationApp
//
//  Created by Edanur Yildirim, Vodafone on 13.12.2024.
//

import UIKit
import AVKit
import AVFoundation

class MusicDetailViewController: UIViewController {
    @IBOutlet weak var musicImage: UIView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var musicSlider: UISlider!
    @IBOutlet weak var backwardButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    private var audioPlayer: AVAudioPlayer?
    private var videoPlayer: AVPlayer?
    private var videoPlayerLayer: AVPlayerLayer?
    private var progressUpdateTimer: Timer?
    private var playlist: [String] = ["example", "example", "example"]
    private var currentTrackIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioPlayer()
        setupUI()
        setupVideoBackground()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        videoPlayerLayer?.frame = musicImage.bounds
    }
    
    private func setupVideoBackground() {
        guard let videoURL = Bundle.main.url(forResource: "musicVideo", withExtension: "mov") else {
            print("Video file not found.")
            return
        }
        
        videoPlayer = AVPlayer(url: videoURL)
        videoPlayer?.actionAtItemEnd = .none
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
        videoPlayerLayer?.frame = musicImage.bounds
        videoPlayerLayer?.videoGravity = .resizeAspectFill
        
        if let videoPlayerLayer = videoPlayerLayer {
            musicImage.layer.addSublayer(videoPlayerLayer)
        }
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(loopVideo),
            name: .AVPlayerItemDidPlayToEndTime,
            object: videoPlayer?.currentItem
        )
        
        videoPlayer?.play()
    }
    
    @objc private func loopVideo() {
        videoPlayer?.seek(to: .zero)
        videoPlayer?.play()
    }
    
    private func setupUI() {
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.addTarget(self, action: #selector(didTapPlayPause), for: .touchUpInside)
        
        backwardButton.setImage(UIImage(systemName: "gobackward.10"), for: .normal)
        backwardButton.addTarget(self, action: #selector(didTapRewind), for: .touchUpInside)
        
        forwardButton.setImage(UIImage(systemName: "goforward.10"), for: .normal)
        forwardButton.addTarget(self, action: #selector(didTapForward), for: .touchUpInside)
        
        nextButton.setImage(UIImage(systemName: "forward.end"), for: .normal)
        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        
        previousButton.setImage(UIImage(systemName: "backward.end"), for: .normal)
        previousButton.addTarget(self, action: #selector(didTapPrevious), for: .touchUpInside)
        
        musicSlider.addTarget(self, action: #selector(didSlideProgress), for: .valueChanged)
    }
    
    private func setupAudioPlayer() {
        guard currentTrackIndex < playlist.count else { return }
        let trackName = playlist[currentTrackIndex]
        
        guard let url = Bundle.main.url(forResource: trackName, withExtension: "mp3") else {
            print("Audio file not found.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.delegate = self
            
            if let duration = audioPlayer?.duration {
                musicSlider.maximumValue = Float(duration)
            }
        } catch {
            print("Failed to initialize audio player: \(error)")
        }
    }
    
    @objc private func didFinishPlayingVideo() {
        videoPlayer?.seek(to: CMTime.zero)
        videoPlayer?.play()
    }
    
    private func playCurrentTrack() {
        setupAudioPlayer()
        audioPlayer?.play()
        playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        startProgressTimer()
    }
    
    @objc private func didTapPlayPause() {
        guard let player = audioPlayer else { return }
        
        if player.isPlaying {
            player.pause()
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            progressUpdateTimer?.invalidate()
        } else {
            player.play()
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            startProgressTimer()
        }
    }
    
    @objc private func didSlideProgress(_ sender: UISlider) {
        audioPlayer?.currentTime = TimeInterval(sender.value)
    }
    
    @objc private func didTapRewind() {
        guard let player = audioPlayer else { return }
        let newTime = max(player.currentTime - 10, 0)
        player.currentTime = newTime
        musicSlider.value = Float(newTime)
    }
    
    @objc private func didTapForward() {
        guard let player = audioPlayer else { return }
        let newTime = min(player.currentTime + 10, player.duration)
        player.currentTime = newTime
        musicSlider.value = Float(newTime)
    }
    
    @objc private func didTapNext() {
        if currentTrackIndex < playlist.count - 1 {
            currentTrackIndex += 1
            playCurrentTrack()
        }
    }
    
    @objc private func didTapPrevious() {
        if currentTrackIndex > 0 {
            currentTrackIndex -= 1
            playCurrentTrack()
        }
    }
    
    private func startProgressTimer() {
        progressUpdateTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self, let player = self.audioPlayer else { return }
            self.musicSlider.value = Float(player.currentTime)
        }
    }
}

extension MusicDetailViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        progressUpdateTimer?.invalidate()
        musicSlider.value = 0
    }
}
